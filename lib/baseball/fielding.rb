require 'baseball/helper'

module Fielding

  class Fielder
    include Helper
    attr_accessor :player_hash
    def initialize(player_hash)
      @player = player_hash
    end

    def fielding_percentage
      plays = @player[:put_outs] + @player[:assists]
      plays_plus_errors = plays + @player[:errors]
      player_avg = plays.to_f / plays_plus_errors.to_f
      avg = player_avg.round(3)
      # code smell - make this a several function called somewhere since this is used over multiple stats
      fielding_percentage = avg.to_s.sub!("0", "")
      figure_trailing_zeroes(fielding_percentage)
    end
  end

end
