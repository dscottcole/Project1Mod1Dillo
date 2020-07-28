class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :seller
      t.integer :buyer
      t.integer :item_id
      t.string :order_type #Shipment vs Local
      t.boolean :shipping?
      t.string :shipping_address
      t.string :meeting_location
    end
  end
end
