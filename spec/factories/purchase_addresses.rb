FactoryBot.define do
  factory :purchase_address do
    posral_code    { '123-4567' }
    area_id        { 2 }
    municipalities { '渋谷区' }
    address_number { '渋谷1丁目' }
    building_name  { '渋谷ビル' }
    phone_number   { '09012345678' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
