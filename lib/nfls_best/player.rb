class NflBest::Player
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

    def self.display_players
        puts <<-DOC.gsub /^\s*/,''
        1. Patrick Mahomes
        2. Aaron Donald
        3. Lamar Jackson
        DOC
        all.each.with_index(1) do |player,i| 
            puts "#{i}. #{player.name}"
    end
end