class NflsBest::CLI

    def start
    welcome
    my_team
    teams
    my_player
    players
    goodbye
    end
    def welcome
        puts "The NFL'S Best!"
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
            puts "Enter your team to find rank then enter exit when done:"
            
            input = gets.strip.downcase
            @team = NflsBest::Team.find_by_name(input)
            if @team != nil 
                display_team_data
            else 
                puts "Team not ranked."
             end
        end
    end

    def display_team_data
        puts @team.name
        puts @team.rank
        puts @team.description
    end

    def my_player
        input = nil
        while input != "exit"
            puts "Enter your player to find rank then enter exit when done:"

            input = gets.strip.downcase
            @player = NflsBest::Player.find_by_name(input)
            if @player != nil 
                display_player_data
            else 
                puts "Player not ranked."
             end
        end
     end

     def display_player_data
        puts @player.name
        puts @player.rank
        puts @player.team
        puts @player.bio
    end

    def goodbye
        puts "It Takes All Of Us: End Racism"
    end
end