require_relative 'setup'

set_udid_environment_variable

RSpec.configure do |config|
  config.color = true
  config.tty = true

  config.before :all do
    initialize_appium
  end

  config.before :each do |e|
    helper.start_video_record ENV["UDID"]
    helper.start_logcat ENV["UDID"]
  end

  config.after :each do |e|
    helper.stop_video_record ENV["UDID"]
    helper.stop_logcat
    screenshot "#{ENV["PROJECT_DIR"]}/output/screenshot-#{ENV["UDID"]}.png"
    attach_report_files e
  end

  config.after :all do
    quit_appium
  end
end

allure_report_setup