def launch_main_menu
    puts "Welcome to the main menu, #{logged_in_couple.full_name}!"
    puts "1. Create a DateNight"
    puts "2. View Upcoming DateNights"
    puts "3. View Past DateNights"
    puts "4. Log Out"
    user_input_mm = gets.chomp
    case user_input_mm.downcase 
    when "1" || "create" || "create a datenight"
        launch_create_datenight_menu
    when "2" || "upcoming" || "view upcoming" || "view upcoming dates"
        launch_past_datenights_menu
    when "3" || "past" || "view past" || "view upcoming dates"
        launch_upcoming_datenights_menu
    when "4" || "log out" || "exit" || "log" || "gtfo"
        launch_login_menu
    else 
        "Please enter a valid response."
        launch_main_menu
    end  
end

