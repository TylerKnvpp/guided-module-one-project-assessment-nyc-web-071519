def launch_main_menu
    puts "Welcome to the main menu, #{logged_in_couple.full_name}!"
    puts "1. Create a DateNight"
    puts "2. View Upcoming DateNights"
    puts "3. View Past DateNights"
    puts "4. Log Out"
    user_input_mm = gets.chomp
    case user_input_mm.downcase 
    when "1" || "create" || "create a datenight"
        create_a_datenight
    when "2" || "upcoming" || "view upcoming" || "view upcoming dates"
        view_past_datenights
    when "3" || "past" || "view past" || "view upcoming dates"
        view_upcoming_datenights
    when "4" || "log out" || "exit" || "log" || "gtfo"
        start_prompt
    else 
        "Ya done goofed, bud."
        launch_main_menu
    end


    
end

def create_a_datenight
end
