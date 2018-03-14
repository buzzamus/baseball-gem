require 'baseball/version'
require 'baseball/batting'
require 'baseball/pitching'
require 'baseball/fielding'
require 'baseball/running'

module Baseball

  #table of contents
    #batter stats
    #pitcher stats
    # fielder stats

  def self.version_number
    Baseball::VERSION
  end

  #batting stats

  def self.batting_average(player_hash)
    include Batting
    player = Batter.new(player_hash)
    player.batting_average
  end

  def self.obp(player_hash)
    include Batting
    player = Batter.new(player_hash)
    player.obp
  end

  def self.slg(player_hash)
    include Batting
    player = Batter.new(player_hash)
    player.slugging_percentage
  end

  def self.ops(player_hash)
    include Batting
    player = Batter.new(player_hash)
    player.ops
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

  #fielder stats
  def self.fielding_percentage(fielder_hash)
    include Fielding
    fielder = Fielder.new(fielder_hash)
    fielder.fielding_percentage
  end

  def self.stolen_base_percentage(runner_hash)
    include Running
    runner = Runner.new(runner_hash)
    runner.stolen_base_percentage
  end
  
end
