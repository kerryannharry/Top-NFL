class NflsBest::Team
attr_accessor :name, :rank

@@all = []
    def self.all
        @@all
    end

    def initialize(name, rank)
        self.name = name
        self.rank = rank
        @@all << self 
    end

    def self.display_teams
    # should return all teams
     puts <<-DOC.gsub /^\s*/,''
            1. New Orleans Saints
            2. Atlanta Falcons
            3. Baltimore Ravens
        DOC
        all.each.with_index(1) do |team,i| 
            puts "#{i}. #{team.name}"
        end
        # team_1 = self.new
        # team_1.name = "New Orleans Saints"
        # team_1.rank = "1"

        # team_2 = self.new
        # team_2.name = "Atlanta Falcons"
        # team_2.rank = "2"

        # team_3 = self.new
        # team_3.name = "Baltimore Ravens"
        # team_3.rank = "3"

        # [team_1, team_2, team_3]
    end
    
    end