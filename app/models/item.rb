class Item < ActiveRecord::Base
    belongs_to :user
    belongs_to :order

    $available_items = " "
    $available_items_array = ""
    # $available_items_g = " "

    # def self.generate_list_g
    #     item_list = Item.all.where(order_id: nil)
    #     array = item_list.map do |i|
    #         i.item_name.gsub!(" ", "_")
    #     end
    #     $available_items_g = array.join(" ")
    # end

    def self.generate_list
        item_list = Item.all.where(order_id: nil)
        $available_items = item_list

        array = item_list.map do |i|
            i.item_name
        end
        $available_items_array = array
    end

end