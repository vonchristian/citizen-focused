FactoryBot.define do
  factory :charge do
    name "MyString"
    revenue_account nil
    charge_type 1
    accounts_receivable_account nil
    amount "9.99"
    rate "9.99"
  end
end
