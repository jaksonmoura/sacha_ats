# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :call do
    dpto_id 1
    servant_id 1
    technical_id nil
    equipment "MyString"
    problem "MyString"
    service nil
    obs nil
    closed false
  end
end
