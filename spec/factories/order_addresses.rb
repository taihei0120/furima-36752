FactoryBot.define do
  factory :order_address do
    postal_code         { '123-4567' }
    delivery_from_id    { 2 }
    town                { '港区' }
    home_number         { '1-1' }
    building            { '東京ハイツ' }
    telephone           { '03-1234-5678' }
    user_id             { 2 }
    item_id             { 2 }
  end

end