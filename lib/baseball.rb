require 'baseball/version'
require 'baseball/player'

module Baseball
  include Player
  def self.version_number
    Baseball::VERSION
  end

  def self.create(arg)
    Player.new(arg)
  end
end
