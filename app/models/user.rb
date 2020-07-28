class User < ActiveRecord::Base
    has_many :items
    has_many :orders, through: :items

    def get_listing
        puts "What item would you like to list in the marketplace?"
        STDIN.gets.chomp
    end

    def get_category
        puts "What category best describes your item?"
        STDIN.gets.chomp
    end

    def get_condition
        puts "What condition is your item in?(New, Used Like New, Used Fair, Used Not Great)"
        STDIN.gets.chomp
    end

    def get_price
        puts "How much $ do you want for your item?"
        STDIN.gets.chomp
    end

    def get_description
        puts "Please provide a description for your item."
        STDIN.gets.chomp
    end

    def get_s_address 
        puts "Please provide a shipping address."
        STDIN.gets.chomp
    end

    def get_m_address 
        puts "Please provide a meeting address."
        STDIN.gets.chomp
    end

    def get_item
        puts "What item would you like to purchase?"
        STDIN.gets.chomp
    end
    
    def list_item
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
            Order.create(seller: item.user_id, buyer: self.id, item_id:item.id, order_type: order_t, shipping?: false, shipping_address: nil, meeting_location: address)
        else
            order_t = "Shipment"
            address = get_s_address
            Order.create(seller: item.user_id, buyer: self.id, item_id:item.id, order_type: order_t, shipping?: true, shipping_address: address, meeting_location: nil)
        end
    end
end