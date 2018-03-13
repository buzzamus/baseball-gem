module Fielding

  class Fielder
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
      if fielding_percentage.length === 3
        fielding_percentage = "#{fielding_percentage}0"
      elsif fielding_percentage.length === 2
        fielding_percentage = "#{fielding_percentage}00"
      else
        return fielding_percentage.round
      end
    end

  end

end
