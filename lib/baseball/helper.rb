module Helper

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
