#  C:\Users\Acer>emulator -avd EM1

require 'pry'
require 'rubygems'
require 'appium_lib'
require 'rspec'

opts = {
  sauce_username: nil,
  server_url: 'http://localhost:4723/wd/hub',
  caps:       { app:         '/appium-workshop/playground/app-debug.apk',
 	           platformName: 'android',
 	           deviceName:   'android' }
}

describe "True of false tests" do 
    it "thes test will be true" do
		driver = Appium::Driver.new(opts, true).start_driver
		button_menu = driver.find_element(:accessibility_id, 'ReferenceApp')
		button_menu.click
		button_menu.click

	    expect(1).to eq(1)
		driver.quit
    end

    it "thes test will be false" do
		driver = Appium::Driver.new(opts, true).start_driver
		button_menu = driver.find_element(:accessibility_id, 'ReferenceApp')
		button_menu.click
		button_menu.click

	    expect(1).to eq(2)
		driver.quit
    end
end

# Other examples
# el1 = driver.find_elements(:accessibility_id, "ReferenceApp")
# el1.click
# el2 = driver.find_elements(:xpath, "(//android.widget.TextView[@content-desc=\"Row Category Name\"])[7]")
# el2.click
# el3 = driver.find_elements(:id, "com.amazonaws.devicefarm.android.referenceapp:id/notifications_alert_button")
# el3.click
# el4 = driver.find_elements(:id, "android:id/button1")
# el4.click
# el5 = driver.find_elements(:accessibility_id, "ReferenceApp")
# el5.click
# el6 = driver.find_elements(:xpath, "(//android.widget.TextView[@content-desc=\"Row Category Name\"])[1]")
# el6.click
