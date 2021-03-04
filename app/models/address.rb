class Address < ApplicationRecord

  with_options presence: true do
    validates :posral_code
    validates :area_id
    validates :municipalities
    validates :address_number, format: { with:  /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end


  belongs_to :purchase
end
