require 'baseball/player'

module Pitching
  class Pitcher < Player::PlayerTemplate


    def era
      earned_runs = @player[:er] * 9
      avg = earned_runs / @player[:ip].to_f
      earned_run_average = avg.round(2)
    end

    def whip
      walks_plus_hits = @player[:walks] + @player[:hits]
      whip = walks_plus_hits / @player[:ip].to_f
      whip = whip.round(3)
    end
  end


end
