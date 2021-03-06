FactoryBot.define do
  factory :order_address do
    postal_code         { '123-4567' }
    delivery_from_id    { 2 }
    town                { '港区' }
    home_number         { '1-1' }
    building            { '東京ハイツ' }
    telephone           { '0312345678' }
    token               { 12345678}
  end

end