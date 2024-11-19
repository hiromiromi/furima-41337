class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.text       :image             ,null: false
      t.string     :item              ,null: false
      t.text       :item_description  ,null: false
      t.integer    :category_id       ,null: false
      t.integer    :item_condition_id ,null: false
      t.integer    :shipping_cost_id  ,null: false
      t.integer    :region_id         ,null: false
      t.integer    :number_of_day_id  ,null: false
      t.integer    :price             ,null: false
      t.references :user              ,null: false ,foreign_key: true
      t.timestamps
    end
  end
end
