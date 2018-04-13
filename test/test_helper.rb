module TestHelper
  def setup
    # full 3 digit BA test
    player_hash1 = {
      at_bats: 602,
      hits: 204,
      stolen_bases: 20,
      caught_stealing: 6
    }
    # 2 digit BA that tests 0 added
    player_hash2 = {
      at_bats: 400,
      hits: 100,
      stolen_bases: 9,
      caught_stealing: 1,
      put_outs: 33,
      assists: 49,
      errors: 4
    }
    # 1 digit BA that tests 2 0's added
    player_hash3 = {
      at_bats: 500,
      hits: 100,
      stolen_bases: 409,
      caught_stealing: 90,
      put_outs: 6,
      assists: 4,
      errors: 1
    }
    # Bryce Harper 2017 via baseball-reference
    player_hash4 = {
      at_bats: 420,
      hits: 134,
      walks: 68,
      hbp: 1,
      sac_flies: 3,
      singles: 77,
      doubles: 27,
      triples: 1,
      hr: 29
    }
    # Kris Bryant 2017 via baseball-reference
    player_hash5 = {
      at_bats: 603,
      hits: 176,
      walks: 75,
      hbp: 18,
      sac_flies: 3,
      singles: 99,
      doubles: 35,
      triples: 3,
      hr: 39
    }
    # aaron judge 2017
    player_hash6 = {
      at_bats: 542,
      hits: 154,
      walks: 127,
      hbp: 5,
      sac_flies: 4,
      singles: 75,
      doubles: 24,
      triples: 3,
      hr: 52
    }
    # Jason Heyward 2011
    player_hash7 = {
      at_bats: 396,
      hits: 90,
      walks: 51,
      hbp: 4,
      sac_flies: 3,
      singles: 56,
      doubles: 18,
      triples: 2,
      hr: 14,
      put_outs: 218,
      assists: 4,
      errors: 6
    }

    player_hash8 = {
      at_bats: 565,
      walks: 66,
      hits: 195,
      # singles: 106, commented out to test default figuring for singles
      doubles: 40,
      triples: 5,
      hr: 44
    }
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
    @player1 = Baseball.compile(player_hash1)
    @player2 = Baseball.compile(player_hash2)
    @player3 = Baseball.compile(player_hash3)
    @player4 = Baseball.compile(player_hash4)
    @player5 = Baseball.compile(player_hash5)
    @player6 = Baseball.compile(player_hash6)
    @player7 = Baseball.compile(player_hash7)
    @player8 = Baseball.compile(player_hash8)
    @pitcher = Baseball.compile(pitcher)
    @pitcher2 = Baseball.compile(pitcher2)
    @pitcher3 = Baseball.compile(pitcher3)
    @pitcher4 = Baseball.compile(pitcher4)
    @pitcher5 = Baseball.compile(pitcher5)
    @pitcher6 = Baseball.compile(pitcher6)
  end
end
