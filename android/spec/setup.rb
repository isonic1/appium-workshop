require_relative './pages/pages'
require 'bundler'
Bundler.require(:test)
require 'pathname'

include Faker

def thread
  ((ENV['TEST_ENV_NUMBER'].nil? || ENV['TEST_ENV_NUMBER'].empty?) ? 1 : ENV['TEST_ENV_NUMBER']).to_i
end

def get_device_data
  begin
    JSON.parse(ENV["DEVICES"]).find { |t| t["thread"].eql? thread }
  rescue
    {}
  end
end

def set_udid_environment_variable
  ENV["UDID"] = get_device_data["udid"]
end

def initialize_appium
  device = get_device_data
  caps = Appium.load_appium_txt file: File.join(File.dirname(__FILE__), "../appium.txt")
  caps[:caps][:udid] = device.fetch("udid", nil)
  caps[:caps][:deviceName] = device.fetch("name", caps[:caps][:deviceName])
  caps[:caps][:app] = ENV["APP_PATH"]
  caps[:appium_lib][:server_url] = ENV["SERVER_URL"]
  Appium::Driver.new(caps).start_driver
  Appium.promote_appium_methods Object

  require_relative "helpers"
  Appium.promote_singleton_appium_methods Helpers
end

def quit_appium
  driver_quit
end

def allure_report_setup
  AllureRSpec.configure do |config|
    config.include AllureRSpec::Adaptor
    config.output_dir = "#{ENV["PROJECT_DIR"]}/output/allure/#{thread}/"
    config.clean_dir = true
  end
  ParallelTests.first_process? ? FileUtils.rm_rf(AllureRSpec::Config.output_dir) : sleep(1)
end

def attach_report_files example
  example.attach_file("Hub Log: #{ENV["UDID"]}", File.new("#{ENV["PROJECT_DIR"]}/output/hub.log")) unless ENV["THREADS"].nil?
  dir = Dir.entries("#{ENV["PROJECT_DIR"]}/output/").grep(/#{ENV["UDID"]}/)
  files = dir.map { |file| { name: file.match(/(.*)-/)[1], file: "#{ENV["PROJECT_DIR"]}/output/#{file}" } }
  files.each { |file| example.attach_file(file[:name], File.new(file[:file])) } unless files.empty?
end