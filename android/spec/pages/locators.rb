class Locators

  def initialize(driver)
    @driver = driver
  end

  def fe(locator)
    @driver.find_element locator
  end

  def fa(locator)
    @driver.find_elements locator
  end

  def is_displayed?(locator)
    begin
      fe(locator).displayed?
    rescue
      false
    end
  end
end