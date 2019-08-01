def first_login
    welcome_message
    launch_login_menu
end

def launch_login_menu
    
    puts %Q(

    #{':: D A T E  N I G H T ::'.light_magenta}

        1. Log in

        2. Sign up?

        3. Exit
    ).on_black
    user_input_start = gets.chomp
    case user_input_start.downcase
    when '1','log in'
        login_method
    when '2','sign up'
        sign_up_method
    when '3','exit', "gtfo",'bye', 'gtfo', 'c ya'
        return exit
    else
        puts "ERROR: Please enter a valid option."
        launch_login_menu
    end
end

def welcome_message
    puts %Q(
   #{'  WELCOME  '.on_black.flash}
   #{'    TO     '.on_black.flash}
   #{' DATENIGHT '.light_magenta.on_black.long_flash}
    )
end

def login_attempt
    puts %Q(
User Name: ).on_black
        user_input_uname = gets.chomp
    puts %Q(
Password: ).on_black
        user_input_pword = gets.chomp
        puts ''
     couple_login_attempt = Couple.all.find{|couple| (couple.username == user_input_uname) && (couple.password == user_input_pword)}
     if couple_login_attempt 
        $LOGGED_IN_ID = couple_login_attempt.id 
        launch_main_menu
     else 
        failed_attempt
     end
end

def login_method
    puts "\nPlease enter your username and password.".on_black
    login_attempt
end

def failed_attempt
    puts %Q(

ERROR: Invalid Username or Password

        1. Try again

        2. Sign up for a new account

        3. Exit
    ).on_black
    user_input_failed_attempt = gets.chomp
    case user_input_failed_attempt.downcase
    when '1','log in','try again'
        login_attempt 
    when '2','sign up','sign up for a new account','new'
        sign_up_method
    when '3','exit', "gtfo",'bye', 'gtfo', 'c ya'
        return exit
    else
        failed_attempt
    end
end

def sign_up_method
    puts %Q(

     :: 🍷 Welcome to DateNight! 🍝  ::

     :: 🌟 Shoot for the Stars! 🌟  ::


Please add your name, username & password. Enter exit at any time to quit.
    ).on_black
    puts %Q(
Full Name: ).on_black
        user_input_sign_up_fname = gets.chomp
        quit_if_exit(user_input_sign_up_fname)
    puts %Q(
Username: ).on_black
        user_input_sign_up_uname = gets.chomp
        quit_if_exit(user_input_sign_up_uname)
    puts %Q(
Password: ).on_black
        user_input_sign_up_pword = gets.chomp
        quit_if_exit(user_input_sign_up_pword)

    puts "" .on_black
    new_couple = Couple.create({username: user_input_sign_up_uname, password: user_input_sign_up_pword, full_name:user_input_sign_up_fname})
    $LOGGED_IN_ID = new_couple.id
    launch_main_menu
end

def quit_if_exit (string)
    return exit if string.downcase == 'exit'
end