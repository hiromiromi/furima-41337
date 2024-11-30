class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :house_number, :building_name, :phone, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'input correctly'}
    validates :region_id, numericality: { other_than: 1, message: 'Select'}
    validates :city, :house_number, :item_id, :user_id
    validates :phone, numericality: {only_integer: true, message: 'input only number'}, length: {in:10..11, message: 'is too short'}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, region_id: region_id, city: city, house_number: house_number, building_name: building_name, phone: phone, order_id: order.id)
  end
end