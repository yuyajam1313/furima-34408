class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :description
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :deliveryfee_id
    validates :area_id
    validates :deliveryday_id
  end
    validates :price, format:{ with: /\A[0-9]+\z/ }
    validates :user
    validates :image
  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :deliveryfee, :area, :deliveryday

end
