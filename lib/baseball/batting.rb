require 'baseball/player'

module Batting

  class Batter < Player::PlayerTemplate

    def batting_average
      avg = @player[:hits].to_f / @player[:at_bats].to_f
      player_average = avg.round(3)
      figure_lead_and_trailing_zeroes(player_average)
    end

    def obp
      times_on_base = @player[:hits].to_f + @player[:walks].to_f + @player[:hbp].to_f
      times_at_plate = @player[:at_bats].to_f + @player[:walks].to_f + @player[:hbp].to_f + @player[:sac_flies]
      obp = times_on_base.to_f / times_at_plate.to_f
      player_obp = obp.round(3)
      figure_lead_and_trailing_zeroes(player_obp)
    end

    def slugging_percentage
      total_bases = @player[:singles] + (@player[:doubles] * 2) + (@player[:triples] * 3) + @player[:hr] * 4
      slg = total_bases.to_f / @player[:at_bats].to_f
      slg = slg.round(3)
      figure_lead_and_trailing_zeroes(slg)
    end

    def ops
      player_ops = self.obp.to_f + self.slugging_percentage.to_f
      player_ops_string = player_ops.round(3)
      player_ops_string = player_ops_string.to_s
      if player_ops_string[0] === "0"
        remove_leading_zero(player_ops_string)
      else
        return player_ops_string
      end
    end

    def base_runs
      # a = hits + walks - hr
      # b = (1.4 * totalbases - .6 * hits - 3 * HR + .1 * BB) * 1.02
      # c = AB - Hits
      # D = HR

      # x = (A * B) / (B + C)
      # x + D
    end

  end

end
