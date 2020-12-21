class NflsBest::CLI

    def start
    welcome
    teams
    my_team
    my_player
    goodbye
    end
    def welcome
        puts "*****************************************************************"
        puts "***                                                           ***"
        puts "***                                                           ***"
        puts "***                   The NFL'S Top 10 Best!                  ***"
        puts "***                           " + "2020".blue + "                            ***"
        puts "***                                                           ***"
        puts "***        'Ability is what you’re capable of doing.          ***"
        puts "***   Motivation determines what you do. Attitude determines  ***"
        puts "***        determines how well you do it.' –Lou Holtz         ***"
        puts "***                                                           ***"
        puts "*****************************************************************"
        @teams = Scraper.top_teams
        @players = Scraper.top_players
    end

    def teams
    puts "NFL's Top Teams"
    NflsBest::Team.display_grid_of_teams(@teams)
    end

    def players
        puts "NFL'S Top Players"
        NflsBest::Player.display_players
    end

    def my_team
        input = nil
        while input != "exit"
            puts "   Enter a team name listed above to find out more or  " 
            puts "             " + "next".blue + " to discover the top player               "
            puts "                    or " + "exit".blue + " to exit. "
            input = gets.strip.downcase
            @team = NflsBest::Team.find_by_name(input)

            if @team != nil 
                display_team_data
            # elsif input.downcase == "top teams"
            #     teams
                # puts "type the number of the team you'd like to know more about or 'next' to discover your top player or 'exit' to exit: "
            elsif input.downcase == "next"
                my_player
               break
            elsif input.downcase == "exit"
                goodbye
                exit(true)
            else
                puts "   " + "Wrong input".red + "   "
            end
        
        end
    end

    def display_team_data
        puts "Name: "+@team.name
        puts "Rank: "+@team.rank
        @team.display_roster
        # puts "         Enter more to learn more about your top team!!!"
    end

    def my_player
        input = nil
        while input != "exit"
            puts "   Enter your player's name from a top 10 team to know more   "
            puts "          or " + "top players".blue + " for Top 10 Players          "
            puts "            or " + "back".blue + " to restart or enter " + "exit".blue + " if done:              "

            input = gets.strip.downcase
            @player = NflsBest::Player.find_by_name(input)
            if @player != nil 
                display_player_data
            elsif input.downcase == "top players"
                NflsBest::Player.display_top_players
            elsif input.downcase == "exit"
                goodbye
                exit(true)
            elsif input.downcase == "back"
                start
            else
                puts "Player not ranked."
             end
        end
     end

     def display_player_data
        @player.display_player_info
        
    end

    def goodbye
        puts "*****************************************************************"
        puts "***                                                           ***"
        puts "***                                                           ***"
        puts "***    'Football is like life. It requires perseverance,      ***"
        puts "***             self-denial, hard work, sacrifice,            ***"
        puts "***   dedication, and respect for authority.' –Vince Lombardi ***"
        puts "***                                                           ***"
        puts "***                                                           ***"
        puts "*****************************************************************"
    end
end