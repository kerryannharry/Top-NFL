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

    def display_player_info
        table = TTY::Table.new(header: [ "Name", "Position", "Height", "Weight", "Experience", "College", "Team"])
            table << ["#{self.name}".blue, "#{self.position}", "#{self.height}", "#{self.weight}", "#{self.experience}", "#{self.college}", "#{self.team.name}".red]
         table.render(:unicode)
    end

    def self.display_top_players
        top_players = self.select_ranked_players
        player_table = TTY::Table.new(header: ["Id", "Name"])
        top_players.each.with_index(1) do |player, i| 
            player_table << ["#{i}".red, "#{player.name}"]
        end
         player_table.render(:unicode)
    end

    def self.select_ranked_players
        self.all.select{|player| player.rank != nil}

    end

    def self.display_players(team)
        team_players = self.all.select{|player| player.team == team}
        player_table = TTY::Table.new(header: ["Id", "Name"])
        team_players.each.with_index(1) do |player, i| 
            player_table << ["#{i}".red, "#{player.name}"]
        end
        player_table.render(:unicode)
    end

    def self.find_by_name(name)
        self.all.find {|player| player.name.downcase == name.downcase}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.new(name)
    end
end