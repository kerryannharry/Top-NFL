class NflsBest::CLI

    def start
    puts "The NFL'S Best!"
    # Scraper.top_teams
    team
    players
    my_team
    goodbye
    end

    def team
    puts "NFL's Top Teams"
    puts <<-DOC.gsub /^\s*/,''
            1. New Orleans Saints
            2. Atlanta Falcons
            3. Baltimore Ravens
        DOC
    @teams = NflsBest::Team.all
    end

    def players
        puts "NFLS's Top Players"
        puts <<-DOC.gsub /^\s*/,''
        1. Patrick Mahomes
        2. Aaron Donald
        3. Lamar Jackson
        DOC
        # @players = NflsBest::Player.all
    end

    def my_team
        input = nil
        while input != "exit"
            puts "Enter your team to find rank then enter exit when done:"

            input = gets.strip.downcase
            case input
            when "New Orleans Saints"
                puts "Rank: 1"
            when "Atlanta Falcons"
                 puts "Rank: 2"
            when "Baltimore Ravens"
                puts "Rank: 3"
            else 
                puts "Team not ranked."
             end
        end
    end

    def my_player
        input = nil
        while input != "exit"
            puts "Enter your player to find rank then enter exit when done:"

            input = gets.strip.downcase
            case input
            when "Patrick Mahomes"
                puts "Rank: 1"
            when "Aaron Donald"
                 puts "Rank: 2"
            when "Lamar Jackson"
                puts "Rank: 3"
            else 
                puts "Player not ranked."
             end
        end
        end

    def goodbye
        puts "It Takes All Of Us: End Racism"
    end
end