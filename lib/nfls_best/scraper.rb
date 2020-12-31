class Scraper 
    URL = "https://www.nfl.com/news/2020-nfl-season-saints-falcons-headline-10-most-talented-teams"
    PLAYERS_URL = "https://www.nfl.com/news/top-100-players-patrick-mahomes-at-no-4-let-s-re-rank-the-top-10"
    def self.top_teams
        # teams = []
        html = URI.open(URL)
        doc = Nokogiri::HTML(html)
        teams_info = doc.css("#main-content > article > div:nth-child(2) > div div.d3-l-col__col-8 div.nfl-o-ranked-item")
        teams_info.each do |team|
            team_rank = team.css("div.nfl-o-ranked-item__label").text.strip.gsub(/[\s\n\D]/,"")
            team_name = team.css("div.nfl-o-ranked-item__title").text.strip
            team_description = nil
            team = NflsBest::Team.new(team_name, team_rank, team_description)
            # teams << team
            # get_team_roster(team)
            # team
        end
        # return teams
    end
    # def self.get_player_info
    #     players_url = "https://www.nfl.com/players/#{player.name.downcase.gsub(" ","-")}/"
    #     html = URI.open(players_url)
    #     doc = Nokogiri::HTML(html)
      
    #     line = doc.css("#main-content > section:nth-child(4) > div > div.d3-l-col__col-8 > section > div > div > div > section > div > div.d3-l-col__col-12.nfl-c-player-info__content")
    # end
    def self.get_team_roster(team)
        url = "https://www.nfl.com/teams/#{team.name.downcase.gsub(" ","-")}/roster"
        html = URI.open(url)
        doc = Nokogiri::HTML(html)
        rows = doc.css("#main-content > section:nth-child(5) > div > div:nth-child(2) > div > div.d3-o-table--horizontal-scroll > table > tbody tr")
        rows.each do |row|
            player_name = row.css("td a").text
            player_position = row.css("td")[2].text
            player_height =  row.css("td")[4].text
            player_weight =  row.css("td")[5].text
            player_experience =  row.css("td")[6].text
            player_college =  row.css("td")[7].text
            player = NflsBest::Player.find_or_create_by_name(player_name)
            player.position = player_position
            player.height = player_height
            player.weight = player_weight
            player.experience = player_experience
            player.college = player_college
            player.team = team
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
            player_bio = player.css("div.nfl-c-body-part--text > p:nth-child(1)").text.strip
            team_instance = NflsBest::Team.find_or_create_by_name(player_team)
            NflsBest::Player.new(player_name, player_rank, team_instance, player_bio)
            
        end
    
    end

end