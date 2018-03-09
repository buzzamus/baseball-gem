module Batting

  class Batter
    attr_accessor :at_bats, :hits
    def initialize(at_bats, hits)
      @at_bats = at_bats
      @hits = hits
    end

    def batting_average
      avg = @hits.to_f / @at_bats.to_f
      player_average = avg.round(3)
    end

  end

end
