class Scraper 
    URL = "https://www.nfl.com/news/2020-nfl-season-saints-falcons-headline-10-most-talented-teams"
    def self.top_teams
        html = URI.open(URL)
        doc = Nokogiri::HTML(html)
teams = doc.css("#main-content > article > div:nth-child(2) > div > div > div.nfl-o-ranked-item > div.nfl-o-ranked-item__content > div.nfl-o-ranked-item__title").text
ranks = doc.search("div.nfl-o-ranked-item__label--second").text
        teams
# teams.each do |team|
# end
    end

URL = "https://www.espn.com/nfl/story/_/id/29766900/nfl-rank-predicting-best-100-players-2020-nfl-season"
    def self.top_players
        html = URI.open(URL)
        doc = Nokogiri::HTML(html)
players = doc.css("#article-feed > article:nth-child(1) > div > div.article-body > h2:nth-child(13)").text #may be just number 1 player and rank
# ranks = doc.search("div.nfl-o-ranked-item__label--second").text
        player
    end
end