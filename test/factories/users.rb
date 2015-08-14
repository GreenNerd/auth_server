# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    password_digest "MyString"
    mac_addr "MyString"
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
