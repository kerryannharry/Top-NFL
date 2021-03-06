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

    def players
        NflsBest::Player.all.select {|player| player.team == self }
    end

    def display_roster
        roster = TTY::Table.new(header: ["Id", "Name", "Position", "Height", "Weight", "Experience", "College"])
        self.players.each.with_index(1) do |player, i| 
            roster << ["#{i}".red, "#{player.name}".blue, "#{player.position}", "#{player.height}", "#{player.weight}", "#{player.experience}", "#{player.college}"]
        end
        roster.render(:unicode)
    end

    def self.display_grid_of_teams(teams)
        teams_table = TTY::Table.new(header: ["Rank", "Team Name"])
        teams.each.with_index(1) do |team, rank| 
            teams_table << ["#{team.rank}".red, "#{team.name}"]
        end
        teams_table.render(:unicode)
    end

    def self.select_ranked_teams
        all.select {|team| team.rank != "not top 10" }
    end

    def self.find_by_name(name)
        self.all.find {|team| team.name.downcase == name.downcase}
    end
    
    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.new(name)
    end
    
    end