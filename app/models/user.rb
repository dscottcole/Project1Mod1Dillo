class User < ActiveRecord::Base
    has_many :items
    has_many :orders, through: :items

    def get_listing
        $prompt.ask("What item would you like to list in the marketplace?", default: ENV["USER"])
    end

    def get_category
        $prompt.select("What category best describes your item?", %w(Active Gaming Clothing Furniture Computers Household Hardware Auto ))
        
    end

    def get_condition
        $prompt.select("What is your item's condition?", %w(New Used_Like_New Used_Fair Used_Not_Great))
    end

    def get_price
        $prompt.ask("How much $ do you want for your item?", default: ENV["USER"])
    end

    def get_description
        $prompt.ask("Please provide a description for your item.", default: ENV["USER"])
    end

    def get_s_address 
        $prompt.ask("Please provide a shipping address.", default: ENV["USER"])
    end

    def get_m_address 
        $prompt.ask("Please provide a meeting address.", default: ENV["USER"])
    end

    def get_item
        Item.generate_list
        # $prompt.ask("What item would you like to purchase?", default: ENV["USER"])
        $prompt.select("What item would you like to purchase?", %w($available_items))
    end
    
 
    def list
        item = get_listing
        cat = get_category
        cond = get_condition
        pri = get_price
        desc = get_description
        Item.create(item_name: item, user_id: self.id, location: self.location, category: cat, condition: cond, price: pri, description: desc)
    end

    def purchase
        item_name = get_item
        item = Item.all.find_by(item_name: item_name)

        if item.location == self.location
            order_t = "Local"
            address = get_m_address
            new_order = Order.create(seller: item.user_id, buyer: self.id, item_id:item.id, order_type: order_t, shipping?: false, shipping_address: nil, meeting_location: address)
            binding.pry
            item.order = new_order
        else
            order_t = "Shipment"
            address = get_s_address
            new_order = Order.create(seller: item.user_id, buyer: self.id, item_id:item.id, order_type: order_t, shipping?: true, shipping_address: address, meeting_location: nil)
            item.order = new_order
        end
    end
end