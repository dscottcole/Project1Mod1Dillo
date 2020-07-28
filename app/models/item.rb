class Item < ActiveRecord::Base
    belongs_to :user
    belongs_to :order

    $available_items = " "

    def self.generate_list
        item_list = Item.all.where(order_id: nil)
        array = item_list.map do |i|
            i.item_name.gsub!(" ", "_")
        end
        $available_items = array.join(" ")
    end
end