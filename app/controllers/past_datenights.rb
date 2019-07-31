def launch_past_datenights_menu
    puts %Q(
        1. Most popular Datenights.
        2. View all.
        3. Have I been there?
        4. Go back
    )
    user_input_past_date = gets.chomp
    case user_input_past_date.downcase
    when '1','datenights','datenight'
        view_popular_datenights
    when '2','view all'
        view_all_datenights
    when '3','been there','have I been there'
        user_restaurant_search
    when '4','back','go back'
        launch_main_menu
    when 'exit'
        launch_login_menu
    end
end

def user_all_datenights
    Datenight.where user_id: $LOGGED_IN_ID
end

def view_all_datenights
    temp_string = ''
    user_all_datenights.each do |datenight|
        temp_string = temp_string + "\n#{datenight.restaurant.name.titleize} on #{datenight.planned_date}"
    end
    header_string = ':: Past Datenights ::'
    show_table(temp_string, header_string)
end

