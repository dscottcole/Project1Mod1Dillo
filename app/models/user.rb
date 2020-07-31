class User < ActiveRecord::Base
    has_many :items
    has_many :orders, through: :items

    $cred_hash = {}

    def get_list
        $prompt.ask("What item would you like to list in the marketplace?".light_yellow.bold) do |q|
            q.required true
            q.modify :strip
        end
    end
    def get_cat
        $prompt.select("What category best describes your item?".light_yellow.bold, $cat, required: true)
    end
    def get_cond
        $prompt.select("What is your item's condition?".light_yellow.bold, $cond, required: true)
    end
    def get_price
        $prompt.ask("How much $ do you want for your item?".light_yellow.bold) do |q|
            q.required true
            q.convert :float
            q.messages[:convert?] = "Please enter a number."
        end
    end
    def get_desc
        $prompt.ask("Please provide a description for your item.".light_yellow.bold, required: true)
    end
    def get_s_address 
        $prompt.ask("Please provide a shipping address.".light_yellow.bold, required: true)
    end
    def get_m_address 
        result = $prompt.ask("Please provide a meeting address.".light_yellow.bold, required: true, convert: :string)
    end
    def get_date_time
        $prompt.ask("Provide a date and time for the meet-up with #{Date.today + 1} being the earliest meet-up date. (Format: YYYY/MM/DD HH:MM)".light_yellow.bold) do |q|
            q.required true
            q.convert :time
            q.messages[:convert?] = "Invalid date format."
        end
    end
    def get_item
        Item.generate_list
        $prompt.select("What item would you like to purchase?".light_yellow.bold, $item_array, required: true)
    end
    def get_your_items
        Item.generate_list
        $prompt.select("What item would you like to modify the price for?".light_yellow.bold, $user_items, required: true)
    end
    def shipvlocal
        $prompt.select("Would this item be shipped or will it be picked up locally?".light_yellow.bold, %w(Shipment Local), required: true)
    end
    def get_new_price
        $prompt.ask("What would you like to change the price to?".light_yellow.bold, required: true)
    end

    def get_order_type
        $prompt.select("Would you like to view your Sales or Purchases?".light_yellow.bold, $salesvpurch, required: true)
    end
     
    def list
        item = get_list
        cat = get_cat
        cond = get_cond
        pri = get_price
        desc = get_desc
        Item.create(item_name: item, user_id: self.id, location: self.location, category: cat, condition: cond, price: pri, description: desc)
    end

    def purchase
        a = $available_items.map {|i| i.user_id}
        b = a.find_all {|i| i == self.id}

        if a.length == b.length
            puts "=========================================".red.bold
            puts "You own all the items in the marketplace.".white.bold
            puts "=========================================".blue.bold
            marketplace_menu
        end
        
        item_selection = get_item.item_name
        item = Item.all.find_by(item_name: item_selection)

        until self.id != item.user_id do
            puts "You cannot purchase your own item.".red.bold
            item_selection = get_item.item_name
            item = Item.all.find_by(item_name: item_selection)
        end        

        ship_vs_local = shipvlocal

        if ship_vs_local == "Local"
            address = get_m_address
            order_t = "Local"
            datime = get_date_time
            until datime >= Date.today + 1 == true do
                puts "The date entered is not after #{Date.today}. Please revise.".white.bold
                datime = get_date_time
            end

            new_order = Order.create(seller: item.user_id, buyer: self.id, item_id:item.id, order_type: order_t, shipping?: false, shipping_address: nil, meeting_location: address, date_time: datime)
            Item.all.find_by(id: item.id).update(order_id: new_order.id)
            puts "Thank you for your purchase! The seller will contact you via email if there are any issues with the meet-up time/date.".white.bold
            puts "Seller Information:".light_yellow.bold
            puts "#{item.user.name}".white
            puts "#{item.user.email}".white
            puts "Please contact seller with any additional questions.".white.bold

        elsif ship_vs_local == "Shipment"
            address = get_s_address
            order_t = "Shipment"
            new_order = Order.create(seller: item.user_id, buyer: self.id, item_id:item.id, order_type: order_t, shipping?: true, shipping_address: address, meeting_location: nil, date_time: nil)
            Item.all.find_by(id: item.id).update(order_id: new_order.id)
            puts "Thank you for your purchase! Expect to receive an email with a tracking number and additional information.".white.bold
            puts "Seller Information:".light_yellow.bold
            puts "#{item.user.name}".white
            puts "#{item.user.email}".white
            puts "Please contact seller with any additional questions.".white.bold
        end
    end

    def self.credential_hash
    $cred_hash =  User.all.map {|u| [u.username, u.username+u.password]}.to_h
    end

    def get_user_items
        Item.generate_list
        $user_items = $item_array.find_all {|i| i[:value].user_id == self.id}
    end

    def change_item_price
        a = $available_items.map {|i| i.user_id}
       
        if  a.any?(self.id) == false
            puts "=====================================================".red.bold
            puts "You do not own any of the items in the marketplace.".white.bold
            puts "=====================================================".blue.bold
            marketplace_menu
        else
            self.get_user_items
            Item.generate_list
            int_item = get_your_items
            item = Item.all.find_by(id: int_item.id)
            puts "The current item price is: #{item.price}".white.bold
            new_price = get_new_price
            Item.all.find_by(id: int_item.id).update(price: new_price)
            puts "Item price is now #{Item.all.find_by(id: int_item.id).price}".white.bold
        end
    end

    def view_orders
        system "clear"
        type = get_order_type
        if type == "Sales"
            puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".red.bold
            puts "                                  Sales                                  ".white.bold
            puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue.bold
            order_array = Order.all.where(seller: self.id)
            if order_array.any? == false
                puts "You have no sales to display.".red.bold
            else
                order_array.each do |o|
                    puts "=========================================================================".red.bold
                    puts "Order type:".light_yellow.bold
                    puts o.order_type
                    puts "Buyer Name:".light_yellow.bold
                    puts User.all.find_by(id: o.buyer).name
                    puts "Buyer Email:".light_yellow.bold
                    puts User.all.find_by(id: o.buyer).email
                    puts "Item Name:".light_yellow.bold
                    puts o.item.item_name
                    puts "Item Condition:".light_yellow.bold
                    puts o.item.condition
                    puts "Item Price:".light_yellow.bold
                    puts o.item.price
                    puts "=========================================================================".blue.bold
                    sleep 0.75
                end
            end
        elsif type == "Purchases"
            puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".red.bold
            puts "                                Purchases                                ".white.bold
            puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue.bold
            order_array = Order.all.where(buyer: self.id)
            if order_array.any? == false
                puts "You have no purchases to display.".red.bold
            else
                order_array.each do |o|
                    puts "=========================================================================".red.bold
                    puts "Order type:".light_yellow.bold
                    puts o.order_type
                    puts "Seller Name:".light_yellow.bold
                    puts o.item.user.name
                    puts "Seller Email:".light_yellow.bold
                    puts o.item.user.email
                    puts "Item Name:".light_yellow.bold
                    puts o.item.item_name
                    puts "Item Condition:".light_yellow.bold
                    puts o.item.condition
                    puts "Item Price:".light_yellow.bold
                    puts o.item.price
                    puts "=========================================================================".blue.bold
                    sleep 0.75
                end
            end
        end
    end

    def listed_items
        Item.generate_list
        a = $available_items.find_all {|i| i.user_id == self.id}
        if a.any? == true
            a.each do |i|
            puts "================================================================================".red.bold
            puts "Item Name".light_yellow.bold
            puts i.item_name
            puts "Category".light_yellow.bold
            puts i.category
            puts "Condition".light_yellow.bold
            puts i.condition
            puts "Price".light_yellow.bold
            puts i.price
            puts "Description".light_yellow.bold
            puts i.description
            puts "================================================================================".blue.bold
            sleep 0.75
            end
        elsif a.any == false
            puts "You have no items listed in the marketplace".white.bold
        end
    end

end