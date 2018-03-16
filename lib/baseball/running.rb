require 'baseball/player'

module Running

  class Runner < Player::PlayerTemplate

    def stolen_base_percentage
      player_stolen_base_percentage = @player[:stolen_bases].to_f / (@player[:stolen_bases ].to_f + @player[:caught_stealing].to_f)
      stealing_average = player_stolen_base_percentage.round(3)
      average_string = stealing_average.to_s.sub!("0", "")
      figure_trailing_zeroes(average_string)
    end

    def stolen_base_runs
      stolen_base_adjustment = @player[:stolen_bases].to_f * 0.3
      caught_stealing_adjustment = @player[:caught_stealing].to_f * 0.6
      adjusted_stolen_base_runs = stolen_base_adjustment - caught_stealing_adjustment
      base_runs = adjusted_stolen_base_runs.round(3)
      return base_runs.to_s
      #Created by Total baseball
      # (.3 x stolen bases) - (.6 x caught stealing)
    end
  end

end
