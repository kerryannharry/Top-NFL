class NflsBest::Player
    attr_accessor :name, :rank, :team, :bio, :height, :weight, :college, :experience, :position

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, rank = nil, team = nil, bio = nil)
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

    def self.find_by_name(name)
        self.all.find {|player| player.name.downcase == name.downcase}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.new(name)
    end
end