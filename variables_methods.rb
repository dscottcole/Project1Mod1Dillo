require_relative './config/environment.rb'
require 'pry'

scott = User.all[0]
ted = User.all[1]
bobby = User.all[2]
marshall = User.all[3]
$prompt = TTY::Prompt.new
$current_user = nil

def welcome
puts " "
puts " "
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "Howdy Y'all!! Welcome to the Armadillo Trading Post. You can list and procure anything 'cept 'dillos."
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
end

def interest 
    $prompt.select("Would you like to list an item or browse the marketplace?", %w(List Browse), required: true)
end

def list_browse
    decision = interest
    if decision == "List"
        $current_user.list
    else
        Item.generate_list
        puts "WE ARE BROWSING, BABY"
    end
end

def tty_test
    $prompt.ask("What is your name?", default: ENV["USER"])
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

def login
    username = $prompt.ask("What is your username?", required: true)
    password = $prompt.mask("What is your password?", required: true)
    credentials = username + password
    User.credential_hash
    if $cred_hash.keys.include?(username) == false
        puts "Username incorrect"
        login
    elsif $cred_hash.values.include?(credentials) == true
        puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
        puts "Thanks for visiting the Armadillo Trading Post, #{username}"
        puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
        $current_user = User.all.find_by(username: username)
    else
        puts "Username & password combination invalid."
    end  
end

###########################################################################################################################

welcome
login
list_browse

binding.pry