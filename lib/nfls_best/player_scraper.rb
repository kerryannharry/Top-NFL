require "pry"
class Player_Scraper 
    URL = "https://www.nfl.com/news/top-100-players-patrick-mahomes-at-no-4-let-s-re-rank-the-top-10"
    def self.top_players
        html = URI.open(URL)
        doc = Nokogiri::HTML(html)
    end

    def get_players
        doc.search("#main-content > article > div:nth-child(2) > div > div:nth-child(3) > div.nfl-o-ranked-item > div.nfl-o-ranked-item__content > div.nfl-o-ranked-item__title")
    end

    def get_player_rank
        doc.search("#main-content > article > div:nth-child(2) > div > div:nth-child(3) > div.nfl-o-ranked-item > div.nfl-o-ranked-item__label > div").text
    end
end