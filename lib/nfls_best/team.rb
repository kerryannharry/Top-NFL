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
            roster << ["#{i}".red, "#{player.name}", "#{player.position}", "#{player.height}", "#{player.weight}", "#{player.experience}", "#{player.college}"]
        end
        puts roster.render(:unicode)
    end
    def self.display_teams
        rank_teams = all.select {|team| team.rank != "not top 10"}
        rank_teams.sort_by {|t| t.rank.to_i}.each do |team| 
            puts "#{team.rank}. #{team.name}"
        end
    end

    def self.display_grid_of_teams(team)
        teams_table = TTY::Table.new(header: ["Rank", "Team Name"])
        team.each.with_index(1) do |team, rank| 
            teams_table << ["#{team.rank}".red, "#{team.name}"]
        end
        puts teams_table.render(:unicode)
    end

    def self.find_by_name(name)
        self.all.find {|team| team.name.downcase == name.downcase}
    end
    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.new(name)
    end
    
    end