FactoryBot.define do
  factory :item do
    product_name          {'テーブル'}
    product_description   {Faker::Lorem.sentence}
    product_category_id   { 2 }
    product_condition_id  { 2 }
    delivery_fee_id       { 2 }
    delivery_from_id      { 2 }
    delivery_day_id       { 2 }
    price                 { 5000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user 
  end
end
