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
    #add'l tests
    @player_hash_4 = {
      at_bats: 420,
      hits: 134
    }
  end

  test "player batting average should be correct" do
    #puts Baseball.batting_average(@player_hash_1)
    assert_equal ".339", Baseball.batting_average(@player_hash_1)
    assert_equal ".250", Baseball.batting_average(@player_hash_2)
    assert_equal ".200", Baseball.batting_average(@player_hash_3)
    assert_equal ".319", Baseball.batting_average(@player_hash_4)
  end

end
