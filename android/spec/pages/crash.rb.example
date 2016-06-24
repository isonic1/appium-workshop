require_relative 'common'

class Crash < Common

  CRASH_BUTTON_ID = { id: "com.amazonaws.devicefarm.android.referenceapp:id/crash_button" }
  CRASH_PAGE_TEXT = { id: "com.amazonaws.devicefarm.android.referenceapp:id/bug_fragment_message" }

  def page_displayed?
    wait_true(60) { page_title_text == "Crash/Bug Simulator" } #we override the implicit appium_lib wait (30).
  end

  def click_crash_button
    page_displayed?
    click CRASH_BUTTON_ID
  end

  def crash_page_text
    text CRASH_PAGE_TEXT
  end
end