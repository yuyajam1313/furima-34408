class Item < ApplicationRecord
  
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id 
    validates :status_id 
    validates :delivery_fee_id 
    validates :area_id
    validates :delivery_day_id 
    validates :price, format:{ with: /\A[0-9]+\z/ }
    validates :user,
  end

  belongs_to :user

end
