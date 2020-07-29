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
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".light_red
puts "Howdy Y'all!! Welcome to the Armadillo Trading Post. You can list and procure anything 'cept 'dillos.".white.bold
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".light_blue
puts "
                                          ████████████████████
                                    ██████░░░░░░██░░██░░░░██░░██████
                                  ██░░░░░░████░░░░██░░██░░░░██░░░░██████████
                                ██░░░░░░░░░░░░██░░░░██░░██░░░░██░░██░░░░██░░████
                              ██░░░░░░░░░░░░░░░░██░░██░░██░░░░██░░░░██░░░░██░░██████
                              ██░░░░░░░░░░░░░░░░░░██░░██░░██░░░░██░░██░░░░██░░░░██░░████
                  ████      ██░░░░░░░░░░░░░░░░░░░░██░░██░░██░░░░██░░░░██░░░░██░░██░░░░░░██
                ██░░░░██  ██░░░░░░░░░░░░░░░░░░░░░░██░░░░██░░██░░░░██░░██░░░░██░░░░██░░░░██
                ██░░░░░░████░░░░░░░░░░░░░░░░░░░░░░░░██░░██░░██░░░░██░░████░░██░░░░██░░░░░░██
                ████░░░░░░██░░░░░░░░░░░░░░░░░░░░░░░░██░░░░██░░██░░░░██░░██░░░░██░░██░░░░░░░░██
                ██░░██░░░░██░░░░░░░░░░░░░░░░░░░░░░░░░░██░░██░░██░░░░██░░██░░░░██░░████░░░░░░██
                  ██░░██░░██░░░░░░░░░░░░░░░░░░░░░░░░░░██░░░░██░░██░░██░░██░░░░██░░░░██░░░░████
                    ██░░████░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░██░░██░░██░░██░░░░██░░░░██░░░░██
                    ████░░██░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░██░░██░░██░░██░░██░░░░░░██░░░░██
                  ██░░░░░░░░██░░░░░░░░░░░░░░░░░░░░░░░░░░██░░██░░██░░██░░██░░██░░░░██░░░░░░████
                  ██░░░░░░░░██░░░░░░░░░░░░░░░░░░░░░░░░░░██░░██░░██░░████░░░░██░░░░██░░░░██░░░░██
                ██░░░░░░░░░░██░░░░░░░░░░░░░░░░░░░░░░░░░░██░░████████░░██░░░░██░░██░░░░░░██░░░░██
                ██░░░░  ██░░░░██░░░░░░░░░░░░░░░░░░░░░░░░████████░░░░██████████████████████░░░░██
                ██░░░░░░  ░░░░██░░░░░░░░░░░░░░░░░░░░████      ██░░░░██    ██░░░░░░██    ██░░░░░░██
              ██░░░░░░░░░░░░░░░░████░░░░░░░░░░░░░░██░░██    ██░░░░░░██    ██░░░░░░██    ████░░░░██
              ██░░░░░░░░░░░░░░██    ██████████████░░░░██  ██░░░░░░██    ██░░░░░░░░██      ██░░░░██
              ██░░░░░░░░░░████      ██░░░░██  ██░░░░██    ██░░░░░░██  ██░░░░░░░░██          ██░░██
              ██░░░░░░░░██      ████░░░░██  ██░░░░░░██      ██████    ██████████          ██░░░░██
            ██░░░░░░░░██      ██░░░░░░██  ████░░░░██                                    ████░░░░██
          ██░░░░░░████          ██████  ██░░░░░░░░██                              ██████░░░░░░██
          ████████                      ██░░░░████                      ██████████░░░░░░██████
                                          ████                        ██░░░░░░░░░░██████
                                                                    ██░░██████████
                                                                  ██████
".light_yellow
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".light_blue
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".light_red
end

def interest 
    $prompt.select("Would you like to list an item or browse the marketplace?", %w(List Browse), required: true)
end

def buy_or_not
    $prompt.select("Select from the following:", %w(Purchase_Item Refresh_Marketplace List_Item Exit_Marketplace), required: true)
end

def get_name
    $prompt.ask("Please enter your first and last names. (examples: John Doe, Jane Doe)", required: true)
end

def get_loc
    $prompt.select("Where are you located?", %w(Houston Austin Dallas), required: true)
end

def get_user
    $prompt.ask("Please enter a username.", required: true)
end

def get_pass
    $prompt.mask("Please enter a password.", required: true)
end

def list_browse
    decision = interest
    if decision == "List"
        $current_user.list
        list_browse
    else
        puts "WE ARE BROWSING, BABY"
        show_marketplace
        pr = buy_or_not
        if pr == "Purchase_Item"
            $current_user.purchase
        elsif pr == "Refresh_Marketplace"
            puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
            puts "We have refreshed the marketplace for you."
            puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
            show_marketplace
            list_browse
        elsif pr == "List_Item"
            $current_user.list
            list_browse

        elsif pr == "Exit_Marketplace"
            puts "Thanks for stopping by! <:8(((D~"
            exit
        end
    end
end

def tty_test
    $prompt.ask("What is your name?", default: ENV["USER"])
end   

def show_marketplace
    Item.generate_list
    $available_items.each do |i|
        puts "============================================================"
        puts "Item Name:"
        puts i.item_name
        puts "Category:"
        puts i.category
        puts "Condition:"
        puts i.condition
        puts "Price:"
        puts i.price
        puts "Item Description:"
        puts i.description
        puts "Item Location:"
        puts i.location
        puts "============================================================"
    end
end

def logvnew
    $prompt.select("Do you have an existing account?", %w(Log_In Create_New_Account), required: true)
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
        puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".light_red
        puts "Thanks for visiting the Armadillo Trading Post, #{username}"
        puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
        $current_user = User.all.find_by(username: username)
    else
        puts "Username & password combination invalid."
    end  
end

def new_user
    first_last = get_name
    loc = get_loc
    uname = get_user
    pass = get_pass
    User.create(name: first_last, location: loc, username:uname, password: pass)
    puts "Thank you for creating a new account!"
end


def authenticate_or_create
    choice = logvnew
    if choice == "Log_In"
        login
    elsif choice == "Create_New_Account"
        new_user
        login
    end
end

def access_verification
    if $current_user != nil
    else
        exit
    end
end

###########################################################################################################################

welcome
authenticate_or_create
access_verification
list_browse

binding.pry