# Armadillo Trading Place - A Texas Marketplace CLI App

## Models & Relationships

User has_many :items
User has_many :orders, through: :items

Items belongs_to :user
Items belongs_to :order

Order belongs_to :items

_______________________________________________

## User Stories

### MVP
* User can log in with validation
* User can create a new user account
* User can browse/refresh the Marketplace
* User can list items
* User can purchase items
* User can differentiate between Shipping methods. (Shipping/Local Methods)

### Stretch Goals
* TTY Prompts
* Colorize
* View Order History
* Change price of listed item

_______________________________________________

## Class Instance Variables

### Items (belongs to user, belongs to orders)
* item_name
* location
* category
* condition
* price
* description
* user_id
* order_id


### Users (has many items)
* name
* location
* username
* password
* email


### Orders (belongs to items)
* seller
* buyer
* item_id
* order_type
* shipping?
* shipping_address
* meeting_location
* date_time