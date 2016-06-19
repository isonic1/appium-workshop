require_relative './pages/pages'
require 'bundler'
Bundler.require(:test)
include Faker

def thread
  ((ENV['TEST_ENV_NUMBER'].nil? || ENV['TEST_ENV_NUMBER'].empty?) ? 1 : ENV['TEST_ENV_NUMBER']).to_i
end

RSpec.configure do |config|
  config.color = true
  #config.tty = true

  config.before :all do
    caps = Appium.load_appium_txt file: File.join(File.dirname(__FILE__), "appium.txt")
    caps[:caps][:udid] = device.fetch("udid", nil)
    caps[:caps][:deviceName] = device.fetch("name", caps[:caps][:deviceName])
    caps[:caps][:app] = ENV["APP_PATH"]
    caps[:appium_lib][:server_url] = ENV["SERVER_URL"]

    @driver = Appium::Driver.new(caps).start_driver
    Appium.promote_appium_methods Object

    require_relative "helpers"
    Appium.promote_singleton_appium_methods Helpers
  end

  config.before :each do |e|
  end

  config.after :each do |e|
  end

  config.after :all do
    @driver.driver_quit
  end
end

AllureRSpec.configure do |config|
  config.include AllureRSpec::Adaptor
  config.output_dir = "#{ENV["BASE_DIR"]}/output/allure/#{thread}/"
  config.clean_dir = true
end

ParallelTests.first_process? ? FileUtils.rm_rf(AllureRSpec::Config.output_dir) : sleep(1)