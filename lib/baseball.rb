require 'baseball/version'
require 'baseball/batting'
require 'baseball/pitching'
require 'baseball/fielding'
require 'baseball/running'
require 'baseball/player'
require 'baseball/baseball_player'

module Baseball
  include Batting
  include Pitching
  include Fielding
  include Running

  def self.version_number
    Baseball::VERSION
  end

  def self.batting_average(player_hash)
    player = Batter.new(player_hash)
    player.batting_average
  end

  def self.obp(player_hash)
    player = Batter.new(player_hash)
    player.obp
  end

  def self.slg(player_hash)
    player = Batter.new(player_hash)
    player.slugging_percentage
  end

  def self.ops(player_hash)
    player = Batter.new(player_hash)
    player.ops
  end

  def self.runs_created(player_hash)
    player = Batter.new(player_hash)
    player.runs_created
  end

  #pitching stats

  def self.era(pitcher_hash)
    pitcher = Pitcher.new(pitcher_hash)
    pitcher.era
  end

  def self.whip(pitcher_hash)
    pitcher = Pitcher.new(pitcher_hash)
    pitcher.whip
  end

  def self.k_per_nine(pitcher_hash)
    pitcher = Pitcher.new(pitcher_hash)
    pitcher.k_per_nine
  end

  def self.bb_per_nine(pitcher_hash)
    pitcher = Pitcher.new(pitcher_hash)
    pitcher.bb_per_nine
  end

  def self.so_per_bb(pitcher_hash)
    pitcher = Pitcher.new(pitcher_hash)
    pitcher.so_per_bb
  end

  #fielding stats

  def self.fielding_percentage(fielder_hash)
    fielder = Fielder.new(fielder_hash)
    fielder.fielding_percentage
  end

  # running stats

  def self.stolen_base_percentage(runner_hash)
    runner = Runner.new(runner_hash)
    runner.stolen_base_percentage
  end

  def self.stolen_base_runs(runner_hash)
    runner = Runner.new(runner_hash)
    runner.stolen_base_runs
  end

end
