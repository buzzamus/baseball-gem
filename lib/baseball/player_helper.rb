module PlayerHelper
  # adds additional zeroes to follow baseball stats. ex: .300 vs. .3
  def figure_lead_and_trailing_zeroes(arg)
    revised_number = remove_leading_zero(arg)

    if revised_number.length == 3
      "#{revised_number}0"
    elsif revised_number.length == 2
      "#{revised_number}00"
    else
      revised_number
    end
  end

  # cuts ERA into whole number, decimal for format manipulation
  def third_of_an_inning_handler(innings)
    innings_string = innings.to_s
    whole_innings = innings_string[0..(innings_string.length - 2)]
    decimal_num = innings_string[(innings_string.length - 2)..innings_string.length].to_f
    whole_innings_string = whole_innings.to_f
    convert_third_of_inning(decimal_num, whole_innings_string, innings)
  end

  # converts .0, .1, and .2 innings entered to actual third of innings
  def convert_third_of_inning(decimal, whole_num, original)
    if decimal == 0.1
      whole_num += 0.33
      whole_num.to_s
    elsif decimal == 0.2
      whole_num += 0.66
      whole_num.to_s
    else
      original
    end
  end

  # removes whole number 0 to follow baseball stats standards. Ex: .300
  def remove_leading_zero(arg)
    arg.to_s.sub("0", "")
  end

  def figure_trailing_zero(arg)
    format "%.2f", arg
  end

  def figure_multiple_trailing_zeroes(arg)
    format "%.3f", arg
  end
end
