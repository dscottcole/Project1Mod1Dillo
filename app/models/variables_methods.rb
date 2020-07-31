ActiveRecord::Base.logger = nil

scott = User.all[0]
ted = User.all[1]
bobby = User.all[2]
marshall = User.all[3]
$prompt = TTY::Prompt.new
$current_user = nil
$choice_array = ["List Item", "Browse", "Purchase Item", "Change Item Price", "Order History", "Log Out"]
$choice_array2 = ["Purchase Item", "Refresh Marketplace", "List Item", "Change Item Price", "Order History", "Log Out"]
$log_new_browse = ["Log In", "Create New Account", "Browse Without Logging In"]
$cond = ["New", "Used Like New", "Used Fair", "Used Not Great"]
$cat = ["Active", "Gaming", "Clothing", "Furniture", "Computers", "Household", "Hardware Auto"]
$salesvpurch = ["Sales", "Purchases"]


def welcome
puts " "
puts " "
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".red.bold
puts "H".light_red.bold + " " + "o".light_red.bold + " " + "w".light_red.bold + " " + "d".light_red.bold + " " + "y".light_red.bold + " " + "Y'all".white.bold + "!!!".light_blue.bold + " " + "Welcome to the Armadillo Trading Post. You can list and procure anything 'cept 'dillos.".white.bold
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
".light_yellow.bold
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".red.bold
puts "       <') ) ) ~       <') ) ) ~       <') ) ) ~       ~ ( ( ('>       ~ ( ( ('>       ~ ( ( ('>      ".white.bold
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue.bold
end

def thank_you
    puts "   <') ) ) ~   ~ ( ( ('>    <') ) ) ~   ~ ( ( ('>".light_yellow.bold
    puts "~ ( ( ('>".light_yellow.bold + "     " + "Thanks for stopping by!!".white.underline + "     " + "<') ) ) ~".light_yellow.bold
    puts "   ~ ( ( ('>   <') ) ) ~   ~ ( ( ('>   <') ) ) ~".light_yellow.bold
end

def interest
    $prompt.select("What would you like to do?".light_yellow.bold, $choice_array, required: true)
end
def marketplace_secondary_nav
    $prompt.select("Select from the following:".light_yellow.bold, $choice_array2, required: true)
end
def get_name
    $prompt.ask("Please enter your first and last. (examples: John Doe, Jane Doe)".light_yellow.bold, required: true)
end
def get_loc
    $prompt.select("Where are you located?".light_yellow.bold, %w(Houston Austin Dallas), required: true)
end
def get_user
    $prompt.ask("Please enter a username.".light_yellow.bold, required: true)
end
def get_pass
    $prompt.mask("Please enter a password.".light_yellow.bold, required: true)
end
def get_pass2
    $prompt.mask("Please repeat your password.".light_yellow.bold, required: true)
end
def get_email
    $prompt.ask('What is your email?'.light_yellow.bold) do |q| 
        q.validate :email
        q.required true
        q.messages[:email] = "Invalid email address"
    end
end
def logvnewvbrowse
    $prompt.select("Do you have an existing account?".light_yellow.bold, $log_new_browse , required: true)
end

def marketplace_menu
    Item.generate_list
    decision = interest
    if decision == "List Item"
        $current_user.list
        puts "Best of luck!".white.bold
        marketplace_menu
    elsif decision == "Browse"
        show_marketplace
        pr = marketplace_secondary_nav
        if pr == "Purchase Item"
            $current_user.purchase
            marketplace_menu
        elsif pr == "Refresh Marketplace"
            show_marketplace
            marketplace_menu
        elsif pr == "List Item"
            $current_user.list
            marketplace_menu
        elsif pr == "Change Item Price"
            $current_user.change_item_price
            marketplace_menu
        elsif pr == "Order History"
            $current_user.view_orders
            marketplace_menu
        elsif pr == "Log Out"
            # thank_you
            system "clear"
            welcome
            authenticate_or_create_or_browse
            access_verification
            marketplace_menu
        end 
    elsif decision == "Purchase Item"
        $current_user.purchase
        marketplace_menu
    elsif decision == "Change Item Price"
        $current_user.change_item_price
        marketplace_menu
    elsif decision == "Order History"
        $current_user.view_orders
        marketplace_menu
    elsif decision == "Log Out"
        # thank_you
        system "clear"
        welcome
        authenticate_or_create_or_browse
        access_verification
        marketplace_menu
    end
end

def show_marketplace
    system "clear"
    puts " "
    puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".red.bold
    puts "                  Available Marketplace Items:                  ".white.bold
    puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue.bold
    Item.generate_list
    if $available_items.any? == true
        $available_items.each do |i|
            puts "============================================================".red.bold
            puts "Item Name:".light_yellow.bold
            puts i.item_name
            puts "Category:".light_yellow.bold
            puts i.category
            puts "Condition:".light_yellow.bold
            puts i.condition
            puts "Price:".light_yellow.bold
            puts i.price
            puts "Item Description:".light_yellow.bold
            puts i.description
            puts "Item Location:".light_yellow.bold
            puts i.location
            puts "============================================================".blue.bold
            sleep 0.75
        end
    elsif $available_items.any? == false
        puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".red.bold
        puts "          Our marketplace currently has no items listed. Post a new item or check back later!          ".white.bold
        puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue.bold
    end
end

def login
    attempts = 0
    User.credential_hash
    while attempts < 3 do
    username = $prompt.ask("What is your username?".light_yellow.bold, required: true)
    password = $prompt.mask("What is your password?".light_yellow.bold, required: true)
    credentials = username + password
        if $cred_hash.keys.include?(username) == false
            puts "Username incorrect".red.bold
        elsif $cred_hash.values.include?(credentials) == true
            system "clear"
            puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".red.bold
            puts "Thanks for visiting the Armadillo Trading Post, #{username}!!".white.bold
            puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".blue.bold
            $current_user = User.all.find_by(username: username)
            attempts = 3
        elsif $cred_hash.values.include?(credentials) == false
            puts "Username & password combination invalid.".red.bold
        end
        attempts += 1
        if attempts == 2
            puts "This is your final attempt at logging in.".red.bold
        end
        if attempts == 3 
            puts "You have exceeded your login attempts.".red.underline + " " + "Happy trails!".light_yellow.bold
            exit
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
            puts "Username is taken. Be more creative.".red.bold
        end
    end

    while pass_attempt < 3 do
        pass = get_pass
        pass2 = get_pass2
        if pass != pass2
            puts "Passwords do not match.".red.bold
        elsif pass == pass2
            User.create(name: first_last, location: loc, username:uname, password: pass, email: in_email )
            puts "Thank you for creating a new account! Please use your new credentials to log in.".light_green.bold
            authenticate_or_create_or_browse
            pass_attempt = 3
        end
    pass_attempt +=1

        if pass_attempt == 2
            puts "This is your final attempt at logging in.".white.bold
        end
        if pass_attempt == 3  
            puts "You have exceeded your account creation attempts.".red.underline + " " + "Happy trails!".light_yellow.bold
            binding.pry
            exit
        end
    end
end

def authenticate_or_create_or_browse
    choice = logvnewvbrowse
    if choice == "Log In"
        login
    elsif choice == "Create New Account"
        new_user
    elsif choice == "Browse Without Logging In"
        show_marketplace
        authenticate_or_create_or_browse
    end
end

###########################################################################################################################

def sleeper(stringythingy, sleepytime)
    for i in stringythingy.chars.to_a do
        print i
    sleep sleepytime
    end
end