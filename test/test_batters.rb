require 'test/unit'
require 'baseball'

class TestBatters < Test::Unit::TestCase

  def setup
    #full 3 digit BA
    @player_hash_1 = {
      at_bats: 602,
      hits: 204
    }
    #2 digit BA that needs 0 added
    @player_hash_2 = {
      at_bats: 400,
      hits: 100
    }
    #1 digit BA that needs 2 0's added
    @player_hash_3 = {
      at_bats: 500,
      hits: 100
    }
    #Bryce Harper 2017 via baseball-reference
    @player_hash_4 = {
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
  end

  test "player batting average should be correct" do
    #puts Baseball.batting_average(@player_hash_1)
    assert_equal ".339", Baseball.batting_average(@player_hash_1)
    assert_equal ".250", Baseball.batting_average(@player_hash_2)
    assert_equal ".200", Baseball.batting_average(@player_hash_3)
    assert_equal ".319", Baseball.batting_average(@player_hash_4)
  end

  test "obp should be figured correctly" do
    #puts Baseball.obp(@player_hash_4)
    assert_equal ".413", Baseball.obp(@player_hash_4)
  end

  test "slugging percentage should be figured correctly" do
    #puts Baseball.slg(@player_hash_4)
    assert_equal ".595", Baseball.slg(@player_hash_4)
  end

  test "OPS should be figured by obp and slg" do
    #puts Baseball.ops(@player_hash_4)
    assert_equal "1.008", Baseball.ops(@player_hash_4)
  end

end
