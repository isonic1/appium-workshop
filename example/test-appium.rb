require 'appium_lib'

caps = Appium.load_appium_txt 'appium.txt'
caps[:appium_lib] = {:sauce_username=>false, :sauce_access_key=>false, :wait=>30}
caps[:caps][:app] = "#{Dir.pwd}/NotesList.apk"

puts caps

Appium::Driver.new(caps).start_driver
Appium.promote_appium_methods Object

if driver.find_element(:id, 'android:id/action_bar_title').text == "Notes"
  puts "YAY! ALL LOOKS GOOD!!!!"
else
  puts "WHOOPS. THERE IS A PROBLEM!!!!"
end

driver.quit