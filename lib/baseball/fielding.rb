require 'baseball/player'

module Fielding

  class Fielder < Player::PlayerTemplate

    def fielding_percentage
      plays = @player[:put_outs] + @player[:assists]
      plays_plus_errors = plays + @player[:errors]
      player_avg = plays.to_f / plays_plus_errors.to_f
      avg = player_avg.round(3)
      fielding_percentage = avg.to_s.sub!("0", "")
      figure_trailing_zeroes(fielding_percentage)
    end
  end

end
