require_relative 'common'

class Home < Common

  HOME_PAGE_TEXT = { id: 'com.amazonaws.devicefarm.android.referenceapp:id/homepage_headline' }

  def page_displayed?
    wait_true(60) { page_title_text == "Homepage" } #we override the implicit appium_lib wait (30).
  end

  def home_page_text
    page_displayed?
    text HOME_PAGE_TEXT
  end
end