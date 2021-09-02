class Item < ApplicationRecord
  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :product_category_id, presence: true
  validates :product_condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :delivery_from_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true
  
  has_one_attached :image
  belongs_to :user
  #has_one :order
end
