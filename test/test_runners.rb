require 'test/unit'
require 'baseball'

class TestRunners < Test::Unit::TestCase

  def setup
    @player = {
      stolen_bases: 20,
      caught_stealing: 6
    }

    @player2 = {
      stolen_bases: 9,
      caught_stealing: 1
    }
    @player3 = {
      stolen_bases: 409,
      caught_stealing: 90
    }
  end

  test "base running percentage should be accurate" do
    assert_equal ".769", Baseball.stolen_base_percentage(@player)
    assert_equal ".900", Baseball.stolen_base_percentage(@player2)
    assert_equal ".820", Baseball.stolen_base_percentage(@player3)
  end

  test "stolen base runs should be accurate" do
    assert_equal "2.4", Baseball.stolen_base_runs(@player)
    assert_equal "2.1", Baseball.stolen_base_runs(@player2)
  end

end
