require 'baseball/player'

module Pitching
  class Pitcher < Player::PlayerTemplate


    def era
      earned_runs = @player[:er] * 9
      avg = earned_runs / @player[:ip].to_f
      avg.round(2).to_s
    end

    def whip
      corrected_innings = third_of_an_inning_handler(@player[:ip]).to_f
      walks_plus_hits = @player[:walks] + @player[:hits]
      figured_whip = walks_plus_hits / corrected_innings
      figured_whip.round(3).to_s
    end

    def k_per_nine
      full_games = @player[:ip] / 9
      so9 = @player[:so] / full_games.to_f
      so9.round(1).to_s
    end

  end

end
