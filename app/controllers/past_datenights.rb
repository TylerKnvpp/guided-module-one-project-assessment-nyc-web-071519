def launch_past_datenights_menu
    puts %Q(

        1. Most popular datenight restaurant.
        
        2. View all past dates.
        
        3. Go back
    ).on_black
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

    Your favorite restaurant is:

        Name: #{pop_res.name}

        Neighborhood: #{pop_res.neighborhood.titleize}

        Rating: #{pop_res.rating}

        Cost: #{pop_res.price}
        ).on_black
        recommend_from_popular(pop_res)
    else
        puts"\nYou have no favorite restaurant."
        launch_past_datenights_menu
    end
    #launch_past_datenights_menu 
end

def recommend_from_popular (restaurant)
    puts %Q(

        1. Create new date at this restaurant.

        2. Go back.
    ).on_black
    user_input_rfp = gets.chomp
    case user_input_rfp
    when '1','new','create new'
        prompt_date_day_of
        save_new_date(couple_id: $LOGGED_IN_ID, restaurant_id: restaurant.id, planned_date: $DAY_OF)
        puts puts %Q(
            Enjoy your datenight! Shoot for the stars 🌟
        ).on_black
        launch_past_datenights_menu
    when '2','go back','exit','back','gtfo'
        launch_past_datenights_menu
    else
        puts"\nERROR: Please enter a valid option.\n"
        recommend_from_popular(restaurant)
    end

    
end