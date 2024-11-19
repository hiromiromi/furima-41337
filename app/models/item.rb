class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :region
  belongs_to :number_of_day

  validates :image, :item, :item_description, presence: true

  validates :category_id, numericality: { other_than: 1 , message: "Category can't be blank"}
  validates :item_condition_id, numericality: { other_than: 1 , message: "Item condition can't be blank"}
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "Shipping cost can't be blank"}
  validates :region_id, numericality: { other_than: 1 , message: "Region can't be blank"}
  validates :number_of_day_id, numericality: { other_than: 1 , message: "Number of days can't be blank"}
  
  validates :price , numericality: {greater_than: 50,less_than: 250}
end
