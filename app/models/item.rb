class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :product_category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :product_condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_fee_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_from_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, presence: true
  
  has_one_attached :image
  belongs_to :user
  
  belongs_to :product_category
  belongs_to :product_condition
  belongs_to :delivery_fee
  belongs_to :delivery_from
  belongs_to :delivery_day
  #has_one :order
end
