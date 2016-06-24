require 'spec_helper'

describe 'Alerts Page' do

  before(:each) do
    @alert = Alert.new
  end

  it 'Should Display Alert Popup' do
    @alert.click_hamburger
    text("Alerts").click
    @alert.click_alert_button
    expect(@alert.popup_title).to eq "Alert Title"
    expect(@alert.popup_message).to eq "This is the alert message"
  end

end