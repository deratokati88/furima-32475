FactoryBot.define do
  factory :buyer_shipping do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '横浜市' }
    address { '青山１−１−１' }
    building { '新横浜ビル5階' }
    phone { Faker::Base.numerify('090######') }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
