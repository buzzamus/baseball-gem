module Running

  class Runner
    attr_accessor :runner_hash
    def initialize(runner_hash)
      @runner = runner_hash
    end

    def stolen_base_percentage
      player_stolen_base_percentage = @runner[:stolen_bases].to_f / (@runner[:stolen_bases ].to_f + @runner[:caught_stealing].to_f)
      stealing_average = player_stolen_base_percentage.round(3)
      average_string = stealing_average.to_s.sub!("0", "")
      figure_trailing_zeroes(average_string)
    end

    def stolen_base_runs
      #Created by Total baseball
      # (.3 x stolen bases) - (.6 x caught stealing)
    end


    def figure_trailing_zeroes(arg)
      revised_number = arg
      if revised_number.length === 3
        revised_number = "#{revised_number}0"
      elsif revised_number.length === 2
        revised_number = "#{revised_number}00"
      else
        return revised_number
      end
    end


  end


end
