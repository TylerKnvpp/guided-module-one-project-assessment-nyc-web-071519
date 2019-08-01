
# ADVICE ARRAY FOR RELATIONSHIP ADVICE WITHIN UPCOMING DATES
$ADVICE_ARRAY = [
        '🥺 Break up with them  💔',
        '🌟 Shoot for the stars  🌟',
        'Take them to a more expensive restaurant  🤑',
        'Listen to your heart  🥰',
        'Ask again later 🙄',
        'Brush your teeth 😁',
        'No seriously, brush your teeth 🦷',
        "Also floss 👄",
        "Never laugh at your date's choices. You are one of them.  😂",
        'Happy wife, happy life',
        'Don\'t fake it',
        '🤬 Never go to sleep angry 😴',
        'Humility is sexy',
        'Live in the moment',
        'Call your mother ☎️',
        '🧠 Think before you speak 🗣',
        '🤷‍♂️ Outcome uncertain 🤷‍♂',
        'When you argue, always end by complimenting each other.',
        'Find peace and happiness in little things',
        'Being more mindful is always a step in the right direction.',
        '📞 Phone a friend ☎️',
        'Change your shirt',
        'Don\'t order the spaghetti 🍝',
        'You already know the answer in your heart ❤️',
        'Make it up as you go',
        'Have fun!',
        '🚪 Hold the door 🤵',
        '🍸 If you drink, don\'t drink too much 🤮'
    ]


#GLOBAL VARIABLE FOR RELATIONSHIP ADVICE
$DR_PHIL = rand($ADVICE_ARRAY.length - 1)


def launch_upcoming_datenights_menu
    puts %Q(

        1. View upcoming datenights.

        2. Cancel Date/break up with significant other?

        3. Relationship advice?

        4. Go back
    ).on_black

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
        puts "\nERROR: Please enter a valid option.\n"
        launch_upcoming_datenights_menu
    end


end


def user_upcoming_datenights
    all_datenights = user_all_datenights
    all_datenights.select do |date| 
        if date.planned_date
            date.planned_date > Time.now
        end
    end
end

def view_future_datenights
    temp_string = ''
    user_upcoming_datenights.each do |datenight|
        #binding.pry
        temp_string = temp_string + "\n#{datenight.restaurant.name.titleize} on #{datenight.planned_date}" if datenight.restaurant
    end
    header_string = ':: Future Datenights ::'
    show_table(temp_string, header_string)
    launch_upcoming_datenights_menu
end

def dates_index_helper
    mt_string = ''
    dates_array = user_upcoming_datenights
    datenight_index = 1

    dates_array.each do |dn|
        mt_string = mt_string + "#{datenight_index}. #{dn.restaurant.name.titleize} on #{dn.planned_date}\n\n"
        datenight_index += 1
    end
    puts "\n\n"
    puts mt_string
    puts "You have no upcoming dates.\n" if mt_string == ''
end


def cancel_upcoming_date
    dates_index_helper
    puts %Q(

If you would like to cancel a date, enter the number of the date to cancel. 
Enter 0 to return to menu.

    ).on_black
    user_input_cancel_date = gets.chomp.to_i
    if (user_input_cancel_date == 0)
        launch_upcoming_datenights_menu
    elsif (user_input_cancel_date <= user_upcoming_datenights.length)
        user_upcoming_datenights[(user_input_cancel_date.to_i - 1)*-1].destroy
        puts "\n Cancelled date!\n"
        launch_upcoming_datenights_menu
    else
        puts "\nERROR: Please enter a valid option.\n"
        cancel_upcoming_date
    end
end

def give_relationship_advice

    if $DR_PHIL >= $ADVICE_ARRAY.length
        $DR_PHIL = 0
    end

    puts %Q(

        :: #{$ADVICE_ARRAY[$DR_PHIL].light_red} ::
    ).on_black
    $DR_PHIL += 1
    
    launch_upcoming_datenights_menu
end