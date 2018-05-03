module Player
  require 'baseball/player_helper'
  class Player
    include PlayerHelper
    STATS = %i[
      at_bats hits walks hbp sac_flies singles
      doubles triples hr put_outs assists errors
      er ip so stolen_bases caught_stealing
    ]

    attr_accessor(*STATS)

    def initialize(hash)
      STATS.each do |iv|
        if iv != :singles
          instance_variable_set("@#{iv}", hash.fetch(iv, 0))
        end
      end
      # figures and sets default value of singles if not included by user
      @singles ||= @hits - (@doubles + @triples + @hr)
    end

    def batting_average
      avg = (hits.to_f / at_bats.to_f).round(3)
      figure_lead_and_trailing_zeroes(avg)
    end

    def obp
      times_on_base = hits.to_f + walks.to_f + hbp.to_f
      times_at_plate = at_bats.to_f + walks.to_f + hbp.to_f + sac_flies.to_f
      on_base_percentage = times_on_base.to_f / times_at_plate.to_f
      player_obp = on_base_percentage.round(3)
      figure_lead_and_trailing_zeroes(player_obp)
    end

    def slg
      total_bases = singles + (doubles * 2) + (triples * 3) + hr * 4
      slg_pct = total_bases.to_f / at_bats.to_f
      slg_pct = slg_pct.round(3)
      figure_lead_and_trailing_zeroes(slg_pct)
    end

    def ops
      player_ops = obp.to_f + slg.to_f
      player_ops_string = player_ops.round(3)
      player_ops_string = player_ops_string.to_s
      if player_ops_string[0] == "0"
        figure_lead_and_trailing_zeroes(player_ops_string)
      else
        figure_multiple_trailing_zeroes(player_ops_string)
      end
    end

    def runs_created
      total_production = (singles + (doubles * 2) + (triples * 3) + hr * 4) * (hits + walks)
      runs_created_figure = total_production.to_f / (at_bats + walks).to_f
      runs_created_figure.round(2).to_s
    end

    def iso
      isolated_power = slg.to_f - batting_average.to_f
      isolated_power = figure_lead_and_trailing_zeroes(isolated_power.round(3))
      # check whole number is not 0, if so, figure extra zeroes
      if isolated_power[0] > "0"
        figure_multiple_trailing_zeroes(isolated_power)
      else
        isolated_power
      end
    end

    def fielding_percentage
      plays = put_outs + assists
      plays_plus_errors = plays + errors
      player_avg = plays.to_f / plays_plus_errors.to_f
      avg = player_avg.round(3)
      figure_lead_and_trailing_zeroes(avg)
    end

    def stolen_base_percentage
      player_stolen_base_percentage = stolen_bases.to_f / (stolen_bases.to_f + caught_stealing.to_f)
      stealing_average = player_stolen_base_percentage.round(3)
      figure_lead_and_trailing_zeroes(stealing_average)
    end

    def stolen_base_runs
      stolen_base_adjustment = stolen_bases.to_f * 0.3
      caught_stealing_adjustment = caught_stealing.to_f * 0.6
      adjusted_stolen_base_runs = stolen_base_adjustment - caught_stealing_adjustment
      adjusted_stolen_base_runs.round(3).to_s
    end

    def era
      earned_runs = er * 9
      innings = third_of_an_inning_handler(ip)
      avg = earned_runs / innings.to_f
      avg.round(2)
      figure_trailing_zero(avg)
    end

    def whip
      corrected_innings = third_of_an_inning_handler(ip).to_f
      walks_plus_hits = walks + hits
      figured_whip = walks_plus_hits / corrected_innings
      figured_whip.round(3).to_s
      figure_multiple_trailing_zeroes(figured_whip)
    end

    def k_per_nine
      full_games = ip / 9
      so9 = so / full_games.to_f
      so9.round(1).to_s
    end

    def bb_per_nine
      full_games = ip / 9
      walks_per_nine = walks / full_games.to_f
      walks_per_nine.round(1).to_s
    end

    def so_per_bb
      ratio = so.to_f / walks.to_f
      ratio.round(2)
      figure_trailing_zero(ratio)
    end
  end
end
