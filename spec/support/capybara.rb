require 'capybara/rspec'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome # 使用するドライバーを設定
  config.default_max_wait_time = 5 # 要素が見つかるまで待つ最大時間を設定
end
