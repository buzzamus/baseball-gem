require 'baseball/player'

module Pitching
  class Pitcher < Player::PlayerTemplate


    def era
      earned_runs = @player[:er] * 9
      avg = earned_runs / @player[:ip].to_f
      earned_run_average = avg.round(2)
      earned_run_average.to_s
    end

    def whip
      corrected_innings = third_inning_handler(@player[:ip]).to_f
      walks_plus_hits = @player[:walks] + @player[:hits]
      figured_whip = walks_plus_hits / corrected_innings
      figured_whip = figured_whip.round(3)
      figured_whip.to_s
    end

    def k_per_nine
      full_games = @player[:ip] / 9
      so9 = @player[:so] / full_games.to_f
      so9_final = so9.round(1)
      so9_final.to_s
    end

  end

end
