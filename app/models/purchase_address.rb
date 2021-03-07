class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :posral_code, :area_id, :municipalities, :address_number, :building_name, :phone_number, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :posral_code,format: { with:  /\A\d{3}[-]\d{4}\z/ }
    validates :area_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :address_number 
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(posral_code: posral_code, area_id: area_id, municipalities: municipalities, address_number: address_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

end