module Batting

# add all required statistics as separate arguments required, will then be individual attributes to parse
# from object
  class Batter
    attr_accessor :at_bats, :hits
    def initialize(at_bats, hits)
      @at_bats = at_bats
      @hits = hits
    end

    def batting_average
      avg = @hits.to_f / @at_bats.to_f
      player_average = avg.round(3)
      batting_average_string = player_average.to_s.sub!("0", "")
      if batting_average_string.length == 3
        batting_average_string = "#{batting_average_string}0"
      elsif batting_average_string.length == 2
        batting_average_string = "#{batting_average_string}00"
      else
        return batting_average_string
      end
      #logic here to turn average into a string, drop the 0 before decimal and make 3 decimal places
      #example: 0.25 should be returned as .250
    end

  end

end
