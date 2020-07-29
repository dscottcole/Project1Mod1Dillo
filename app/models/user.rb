class User < ActiveRecord::Base
    has_many :items
    has_many :orders, through: :items

    $cred_hash = {}

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
        $prompt.ask("Please provide a shipping address.", required: true)
    end
    def get_m_address 
        $prompt.ask("Please provide a meeting address.", required: true)
    end
    def get_item
        Item.generate_list
        $prompt.select("What item would you like to purchase?", $item_array)
    end
    def shipvlocal
        $prompt.select("Would this item be shipped or will it be picked up locally?", %w(Shipment Local))
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
        # binding.pry
        a = $available_items.map {|i| i.user_id}
        b = a.find_all {|i| i == self.id}

        if a.length == b.length
            puts "You own all the items in the marketplace."
            list_browse_purchase
        end
        
        item_selection = get_item.item_name
        item = Item.all.find_by(item_name: item_selection)

        until self.id != item.user_id do
            puts "You cannot purchase your own item."
            item_selection = get_item.item_name
            item = Item.all.find_by(item_name: item_selection)
        end        

        ship_vs_local = shipvlocal

        if ship_vs_local == "Local"
            address = get_m_address
            order_t = "Local"
            new_order = Order.create(seller: item.user_id, buyer: self.id, item_id:item.id, order_type: order_t, shipping?: false, shipping_address: nil, meeting_location: address)
            Item.all.find_by(id: item.id).update(order_id: new_order.id)
        elsif ship_vs_local == "Shipment"
            address = get_s_address
            order_t = "Shipment"
            new_order = Order.create(seller: item.user_id, buyer: self.id, item_id:item.id, order_type: order_t, shipping?: true, shipping_address: address, meeting_location: nil)
            Item.all.find_by(id: item.id).update(order_id: new_order.id)
        end
    end


    def self.credential_hash
    $cred_hash =  User.all.map {|u| [u.username, u.username+u.password]}.to_h
    end

end