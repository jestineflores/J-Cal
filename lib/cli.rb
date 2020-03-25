class Cli
    attr_reader :current_user

    def create_calendar
        if @current_user.calendar.nil?
            @current_user.calendar = Calendar.create(:user_id => @current_user.id)
        end
        @current_user.calendar
    end

    def saturn_image

        puts "
                 ,MMM8&&&.
            _...MMMMM88&&&&..._
         .::'''MMMMM88&&&&&&'''::.
        ::     MMMMM88&&&&&&     ::
        '::....MMMMM88&&&&&&....::'
           `''''MMMMM88&&&&''''`
                 'MMM8&&&'
      "
        puts "\n\n"
    end

    def welcome
        saturn_image
        puts "Please type in your username:"
        new_username = gets.strip
        new_user = User.create({username: new_username})
        @current_user = User.find_or_create_by(username: new_username)
        create_calendar

        t = Time.now
        if t < Calendar::noon
            puts "Good Morning, #{new_username}!"
        elsif t < Calendar::evening && t > Calendar::noon
            puts "Good Afternoon, #{new_username}!"
        else
            puts "Good Evening, #{new_username}."
        end
    

    def main_menu
        prompt = TTY::Prompt.new
        selection = prompt.select("How may I assist you today?", ["Create Event", "View Calendar", "Delete Event"])

        case selection
        when "Create Event"
            create_event
        when "View Calendar"
            view_calendar
        when "Delete Event"
            delete_event
        end
    end

    def create_event 
        puts "What do you want to title your event?"
        new_event_title = gets.chomp
        puts "What is the location of your event?"
        new_event_location = gets.chomp
        puts "What is the time & date your event starts? (Necessary Ex: 2020-11-15 15:00)"
        new_event_start_time = gets.chomp
        puts "What time & date does your event end? (Necessary Ex: 2020-11-15 15:00)"
        new_event_end_time = gets.chomp
        create_event = Event.create(event: new_event_title, location: new_event_location, start_time: new_event_start_time, end_time: new_event_end_time, calendar_id: @current_user.calendar.id)
        main_menu
        end
    end
        # prompt = TTY::Prompt.new
        # new_event_start_time = prompt.select('What is the time & date your event starts?', ["00:00", "00:30", "01:00"])
        # case new_event_start_time
        # when "00:00"
        #     midnight
        # when "00:30"
        #     midnight30
        # when "01:00"
        #     oneam
        # end

        # new_event_start_time = gets.chomp
            # "01:30", 
            # "02:00", 
            # "02:30", 
            # "03:00", 
            # "03:30", 
            # "04:00", 
            # "04:30", 
            # "05:00", 
            # "05:30", 
            # "06:00",
            # "06:30",
            # "07:00",
            # "07:30",
            # "08:00",
            # "08:30",
            # "09:00",
            # "09:30",
            # "10:00",
            # "10:30",
            # "11:00",
            # "11:30",
            # "12:00",
            # "12:30",
            # "13:00",
            # "13:30",
            # "14:00",
            # "14:30",
            # "15:00",
            # "15:30",
            # "16:30",
            # "17:00",
            # "17:30",
            # "18:00",
            # "18:30",
            # "19:00",
            # "19:30",
            # "20:00",
            # "20:30",
            # "21:00",
            # "21:30",
            # "22:00",
            # "22:30",
            # "23:00",
            # "23:30"
    

    def view_calendar
        events = @current_user.event.order(:start_time)
        pp events
        if @current_user.event == []
            puts "It looks like your schedule is free.. Have a nice day!"
        end
        main_menu
    end

    def delete_event
        prompt = TTY::Prompt.new 
        selection = prompt.select("What would you like to delete? ", ["Single Events", "Whole Calendar", "Nothing"])
        case selection
        when "Single Events"
            puts "What event do you want to delete?"
            deleted_event = gets.chomp
            Event.find_by(event: deleted_event).destroy
            main_menu
        when "Whole Calendar"
            delete_calendar
            main_menu
        when "Nothing"
            main_menu
        end
    end

        
    def delete_calendar
        puts @current_user.calendar.id
        @current_user.calendar.destroy!
        main_menu
    end
end
