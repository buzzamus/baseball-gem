require 'test/unit'
require 'baseball'

class TestRunners < Test::Unit::TestCase

  def setup
    @player = {
      stolen_bases: 20,
      caught_stealing: 6
      #2.4
    }

    @player2 = {
      stolen_bases: 9,
      caught_stealing: 1
      #2.1
    }
  end

  test "base running percentage should be accurate" do
    #puts Baseball.stolen_base_percentage(@player)
    #puts Baseball.stolen_base_percentage(@player2)
    assert_equal ".769", Baseball.stolen_base_percentage(@player)
    assert_equal ".900", Baseball.stolen_base_percentage(@player2)
  end

  test "stolen base runs should be accurate" do
    assert_equal "2.4", Baseball.stolen_base_runs(@player)
    #puts Baseball.stolen_base_runs(@player2)
    assert_equal "2.1", Baseball.stolen_base_runs(@player2)
  end

end
