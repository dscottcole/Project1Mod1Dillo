# Armadillo Trading Place - A Texas Marketplace CLI App

## Models & Relationships

User has_many :items
User has_many :locations, through :items
User has_many :conditions, through :items

Items belongs_to :user
Items belongs_to :location
Items belongs_to :condition

Location has_many :items
Location has_many :users, through :items

Condition has_many :items



_______________________________________________

## User Stories

### MVP
* User can log in
* User will be able to browse Marketplace
* Message between users if local pickup available
* Shippable items would have cart capabilities

### Stretch Goals
*
