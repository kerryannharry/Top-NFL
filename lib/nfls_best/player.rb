class NflsBest::Player
    attr_accessor :name, :rank, :team, :bio

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, rank, team, bio = nil)
        self.name = name
        self.rank = rank
        self.team = team
        self.bio = bio
        self.class.all << self 
    end

    def self.display_players
        all.sort_by {|p| p.rank.to_i}.each do |player| 
            puts "#{player.rank}. #{player.name}"
        end
    end
end