require_relative 'common'

class Alert < Common

  POPUP_ID = { id: "com.amazonaws.devicefarm.android.referenceapp:id/notifications_alert_button" }

  def page_displayed?
    wait_true(60) { page_title_text == "Alerts and Dialogs" } #we override the implicit appium_lib wait (30).
  end

  def click_alert_button
    page_displayed?
    click POPUP_ID
  end
end