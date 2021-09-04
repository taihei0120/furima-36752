class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :product_category_id, presence: true, numericality: { other_than: 1 }
  validates :product_condition_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_fee_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_from_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_day_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }
  validates :image, presence: true
  
  has_one_attached :image
  belongs_to :user
  
  belongs_to :product_category
  belongs_to :product_condition
  belongs_to :delivery_fee
  belongs_to :delivery_from
  belongs_to :delivery_day
  #has_one :order
end