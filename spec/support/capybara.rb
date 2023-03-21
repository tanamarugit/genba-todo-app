require "selenium-webdriver"

Capybara.register_driver :selenium_chrome_headless do |app|
  driver = Selenium::WebDriver.for :chrome
  Selenium::WebDriver::Chrome::Module.driver_path = "/Users/tanamaru/Downloads/chromedriver"
end

Capybara.javascript_driver = :selenium_chrome_headless