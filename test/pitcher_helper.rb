module PitcherHelper
  def setup
    # jon lester, 2015 courtesy of baseball-reference
    pitcher = {
      er: 76,
      ip: 205.0,
      walks: 47,
      hits: 183,
      so: 207
    }

    pitcher2 = {
      er: 39,
      ip: 198.1,
      walks: 31,
      hits: 139,
      so: 239
    }

    pitcher3 = {
      er: 75,
      ip: 208.0,
      walks: 83,
      hits: 167,
      so: 225
    }

    pitcher4 = {
      er: 55,
      ip: 202.2,
      walks: 52,
      hits: 154,
      so: 197
    }

    pitcher5 = {
      er: 1,
      ip: 6.0
    }

    pitcher6 = {
      er: 1,
      ip: 9.0,
      walks: 0,
      hits: 9,
      so: 9
    }
    pitcher7 = {
      ip: 202.2,
      hits: 154,
      er: 55,
      walks: 52,
      so: 197
    }
    @pitcher = Baseball.compile(pitcher)
    @pitcher2 = Baseball.compile(pitcher2)
    @pitcher3 = Baseball.compile(pitcher3)
    @pitcher4 = Baseball.compile(pitcher4)
    @pitcher5 = Baseball.compile(pitcher5)
    @pitcher6 = Baseball.compile(pitcher6)
    @pitcher7 = Baseball.compile(pitcher7)
  end
end
