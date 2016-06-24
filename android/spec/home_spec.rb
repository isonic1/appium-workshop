require 'spec_helper'

describe "Home Page #{ENV["UDID"]}" do

  before :each do
    @home = Home.new
  end

  it 'Home Page Displays Correct Text' do
    expect(@home.home_page_text).to eq "AWS Device Farm Sample App for Android"
  end
end