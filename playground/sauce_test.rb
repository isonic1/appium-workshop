require 'appium_lib'
 
# Set the environment variables:
SAUCE_USERNAME = ENV['SAUCE_USERNAME']
SAUCE_ACCESS_KEY = ENV['SAUCE_ACCESS_KEY']
 
desired_caps = {
      caps:       {
        appiumVersion:    '1.5.3',
        platformName:     'Android',
        platformVersion:  '4.4',
        browserName:       '',
        deviceName:       'Android Emulator',
        app:              'http://saucelabs.com/example_files/ContactManager.apk',
        name:             'Ruby Appium Sauce example'
      }
    }
 
driver = Appium::Driver.new(desired_caps)
driver.start_driver
 
puts driver.page_source 
 
# Test Actions here...
 
driver.driver_quit