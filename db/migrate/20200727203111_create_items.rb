class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :user_id
      t.integer :order_id
      t.string :location #austin, dallas, houston
      t.string :category 
      t.string :condition #new, used_like_new, used_fair, used_not_great
      t.float :price
      t.text :description, limit: 1000
    end
  end
end
