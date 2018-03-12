require 'baseball/version'
require 'baseball/batting'
require 'baseball/pitching'
require 'baseball/fielding'
require 'baseball/running'

module Baseball

  #table of contents
    #batter stats
    #pitcher stats 

  def self.version_number
    Baseball::VERSION
  end
  #batting stats
  def self.batting_average(player_hash)
    include Batting
    player = Batter.new(player_hash)
    player.batting_average
  end
  #pitcher stats
  def self.era(pitcher_hash)
    include Pitching
    pitcher = Pitcher.new(pitcher_hash)
    pitcher.era
  end

  def self.whip(pitcher_hash)
    include Pitching
    pitcher = Pitcher.new(pitcher_hash)
    pitcher.whip
  end

end
