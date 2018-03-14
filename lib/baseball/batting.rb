require 'baseball/helper'

module Batting

  class Batter
    include Helper
    attr_accessor :player_hash
    def initialize(player_hash)
      @player = player_hash
    end

    def batting_average
      avg = @player[:hits].to_f / @player[:at_bats].to_f
      player_average = avg.round(3)
      batting_average_string = player_average.to_s.sub!("0", "")
      figure_trailing_zeroes(batting_average_string)
    end

    def obp
      times_on_base = @player[:hits].to_f + @player[:walks].to_f + @player[:hbp].to_f
      times_at_plate = @player[:at_bats].to_f + @player[:walks].to_f + @player[:hbp].to_f + @player[:sac_flies]
      obp = times_on_base.to_f / times_at_plate.to_f
      player_obp = obp.round(3)
      player_obp_string = player_obp.to_s.sub!("0", "")
      figure_trailing_zeroes(player_obp_string)
    end

    def slugging_percentage
      player_doubles = @player[:doubles] * 2
      player_triples = @player[:triples] * 3
      player_hr = @player[:hr] * 4
      total_bases = @player[:singles] + player_doubles + player_triples + player_hr
      slg = total_bases.to_f / @player[:at_bats].to_f
      slg = slg.round(3)
      slg_string = slg.to_s.sub!("0", "")
      figure_trailing_zeroes(slg_string)
    end

    def ops
      player_ops = self.obp.to_f + self.slugging_percentage.to_f
      player_ops_string = player_ops.round(3)
      player_ops_string.to_s
    end

  end

end
