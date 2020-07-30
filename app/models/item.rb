class Item < ActiveRecord::Base
    belongs_to :user
    belongs_to :order

    $available_items = " "
    $item_array = []


    def self.generate_list
        item_list = Item.all.where(order_id: nil)

        $item_array = item_list.map {|i| {name: i.item_name, value: i}}
        $available_items = item_list
    end

end