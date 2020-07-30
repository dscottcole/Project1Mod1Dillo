ActiveRecord::Base.logger = nil

scott = User.all[0]
ted = User.all[1]
bobby = User.all[2]
marshall = User.all[3]
$prompt = TTY::Prompt.new
$current_user = nil
$choice_array = ["List Item", "Browse", "Purchase Item", "Change Item Price", "Order History", "Exit Marketplace"]
$choice_array2 = ["Purchase Item", "Refresh Marketplace", "List Item", "Change Item Price", "Order History", "Exit Marketplace"]
$log_new = ["Log In", "Create New Account"]
$cond = ["New", "Used Like New", "Used Fair", "Used Not Great"]
$cat = ["Active", "Gaming", "Clothing", "Furniture", "Computers", "Household", "Hardware Auto"]
$salesvpurch = ["Sales", "Purchases"]


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
    d                                   88 88                        
    88                                  88                             
MMMM88MMM 8b dPPYba adPPYYba     adPPYb 88 88 8b dPPYba     adPPYbd8  
    88    88P      Y8       Y8 a8      Y88 88 88P      8a a8      Y88  
    88    88         adPPPPP88 8b       88 88 88       88 8b       88  
    88    88        88      88  8a     d88 88 88       88  8a     d88  
     Y888 88          8bbdPY8     8bbdPY8  88 88       88     YbbdPY8  
                                                            aa     88  
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
    $prompt.select("Would you like to list an item, browse the marketplace, or make a purchase without browsing?".cyan.bold, $choice_array, required: true)
end
def marketplace_navigation
    $prompt.select("Select from the following:".cyan.bold, $choice_array2, required: true)
end
def get_name
    $prompt.ask("Please enter your first and last. (examples: John Doe, Jane Doe)".cyan.bold, required: true)
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
def get_pass2
    $prompt.mask("Please repeat your password.".cyan.bold, required: true)
end
def get_email
    $prompt.ask('What is your email?') do |q| 
        q.validate :email
        q.required true
        q.messages[:email] = "Invalid email address"
    end
end

def list_browse_purchase
    Item.generate_list
    decision = interest
    if decision == "List Item"
        $current_user.list
        puts "Best of luck!"
        list_browse_purchase
    elsif decision == "Browse"
        puts " "
        puts "BOOM!! WE ARE BROWSING, BABY!".light_magenta.underline + " " "!".white.bold + " " + "!".white.bold + " " + "!".white.bold
        show_marketplace
        pr = marketplace_navigation
        if pr == "Purchase Item"
            $current_user.purchase
            list_browse_purchase
        elsif pr == "Refresh Marketplace"
            puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".red.bold
            puts "We have refreshed the marketplace for you.".white.bold
            puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue.bold
            show_marketplace
            list_browse_purchase
        elsif pr == "List Item"
            $current_user.list
            list_browse_purchase
        elsif pr == "Change Item Price"
            $current_user.change_item_price
            list_browse_purchase
        elsif pr == "Order History"
            $current_user.view_orders
            list_browse_purchase
        elsif pr == "Exit Marketplace"
            puts "   <') ) ) ~   ~ ( ( ('>    <') ) ) ~   ~ ( ( ('>".light_yellow.bold
            puts "~ ( ( ('>".light_yellow.bold + "     " + "Thanks for stopping by!!".white.underline + "     " + "<') ) ) ~".light_yellow.bold
            puts "   ~ ( ( ('>   <') ) ) ~   ~ ( ( ('>   <') ) ) ~".light_yellow.bold
            exit
        end 
    elsif decision == "Purchase Item"
        $current_user.purchase
        list_browse_purchase
    elsif decision == "Change Item Price"
        $current_user.change_item_price
        list_browse_purchase
    elsif decision == "Order History"
        $current_user.view_orders
        list_browse_purchase
    elsif decision == "Exit Marketplace"
        puts "   <') ) ) ~   ~ ( ( ('>    <') ) ) ~   ~ ( ( ('>".light_yellow.bold
        puts "~ ( ( ('>".light_yellow.bold + "     " + "Thanks for stopping by!!".white.underline + "     " + "<') ) ) ~".light_yellow.bold
        puts "   ~ ( ( ('>   <') ) ) ~   ~ ( ( ('>   <') ) ) ~".light_yellow.bold
        exit
    end
end

def show_marketplace
    Item.generate_list
    if $available_items.any? == true
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
    else
        puts "Our marketplace currently has no items listed. Be the first one to post a new item or check back later!"
    end
end

def logvnew
    $prompt.select("Do you have an existing account?".cyan.bold, $log_new , required: true)
end

def login
    attempts = 0
    User.credential_hash
    while attempts < 3 do
    username = $prompt.ask("What is your username?".cyan.bold, required: true)
    password = $prompt.mask("What is your password?".cyan.bold, required: true)
    credentials = username + password
        if $cred_hash.keys.include?(username) == false
            puts "Username incorrect".light_red.bold
        elsif $cred_hash.values.include?(credentials) == true
            puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".red.bold
            puts "Thanks for visiting the Armadillo Trading Post, #{username}!!".white.bold
            puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue.bold
            $current_user = User.all.find_by(username: username)
            attempts = 3
        elsif $cred_hash.values.include?(credentials) == false
            puts "Username & password combination invalid.".red.bold
        end
        attempts += 1
        if attempts == 2
            puts "This is your final attempt at logging in."
        end
        if attempts == 3 
            puts "You have exceeded your login attempts. Happy trails!" 
        end
    end 
end

def access_verification
    if $current_user != nil
    else
        exit
    end
end

def new_user
    pass_attempt = 0
    user_attempt = 0
    uname = nil
    User.credential_hash

    first_last = get_name
    in_email = get_email
    loc = get_loc
    
    until $cred_hash.keys.include?(uname) == false && uname != nil do
    uname = get_user
        if $cred_hash.keys.include?(uname) == true
            puts "Username is taken. Be more creative."
        end
    end

    while pass_attempt < 3 do
        pass = get_pass
        pass2 = get_pass2
        if pass != pass2
            puts "Passwords do not match."
        elsif pass == pass2
            User.create(name: first_last, location: loc, username:uname, password: pass, email: in_email )
            puts "Thank you for creating a new account! Please use your new credentials to log in.".light_green.bold
            authenticate_or_create
            pass_attempt = 3
        end
    pass_attempt +=1

        if pass_attempt == 2
            puts "This is your final attempt at logging in."
        end
        if pass_attempt == 3  
            puts "You have exceeded your account creation attempts. Happy trails!"
            binding.pry
            exit
        end
    end
end

def authenticate_or_create
    choice = logvnew
    if choice == "Log In"
        login
    elsif choice == "Create New Account"
        new_user
    end
end

###########################################################################################################################

