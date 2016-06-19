require_relative 'locators'

class Common < Locators

  HAMBURGER_BUTTON = { id: 'ReferenceApp' }

  def click_hamburger
    click HAMBURGER_BUTTON
  end
end