scott = User.create(name: "Scott Cole", location: "Houston")
ted = User.create(name: "Ted Neben", location: "Houston")
bobby = User.create(name: "Robert Tarantino", location: "Dallas")
marshall = User.create(name: "Marshall Mathers", location: "Austin")
# = User.create(name: "")

bike = Item.create(item_name: "Santa Cruz Bronson", user_id: 1, order_id: 1, location: "Houston", category: "Bicycles", condition: "New", price: 4000, description: "Super gnarly 2020 Bronson. Shreds anything!")
laptop = Item.create(item_name: "Macbook Pro", user_id: 2, order_id: 2,  location: "Houston", category: "Computers", condition: "New", price: 2000 , description: "2020 Macbook Pro. Hot buy!")
chair = Item.create(item_name: "Gaming Chair", user_id: 3, order_id: 3, location: "Austin", category: "Furniture", condition: "Used_like_new", price: 250, description: "Awesome chair. Will raise KD and stream followers")
controller = Item.create(item_name: "Xbox 360 Controller", user_id: 3, order_id: 4, location: "Austin", category: "Gaming", condition: "Used_not_great", price: 13.37, description: "Heavily used Xbox 360 Controller, good for mod body")
chucks = Item.create(item_name: "Converse High Tops", user_id: 4, order_id: 5, location: "Dallas", category: "Clothing", condition: "New", price: 39.99, description: "Size 11 Mens High-Top Chucks")
toilet_seat = Item.create(item_name: "Toilet Seat", user_id: 2,location: "Houston", category: "Household", condition: "Used_not_great", price: 21.65, description: "White plastic toilet seat, color has faded a bit and worn around the sides...naturally")
mug = Item.create(item_name: "Coffee Mug", user_id: 1, location: "Austin", category: "Household", condition: "Used_like_new", price: 4.99, description: "Black Ceramic Coffee Mug, says All Your Base Are Belong To Us")
headset = Item.create(item_name: "Hyper X Cloud", user_id: 2,location: "Houston", category: "Computers", condition: "New", price: 69.99, description: "Sealed Hyper X Cloud Wired Headset")
bell = Item.create(item_name: "Bike Bell", user_id: 1, location: "Houston", category: "Bicycles", condition: "Used_not_great", price: 10.00, description: "Stainless Steel Desk Bell fashioned for a bike... Ding in style")
# = Item.create(item_name: "", user_id:,  location: "", category: "", condition: "", price: , description: "")

o1 = Order.create(seller: 1, buyer: 2, item_id: 1, order_type: "Local", shipping?: false, shipping_address: nil, meeting_location: "123 Fake Street. Houston, TX 77777")
o2 = Order.create(seller: 2, buyer: 1, item_id: 2, order_type: "Local", shipping?: false, shipping_address: nil, meeting_location: "456 Made-up Street. Houston, TX 77777")
o3 = Order.create(seller: 3, buyer: 1, item_id: 3, order_type: "Shipment", shipping?: true, shipping_address: "Scott's House, Houston, TX 77777", meeting_location: nil)
o4 = Order.create(seller: 3, buyer: 2, item_id: 4, order_type: "Shipment", shipping?: true, shipping_address: "Ted's, Houston, TX 77777", meeting_location: nil)
o5 = Order.create(seller: 4, buyer: 3, item_id: 5, order_type: "Shipment", shipping?: true, shipping_address: "Bobby's House, Houston, TX 77777", meeting_location: nil)