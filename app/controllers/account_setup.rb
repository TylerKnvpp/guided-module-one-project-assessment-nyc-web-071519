def start_prompt
    puts "D A T E  N I G H T"
    puts "1. Log in"
    puts "or"
    puts "2. Sign up?"
    puts "Exit"
    user_input_start = gets.chomp
    if user_input_start.downcase == ('1' || 'log in')
        login_method
    elsif user_input_start.downcase == ('2' || 'sign up')
        sign_up_method
    elsif user_input_start.downcase == 'exit'
        return
    else
        puts "Please enter one of the above options"
        start_prompt
    end
end

def login_attempt
    puts "Username: "
        user_input_uname = gets.chomp
    puts "Password: "
        user_input_pword = gets.chomp
     couple_login_attempt = Couple.all.find{|couple| (couple.username == user_input_uname) && (couple.password == user_input_pword)}
     if couple_login_attempt 
        $LOGGED_IN_ID = couple_login_attempt.id 
        launch_main_menu
     else 
        failed_attempt
     end
end

def login_method
    puts "Please enter your username and password."
    login_attempt
end

def failed_attempt
    puts "ERROR: Invalid Username or Password"
    puts "Enter 1 to try again or 2 to sign up for a new account."
    user_input_failed_attempt = gets.chomp
    if user_input_failed_attempt.downcase == ('1' || 'log in')
        login_attempt 
    elsif user_input_failed_attempt.downcase == ('2' || 'sign up')
        sign_up_method
    else
        failed_attempt
    end
end

def sign_up_method
    puts "Welcome to DateNight!"
    puts "Shoot for the Stars!"
    puts "Please add your name, username & password."
    puts "Full Name: "
        user_input_sign_up_fname = gets.chomp
    puts "Username: "
        user_input_sign_up_uname = gets.chomp
    puts "Password: "
        user_input_sign_up_pword = gets.chomp

    new_couple = Couple.create({username: user_input_sign_up_uname, password: user_input_sign_up_pword, full_name:user_input_sign_up_fname})
    $LOGGED_IN_ID = new_couple.id
    launch_main_menu
end