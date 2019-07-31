def launch_upcoming_datenights_menu
    puts %Q(
        1. View upcoming datenights.

        2. Cancel Date/break up with significant other?

        3. Relationship advice?

        4. Go back
    )

    user_input_upcoming_date = gets.chomp

    case user_input_upcoming_date.downcase
    when '1', 'view', 'upcoming', 'view upcoming', 'hot date'
        view_future_datenights
    when '2', 'cancel', 'cancel date', 'see ya', 'yah', 'yeet', 'break up', 'its not you, its me'
        cancel_upcoming_date
    when '3', 'relationship', 'advice', 'hit me', 'happy wife, happy life', 'dr phil me'
        give_relationship_advice
    when '4', 'exit', 'go back', 'bye', 'gtfo', 'c ya'
        launch_main_menu
    else
        puts "\nERROR: Enter a valid response.\n"
        launch_past_datenights_menu
    end


end


def view_user_upcoming_datenights
    all_datenights = user_all_datenights
    all_datenights.select do |date| 
        if date.planned_date
            date.planned_date > Time.now
        end
    end
end

def view_future_datenights
    temp_string = ''
    view_user_upcoming_datenights.each do |datenight|
        temp_string = temp_string + "\n#{datenight.restaurant.name.titleize} on #{datenight.planned_date}"
    end
    header_string = ':: Future Datenights ::'
    show_table(temp_string, header_string)
    launch_upcoming_datenights_menu
end

# call view_user_upcoming_datenights
# ^ returns user's upcoming dates
# print user's upcoming dates w/ index number + 1


def dates_index_helper
    mt_string = ''
    dates_array = view_user_upcoming_datenights
    datenight_index = 1

    dates_array.each do |dn|
        mt_string = mt_string + "#{datenight_index}. #{dn.restaurant.name.titleize} on #{dn.planned_date}\n\n"
        datenight_index += 1
    end
    puts "\n\n"
    puts mt_string
end


def cancel_upcoming_date


    dates_index_helper

    puts %Q(

If you would like to cancel a date, enter the number of the date to cancel. 
Enter back or exit to return to menu.

    ) 

    user_input_cancel_date = gets.chomp

end

