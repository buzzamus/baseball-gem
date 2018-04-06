require 'test/unit'
require 'baseball'

class TestPlayers < Test::Unit::TestCase
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
      singles: 106,
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
    @player1 = Baseball.create(player_hash1)
    @player2 = Baseball.create(player_hash2)
    @player3 = Baseball.create(player_hash3)
    @player4 = Baseball.create(player_hash4)
    @player5 = Baseball.create(player_hash5)
    @player6 = Baseball.create(player_hash6)
    @player7 = Baseball.create(player_hash7)
    @player8 = Baseball.create(player_hash8)
    @pitcher = Baseball.create(pitcher)
    @pitcher2 = Baseball.create(pitcher2)
    @pitcher3 = Baseball.create(pitcher3)
    @pitcher4 = Baseball.create(pitcher4)
    @pitcher5 = Baseball.create(pitcher5)
    @pitcher6 = Baseball.create(pitcher6)
  end

  test "a player can be instantiated with a statistic" do
    assert_equal @player1.class, Player::Player
  end

  test "player batting average should be correct" do
    assert_equal ".339", @player1.batting_average
    assert_equal ".250", @player2.batting_average
    assert_equal ".200", @player3.batting_average
    assert_equal ".319", @player4.batting_average
    assert_equal ".292", @player5.batting_average
    assert_equal ".284", @player6.batting_average
  end

  test "obp should be figured correctly" do
    assert_equal ".413", @player4.obp
    assert_equal ".385", @player5.obp
    assert_equal ".422", @player6.obp
  end

  test "slugging percentage should be figured correctly" do
    assert_equal ".595", @player4.slg
    assert_equal ".554", @player5.slg
    assert_equal ".627", @player6.slg
  end

  test "OPS should be figured by obp and slg" do
    assert_equal "1.008", @player4.ops
    assert_equal ".939", @player5.ops
    assert_equal "1.049", @player6.ops
    assert_equal ".708", @player7.ops
  end

  test "runs created should be figured correctly" do
    assert_equal "48.58", @player7.runs_created
    assert_equal "155.94", @player8.runs_created
  end

  test "fielding percentage should be accurate" do
    assert_equal ".953", @player2.fielding_percentage
    assert_equal ".909", @player3.fielding_percentage
    assert_equal ".974", @player7.fielding_percentage
  end

  test "base running percentage should be accurate" do
    assert_equal ".769", @player1.stolen_base_percentage
    assert_equal ".900", @player2.stolen_base_percentage
    assert_equal ".820", @player3.stolen_base_percentage
  end

  test "stolen base runs should be accurate" do
    assert_equal "2.4", @player1.stolen_base_runs
    assert_equal "2.1", @player2.stolen_base_runs
  end

  test "pitchers ERA should be correct and account for third of innings properly" do
    assert_equal "3.34", @pitcher.era
    assert_equal "1.77", @pitcher2.era
    assert_equal "3.25", @pitcher3.era
    assert_equal "1.50", @pitcher5.era
    assert_equal "1.00", @pitcher6.era
  end

  test "pitchers WHIP should be correct and account for third of innings properly" do
    assert_equal "1.122", @pitcher.whip
    assert_equal "0.857", @pitcher2.whip
    assert_equal "1.202", @pitcher3.whip
    assert_equal "1.016", @pitcher4.whip
    assert_equal "1.000", @pitcher6.whip
  end

  test "pitchers k/9 should be valid" do
    assert_equal "9.1", @pitcher.k_per_nine
    assert_equal "10.9", @pitcher2.k_per_nine
    assert_equal "9.7", @pitcher3.k_per_nine
    assert_equal "8.8", @pitcher4.k_per_nine
    assert_equal "9.0", @pitcher6.k_per_nine
  end

  test "pitchers bb/9 should be valid" do
    assert_equal "2.1", @pitcher.bb_per_nine
    assert_equal "1.4", @pitcher2.bb_per_nine
  end

  test "pitchers bb/k should be valid" do
    assert_equal "4.40", @pitcher.so_per_bb
    assert_equal "7.71", @pitcher2.so_per_bb
  end
end
