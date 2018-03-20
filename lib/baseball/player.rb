module Player

  class PlayerTemplate
    attr_accessor :player
    def initialize(player)
      @player = player
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

    def third_inning_handler(innings)
      innings_string = innings.to_s
      final_fig = innings_string[0..(innings_string.length - 2)]
      final_num = innings_string[(innings_string.length - 2)..innings_string.length].to_f

      if final_num == 0.1
  	    returnable_innings = final_fig.to_f
        returnable_innings += 0.33
        returnable_innings.to_s
      elsif final_num == 0.2
        returnable_innings = final_fig.to_f
        returnable_innings += 0.66
        returnable_innings.to_s
      else
        return innings
      end
    end

  end

end
