FactoryBot.define do
  factory :item do
    name { 'hoge' }
    description { 'huga' }
    price { 300 }
    shipping_days_id { 1 }
    delivery_area_id { 1 }
    delivery_charge_id { 1 }
    condition_id { 1 }
    category_id { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
