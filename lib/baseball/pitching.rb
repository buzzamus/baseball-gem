module Pitching

  class Pitcher
    attr_accessor :pitcher_hash
    def initialize(pitcher_hash)
      @pitcher = pitcher_hash
    end

    def era
      earned_runs = @pitcher[:er] * 9
      avg = earned_runs / @pitcher[:ip].to_f
      earned_run_average = avg.round(2)
    end

    def whip
      walks_plus_hits = @pitcher[:walks] + @pitcher[:hits]
      whip = walks_plus_hits / @pitcher[:ip].to_f
      whip = whip.round(3)
    end
  end


end
