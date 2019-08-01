def launch_main_menu
    puts %Q(

    :: Welcome to the main menu, #{logged_in_couple.full_name.green}! ::

        1. Create a DateNight

        2. View Upcoming DateNights

        3. View Past DateNights

        4. Log Out

    ).on_black
    user_input_mm = gets.chomp
    case user_input_mm.downcase 
    when "1","create","create a datenight"
        launch_create_datenight_menu
    when "2","upcoming","view upcoming","view upcoming dates"
        launch_upcoming_datenights_menu
    when "3","past","view past","view upcoming dates"
        launch_past_datenights_menu
    when "4","log out","exit","log","gtfo",'bye', 'gtfo', 'c ya'
        launch_login_menu
    else 
        puts "ERROR: Please enter a valid option."
        launch_main_menu
    end  
end

