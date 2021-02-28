FactoryBot.define do
  factory :item do
    name           { '商品名' }
    description    { '商品説明' }
    category_id    { 2 }
    status_id      { 2 }
    deliveryfee_id { 2 }
    area_id        { 2 }
    deliveryday_id { 2 }
    price          { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
