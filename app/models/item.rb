class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one :order

  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :region
  belongs_to :number_of_day

  with_options presence: true do
    validates :image
    validates :item
    validates :item_description
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true,
                              allow_blank: true }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :item_condition_id
    validates :shipping_cost_id
    validates :region_id
    validates :number_of_day_id
  end
end
