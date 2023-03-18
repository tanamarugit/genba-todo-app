FactoryBot.define do
  factory :task do
    name { 'テストを書く' }
    description { 'Rspec & Capybaa & FactoryBotを準備する' }
    user
  end
end