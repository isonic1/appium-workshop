require_relative 'locators'

class Common < Locators

  TOOLBAR_TITLE = { id: 'com.amazonaws.devicefarm.android.referenceapp:id/toolbar_title' }
  HAMBURGER_BUTTON = { id: 'ReferenceApp' }
  POPUP_ALERT_TITLE = { id: "android:id/alertTitle" }
  POPUP_ALERT_MESSAGE = { id: "android:id/message" }

  def click_hamburger
    click HAMBURGER_BUTTON
  end

  def page_title_text
    get_text TOOLBAR_TITLE
  end

  def popup_title
    get_text POPUP_ALERT_TITLE
  end

  def popup_message
    get_text POPUP_ALERT_MESSAGE
  end
end