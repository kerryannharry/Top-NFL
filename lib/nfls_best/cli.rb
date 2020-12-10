class NflsBest::CLI

    def start
    puts "The NFL'S Best!"
    Scraper.top_teams
    team
    players
    personal
    goodbye
    end

    def team
    puts "NFL's Top Teams"
    @teams = NflsBest::Team.all
    end

    def players
        puts "NFLS's Top Players"
        puts <<-DOC.gsub /^\s*/,''
        1. Patrick Mahomes
        2. Aaron Donald
        3. Lamar Jackson
        DOC
    end

    def personal
        input = nil
        while input != "exit"
            puts "Enter your team to find rank:"

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

    def goodbye
        puts "It Takes All Of Us: End Racism"
    end
end