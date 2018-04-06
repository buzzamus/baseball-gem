module Player
  require 'baseball/player_helper'
  class Player
    include PlayerHelper
    attr_accessor :at_bats, :hits, :walks, :hbp, :sac_flies, :singles, :doubles,
                  :triples, :hr, :put_outs, :assists, :errors, :er, :ip, :so,
                  :stolen_bases, :caught_stealing
    def initialize(hash)
      @at_bats = hash.fetch(:at_bats, nil)
      @hits = hash.fetch(:hits, nil)
      @walks = hash.fetch(:walks, nil)
      @hbp = hash.fetch(:hbp, nil)
      @sac_flies = hash.fetch(:sac_flies, nil)
      @singles = hash.fetch(:singles, nil)
      @doubles = hash.fetch(:doubles, nil)
      @triples = hash.fetch(:triples, nil)
      @hr = hash.fetch(:hr, nil)
      @put_outs = hash.fetch(:put_outs, nil)
      @assists = hash.fetch(:assists, nil)
      @errors = hash.fetch(:errors, nil)
      @er = hash.fetch(:er, nil)
      @ip = hash.fetch(:ip, nil)
      @walks = hash.fetch(:walks, nil)
      @hits = hash.fetch(:hits, nil)
      @so = hash.fetch(:so, nil)
      @stolen_bases = hash.fetch(:stolen_bases, nil)
      @caught_stealing = hash.fetch(:caught_stealing, nil)
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
      if player_ops_string[0] === "0"
        remove_leading_zero(player_ops_string)
      else
        player_ops_string
      end
    end

    def runs_created
      opportunities = at_bats + walks
      times_on_base = hits + walks
      total_bases = singles + (doubles * 2) + (triples * 3) + hr * 4
      total_production = total_bases * times_on_base
      runs_created_figure = total_production.to_f / opportunities.to_f
      runs_created_figure.round(2).to_s
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
      avg = earned_runs / ip.to_f
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
