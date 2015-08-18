# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "name#{n}" }
    password "MyString"
    sequence(:mac_addr) { |n| "mac_addr#{n}" }
    router_id 1
    association :router, factory: :router
  end

  factory :admin, parent: :user do
    after(:create) do |admin|
      admin.router.admin_ids << admin.id
      admin.router.save
    end
  end
end
