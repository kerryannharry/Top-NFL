class NflsBest::Team
attr_accessor :name, :rank, :description

@@all = []
    def self.all
        @@all
    end

    def initialize(name, rank = "not top 10", description = nil)
        self.name = name
        self.rank = rank
        self.description = description
        @@all << self 
    end

    def self.display_teams
        rank_teams = all.select {|team| team.rank != "not top 10"}
        rank_teams.sort_by {|t| t.rank.to_i}.each do |team| 
            puts "#{team.rank}. #{team.name}"
        end
    end
    def self.find_by_name(name)
        self.all.find {|team| team.name.downcase == name.downcase}
    end
    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.new(name)
    end
    
    end