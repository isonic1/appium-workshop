require_relative 'common'

class Home < Common

  HOME_PAGE_ID = { id: 'com.amazonaws.devicefarm.android.referenceapp:id/homepage_headline' }

  def page_displayed?
    wait_true(60) { is_displayed? HOME_PAGE_ID } #we wait longer than specified for the implicit appium_lib wait (30).
  end

  def home_page_text
    page_displayed?
    text HOME_PAGE_ID
  end
end