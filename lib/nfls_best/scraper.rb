class Scraper 
    URL = "https://www.nfl.com/news/2020-nfl-season-saints-falcons-headline-10-most-talented-teams"
    def self.top_teams
        html = URI.open(URL)
        doc = Nokogiri::HTML(html)
        binding.pry
teams = doc.css("#main-content > article > div:nth-child(2) > div > div > div.nfl-o-ranked-item > div.nfl-o-ranked-item__content > div.nfl-o-ranked-item__title")
teams.each do |team|
end
    end
end