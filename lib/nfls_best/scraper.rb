class Scraper 
    URL = "https://www.nfl.com/news/2020-nfl-season-saints-falcons-headline-10-most-talented-teams"
    def self.top_teams
        html = URI.open(URL)
        doc = Nokogiri::HTML(html)
teams = doc.css("#main-content > article > div:nth-child(2) > div > div > div.nfl-o-ranked-item > div.nfl-o-ranked-item__content > div.nfl-o-ranked-item__title").text
ranks = doc.search("div.nfl-o-ranked-item__label--second").text
        team
# teams.each do |team|
# end
    end
end