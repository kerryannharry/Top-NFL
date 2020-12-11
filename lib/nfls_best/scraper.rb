class Scraper 
    URL = "https://www.nfl.com/news/2020-nfl-season-saints-falcons-headline-10-most-talented-teams"
    PLAYERS_URL = "https://www.nfl.com/news/top-100-players-patrick-mahomes-at-no-4-let-s-re-rank-the-top-10"
    def self.top_teams
        html = URI.open(URL)
        doc = Nokogiri::HTML(html)
        teams_info = doc.css("#main-content > article > div:nth-child(2) > div div.d3-l-col__col-8 div.nfl-o-ranked-item")
        teams_info.map do |team|
            team_rank = team.css("div.nfl-o-ranked-item__label").text.strip.gsub(/[\s\n\D]/,"")
            team_name = team.css("div.nfl-o-ranked-item__title").text.strip
            team_description = nil
            NflsBest::Team.new(team_name, team_rank, team_description)
        end
    end
    def self.top_players
        html = URI.open(PLAYERS_URL)
        doc = Nokogiri::HTML(html)
        players_info = doc.css("#main-content > article > div:nth-child(2) > div div.d3-l-col__col-8 div.nfl-o-ranked-item")
        players_info.each do |player|
            player_rank = player.css("div.nfl-o-ranked-item__label").text.strip.gsub(/[\s\n\D]/,"")
            player_name = player.css("div.nfl-o-ranked-item__title").text.strip
            player_team = player.css("div.nfl-o-ranked-item__info").text.split("·")[0].strip
            team_instance = NflsBest::Team.find_or_create_by_name(player_team)
            player_bio = nil
            NflsBest::Player.new(player_name, player_rank, team_instance, player_bio)
            
        end
    
    end
end