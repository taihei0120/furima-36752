class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_from_id, :town, :home_number, :building, :telephone, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :town
    validates :home_number
    validates :telephone
    validates :user_id
    validates :item_id
  end
    validates :delivery_from_id, presence: true, numericality: { other_than: 1 }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, delivery_from_id: delivery_from_id, town: town, home_number: home_number, building: building, telephone: telephone, order_id: order_id)
  end

end