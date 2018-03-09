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
      #logic here to turn average into a string, drop the 0 before decimal and make 3 decimal places
      #example: 0.25 should be returned as .250
    end

  end

end
