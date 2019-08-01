def launch_past_datenights_menu
    puts %Q(
        1. Most popular Datenights.

        2. View all past dates.
        
        3. Go back
    )
    user_input_past_date = gets.chomp
    case user_input_past_date.downcase
    when '1','datenights','datenight'
        view_most_popular_datenight
    when '2','view all','view past'
        view_past_datenights
    when '3','back','go back', 'bye', 'gtfo', 'c ya'
        launch_main_menu
    else
        puts "\nERROR: Enter a valid response.\n"
        launch_past_datenights_menu
    end
end

def user_all_datenights
    Datenight.where couple_id: $LOGGED_IN_ID
end

def user_past_datenights
    all_datenights = user_all_datenights
    all_datenights.select do |date| 
        if date.planned_date
            date.planned_date < Time.now
        end
    end
end

def view_past_datenights
    temp_string = ''
    user_past_datenights.each do |datenight|
        temp_string = temp_string + "\n#{datenight.restaurant.name.titleize} on #{datenight.planned_date}" if datenight.restaurant
    end
    header_string = ':: Past Datenights ::'
    show_table(temp_string, header_string)
    launch_past_datenights_menu
end

def view_most_popular_datenight
    all_dates = user_all_datenights
    all_dates = all_dates.map {|datenight| datenight.restaurant if datenight.restaurant}
    pop_res = all_dates.compact.max_by{|restaurant| all_dates.count(restaurant)}
    if pop_res
        puts %Q(
    Your most popular restaurant was:

        Name: #{pop_res.name}

        Neighborhood: #{pop_res.neighborhood.titleize}

        Rating: #{pop_res.rating}

        Cost: #{pop_res.price}
        )
    else
        puts"\nYou have no most popular restarant."
    end
    launch_past_datenights_menu 
end

