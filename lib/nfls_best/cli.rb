class NflsBest::CLI

    def start
    welcome
    my_team
    my_player
    goodbye
    end
    def welcome
        puts "*****************************************************************"
        puts "***                                                           ***"
        puts "***                                                           ***"
        puts "***                 The NFL'S Top 10 Best!                    ***"
        puts "***                         2020                              ***"
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
    NflsBest::Team.display_teams
    end

    def players
        puts "NFL'S Top Players"
        NflsBest::Player.display_players
    end

    def my_team
        input = nil
        while input != "exit"
            puts "   Enter your team's name to dicover their rank then enter,   " 
            puts "             'next' to discover your top player,                "
            puts "     or 'top teams' for a list of the Top 10 teams ranked:      "
            
            input = gets.strip.downcase
            @team = NflsBest::Team.find_by_name(input)

            if @team != nil 
                display_team_data
            elsif input.downcase == "top teams"
                teams
            elsif input.downcase == "next"
                my_player
               break
            elsif input.downcase == "exit"
                goodbye
                exit(true)
            else
                puts "Team not ranked."
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
            puts "   Enter your player's name to discover their rank   "
            puts "          or top players for Top 10 Players          "
            puts "             then enter exit when done:              "

            input = gets.strip.downcase
            @player = NflsBest::Player.find_by_name(input)
            if @player != nil 
                display_player_data
            elsif input.downcase == "top players"
                players
            elsif input.downcase == "exit"
                goodbye
                exit(true)
            else
                puts "Player not ranked."
             end
             

            #  puts " Enter more to learn more about your top player!!!"

        end
     end

     def display_player_data
        puts "Name: "+@player.name
    
        
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