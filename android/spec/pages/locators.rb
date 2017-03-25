class Locators

  def fe locator
    find_element locator
  end

  def fa locator
    find_elements locator
  end

  def click locator
    fe(locator).click
  end

  def get_text locator
    fe(locator).text
  end

  def is_displayed?(locator)
    begin
      fe(locator).displayed?
    rescue
      false
    end
  end
end