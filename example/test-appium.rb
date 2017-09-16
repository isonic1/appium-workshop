require 'appium_lib'
require 'rspec'

describe 'Testing Applitools' do
  
  before :each do
    caps = Appium.load_appium_txt file: File.join(File.dirname(__FILE__), 'appium.txt')
    caps[:appium_lib] = {:sauce_username=>false, :sauce_access_key=>false, :wait=>30}
    caps[:caps][:app] = "#{Dir.pwd}/NotesList.apk"

    Appium::Driver.new(caps).start_driver
    Appium.promote_appium_methods Object
  end

  it 'Should launch Appium App' do
    expect(driver.find_element(:id, 'android:id/action_bar_title').text).to eq "Notes"
  end

  after :each do
    driver.quit
  end
end