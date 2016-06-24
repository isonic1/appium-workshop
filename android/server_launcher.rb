require 'parallel'
require 'json'
require 'os'

def get_android_devices
  devs = (`adb devices`).split("\n").select { |x| x.include? "\tdevice" }.map.each_with_index { |d,i| { platform: "android", name: "android", udid: d.split("\t")[0], thread: i + 1 } }
  devices = devs.map { |x| x.merge(get_android_device_data(x[:udid]))}
  ENV["DEVICES"] = JSON.generate(devices)
  if devices.empty?
    puts "\nAborting...Connect at least one device or emulator!\n"
    abort
  else
    devices
  end
end

def get_android_device_data udid
  specs = { os: "ro.build.version.release", manufacturer: "ro.product.manufacturer", model: "ro.product.model", sdk: "ro.build.version.sdk" }
  hash = {}
  specs.each do |key, spec|
    value = `adb -s #{udid} shell getprop "#{spec}"`.strip
    hash.merge!({key=> "#{value}"})
  end
  hash
end

def save_device_data dev_array
  if dev_array.nil?
    puts "No connected devices..."
    abort
  end
  dev_array.each do |device|
    device.each do |k,v|
      open("output/specs-#{device[:udid]}.log", 'a') do |file|
        file << "#{k}: #{v}\n"
      end
    end
  end
end

def kill_process process
  if OS.mac?
    `ps -ef | grep #{process} | awk '{print $2}' | xargs kill >> /dev/null 2>&1`
  elsif OS.windows?
    pids = (`Wmic process where (Name like '%#{process}%') get ProcessId`).split
    pids.shift
    pids.each { |pid| system("taskkill /f /pid #{pid}") } unless pids.empty?
  end
end

def appium_server_start(**options)
  command = 'appium'
  command << " --nodeconfig #{options[:config]}" if options.key?(:config)
  command << " -p #{options[:port]}" if options.key?(:port)
  command << " -bp #{options[:bp]}" if options.key?(:bp)
  command << " --udid #{options[:udid]}" if options.key?(:udid)
  command << " --log #{Dir.pwd}/output/#{options[:log]}" if options.key?(:log)
  command << " --tmp /tmp/#{options[:tmp]}" if options.key?(:tmp)
  Dir.chdir('.') {
    if OS.mac?
      pid = spawn(command, :out=>"/dev/null")
    elsif OS.windows?
      pid = spawn("#{command} > NUL")
    end
    puts 'Waiting for Appium to start up...'
    sleep 10
    if pid.nil?
      puts 'Appium server did not start :('
    end
  }
end

def generate_node_config(file_name, appium_port, device)
  if OS.mac?
    system "mkdir node_configs >> /dev/null 2>&1"
  elsif OS.windows?
    `mkdir node_configs 2> nul`
  end
  f = File.new("#{Dir.pwd}/node_configs/#{file_name}", "w")
  f.write( JSON.generate(
  { capabilities: [{ browserName: device[:udid], maxInstances: 1, platform: "android" }],
                    configuration: { cleanUpCycle: 2000,
                                          timeout: 180000,
                                    registerCycle: 5000,
                                            proxy: "org.openqa.grid.selenium.proxy.DefaultRemoteProxy",
                                              url: "http://127.0.0.1:#{appium_port}/wd/hub",
                                             host: "127.0.0.1",
                                             port: appium_port,
                                       maxSession: 1,
                                         register: true,
                                          hubPort: 4444,
                                          hubHost: "localhost" }}))
  f.close
end

def start_hub
  if OS.mac?
    kill_process "selenium"
    spawn("java -jar selenium-server-standalone-2.53.0.jar -role hub -log #{Dir.pwd}/output/hub.log &", :out=>"/dev/null")
  elsif OS.windows?
    kill_process "java.exe"
    spawn("java -jar selenium-server-standalone-2.53.0.jar -role hub -log #{Dir.pwd}/output/hub.log > NUL")
  end
  sleep 3 #wait for hub to start...
end

def start_single_appium
  if OS.mac?
    kill_process "appium"
  elsif OS.windows?
    kill_process "node.exe"
  end
  devices = get_android_devices[0]
  save_device_data [devices]
  appium_server_start udid: devices[:udid], log: "appium-#{devices[:udid]}.log"
end

def launch_hub_and_nodes
  if OS.mac?
    kill_process "appium"
  elsif OS.windows?
    kill_process "node.exe"
  end
  start_hub #comment out or remove if you already have a hub running.
  devices = get_android_devices
  save_device_data devices
  ENV["THREADS"] = devices.size.to_s
  Parallel.map_with_index(devices, in_processes: devices.size) do |device, index|
    port = 4000 + index
    bp = 2250 + index
    config_name = "#{device[:udid]}.json"
    generate_node_config config_name, port, device
    node_config = "#{Dir.pwd}/node_configs/#{config_name}"
    appium_server_start config: node_config, port: port, bp: bp, udid: device[:udid], log: "appium-#{device[:udid]}.log", tmp: device[:udid]
  end
end