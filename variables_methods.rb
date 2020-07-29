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
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".red.bold
puts "H".light_red.bold + " " + "o".light_red.bold + " " + "w".light_red.bold + " " + "d".light_red.bold + " " + "y".light_red.bold + " " + "Yall".white.bold + "!!!".light_blue.bold + " " + "Welcome to the Armadillo Trading Post. You can list and procure anything 'cept 'dillos.".white.bold
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue.bold
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
    88 88                          
    d                                    88                           
    88                                   88                             
MMMM88MMM 8b dPPYba adPPYYba     adPPYb 88 88 8b dPPYba     adPPYbd8  
    88    88P      Y8       Y8 a8      Y88 88 88P      8a a8      Y88  
    88    88         adPPPPP88 8b       88 88 88       88 8b       88  
    88    88        88      88  8a     d88 88 88       88  8a     d88  
     Y888 88          8bbdPY8     8bbdPY8  88 88       88     YbbdPY8  
                                                            aa      88  
                                                              Y8bbdP   
                                                                                 888    
                                                                                 888    
                                                                                 888    
                                                         88888b    d88b   d8888b 888888 
                                                         888  88bd88  88b88K     888    
                                                         888  888888  888 Y8888b.888    
                                                         888 d88PY88  88P     X88Y88b  
                                                         88888P    Y88P   88888P   Y888 
                                                         888                            
                                                         888                            
                                                         888  
".light_yellow
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".red.bold
puts "       <') ) ) ~       <') ) ) ~       <') ) ) ~       ~ ( ( ('>       ~ ( ( ('>       ~ ( ( ('>      ".white.bold
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue.bold
end

def interest 
    $prompt.select("Would you like to list an item or browse the marketplace?".cyan.bold, %w(List Browse), required: true)
end

def buy_or_not
    $prompt.select("Select from the following:".cyan.bold, %w(Purchase_Item Refresh_Marketplace List_Item Exit_Marketplace), required: true)
end

def get_name
    $prompt.ask("Please enter your first and last names. (examples: John Doe, Jane Doe)".cyan.bold, required: true)
end

def get_loc
    $prompt.select("Where are you located?".cyan.bold, %w(Houston Austin Dallas), required: true)
end

def get_user
    $prompt.ask("Please enter a username.".cyan.bold, required: true)
end

def get_pass
    $prompt.mask("Please enter a password.".cyan.bold, required: true)
end

def list_browse
    decision = interest
    if decision == "List"
        $current_user.list
        list_browse
    else
        puts "WE ARE BROWSING, BABY".light_magenta.underline + " " "!".white.bold + " " + "!".white.bold + " " + "!".white.bold
        show_marketplace
        pr = buy_or_not
        if pr == "Purchase_Item"
            $current_user.purchase
        elsif pr == "Refresh_Marketplace"
            puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".red.bold
            puts "We have refreshed the marketplace for you.".white.bold
            puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue.bold
            show_marketplace
            list_browse
        elsif pr == "List_Item"
            $current_user.list
            list_browse

        elsif pr == "Exit_Marketplace"
            puts "   <') ) ) ~   ~ ( ( ('>    <') ) ) ~   ~ ( ( ('>".light_yellow.bold
            puts "~ ( ( ('>".light_yellow.bold + "     " + "Thanks for stopping by!!".white.underline + "     " + "<') ) ) ~".light_yellow.bold
            puts "   ~ ( ( ('>   <') ) ) ~   ~ ( ( ('>   <') ) ) ~".light_yellow.bold

            exit
        end
    end
end

def tty_test
    $prompt.ask("What is your name?".light_blue.bold, default: ENV["USER"])
end   

def show_marketplace
    Item.generate_list
    $available_items.each do |i|
        puts "============================================================".red.bold
        puts "Item Name:".cyan.bold
        puts i.item_name
        puts "Category:".cyan.bold
        puts i.category
        puts "Condition:".cyan.bold
        puts i.condition
        puts "Price:".cyan.bold
        puts i.price
        puts "Item Description:".cyan.bold
        puts i.description
        puts "Item Location:".cyan.bold
        puts i.location
        puts "============================================================".blue.bold
    end
end

def logvnew
    $prompt.select("Do you have an existing account?".cyan.bold, %w(Log_In Create_New_Account), required: true)
end

def login
    username = $prompt.ask("What is your username?".cyan.bold, required: true)
    password = $prompt.mask("What is your password?".cyan.bold, required: true)
    credentials = username + password
    User.credential_hash
    if $cred_hash.keys.include?(username) == false
        puts "Username incorrect".light_red.bold
        login
    elsif $cred_hash.values.include?(credentials) == true
        puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".red.bold
        puts "Thanks for visiting the Armadillo Trading Post, #{username}!!".white.bold
        puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue.bold
        $current_user = User.all.find_by(username: username)
    else
        puts "Username & password combination invalid.".red.bold
    end  
end

def new_user
    first_last = get_name
    loc = get_loc
    uname = get_user
    pass = get_pass
    User.create(name: first_last, location: loc, username:uname, password: pass)
    puts "Thank you for creating a new account!".light_green.bold
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