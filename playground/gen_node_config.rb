require 'json'
require 'os'

if OS.mac?
  system "mkdir node_configs >> /dev/null 2>&1"
elsif OS.windows?
  `mkdir node_configs 2> nul`
end

f = File.new("#{Dir.pwd}/node_configs/#{ARGV[0]}.json", "w")
f.write( JSON.generate( { capabilities: [{ browserName: ARGV[0], maxInstances: 1, platform: "android" }],
                         configuration: { cleanUpCycle: 2000,
                                        timeout: 180000,
                                  registerCycle: 5000,
                                          proxy: "org.openqa.grid.selenium.proxy.DefaultRemoteProxy",
                                            url: "http://127.0.0.1:#{ARGV[1]}/wd/hub",
                                           host: "127.0.0.1",
                                           port: ARGV[1],
                                     maxSession: 1,
                                       register: true,
                                        hubPort: 4444,
                                        hubHost: "localhost" }}))
f.close