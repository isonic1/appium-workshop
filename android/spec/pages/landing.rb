require_relative 'finders'

class Landing < Finders
  A_BUTTON = {  }

  def page_displayed?
    wait_true(30) { is_displayed? SIGNIN_BUTTON_LOCATOR }
  end

  def signin_button
    fe SIGNIN_BUTTON_LOCATOR
  end
end