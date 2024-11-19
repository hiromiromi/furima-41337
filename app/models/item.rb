class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_cost 
  belongs_to :region
  belongs_to :number_of_day

  with_options presence: true do
    validates :image
    validates :item
    validates :item_description
    validates :user_id
    validates :price, numericality: {greater_than: 300,less_than: 9999999}
  end

  with_options  numericality: { other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :item_condition_id
    validates :shipping_cost_id
    validates :region_id
    validates :number_of_day_id
  end
end
