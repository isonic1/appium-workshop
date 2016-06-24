require 'spec_helper'

describe 'Crash Page' do

  before(:each) do
    @crash = Crash.new
  end

  it 'Click Crash Button' do
    @crash.click_hamburger
    text("Crash/Bug").click
    @crash.click_crash_button
    expect(@crash.crash_page_text).to eq "Pressing this button will crash the app"
  end

end