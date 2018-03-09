require 'baseball/version'
require 'baseball/batting'

module Baseball

  def self.version_number
    Baseball::VERSION
  end

  def self.batting_average(at_bats, hits)
    include Batting
    player = Batter.new(at_bats, hits)
    player.batting_average
  end

end
