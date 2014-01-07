# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_privacy do
    user nil
    key "MyString"
    value false
  end
end
