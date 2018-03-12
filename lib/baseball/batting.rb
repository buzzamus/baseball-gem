module Batting

# add all required statistics as separate arguments required, will then be individual attributes to parse
# from object

#need to remove attr_accessors, no need to initialize. Each method will have their own individual
#arguments when called

  class Batter
    attr_accessor :player_hash
    def initialize(player_hash)
      @player = player_hash
    end

    def batting_average
      avg = @player[:hits].to_f / @player[:at_bats].to_f
      player_average = avg.round(3)
      batting_average_string = player_average.to_s.sub!("0", "")
      if batting_average_string.length === 3
        batting_average_string = "#{batting_average_string}0"
      elsif batting_average_string.length === 2
        batting_average_string = "#{batting_average_string}00"
      else
        return batting_average_string
      end
    end

    def obp
      #on base percentage here
    end

    def slugging_percentage
      #slugging percentage here
    end

    def ops
      #on base plus slugging here
    end

  end

end
