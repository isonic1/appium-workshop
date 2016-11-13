require 'appium_lib'
require 'rspec'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
  
  config.before :all do
    
  end

  config.before :each do

  end

  config.after :each do |e|

  end

  config.after :all do
    
  end
end