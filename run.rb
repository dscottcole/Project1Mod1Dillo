require_relative './config/environment.rb'
require 'pry'

scott = User.all[0]
ted = User.all[1]
bobby = User.all[2]
marshall = User.all[3]

# logo = 
#                                  ,.-----__
#                               ,:::://///,:::-.
#                               /:''/////// ``:::`;/|/
#                             /'   ||||||     :://'`\
#                ,          .' ,   ||||||     `/(  e \     /               -===~__-'\__X_`````\_____/~`-._ `.                                 ~~        ~~       `~-
# '`|     o

def welcome
puts " "
puts " "
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "Howdy Y'all!! Welcome to the Armadillo Trading Post. You can list and procure anything 'cept 'dillos."
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
end

def interest 
    puts "Would you like to list an item or browse the marketplace?(Type 'list' or 'browse')"
    STDIN.gets.chomp
end

def list_browse
    decision = interest

    if decision == "list"
        puts "LIST ITEM"
    else
        show_marketplace
    end
end
    

def show_marketplace
    Item.all.each do |i|
        puts "============================================================"
        puts i.item_name
        puts i.condition
        puts i.price
        puts i.description
        puts i.location
        puts "============================================================"
    end
end

welcome
list_browse



# binding.pry
