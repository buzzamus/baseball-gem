require 'test/unit'
require 'baseball'
require 'player_helper'
class TestPlayers < Test::Unit::TestCase
  include PlayerHelper

  test "a new player should match Player class" do
    assert_equal @player1.class, Player::Player
  end

  test "a player should return given stats" do
    assert_equal 420, @player4.at_bats
    assert_equal 68, @player4.walks
  end

  test "player should have singles figured automatically if not included" do
    stats = {
      at_bats: 500,
      hits: 200,
      doubles: 40,
      triples: 3,
      hr: 37
    }
    player = Baseball.compile(stats)
    assert_equal 120, player.singles
  end

  test "player batting average should be correct" do
    assert_equal ".339", @player1.batting_average
    assert_equal ".319", @player4.batting_average
    assert_equal ".292", @player5.batting_average
    assert_equal ".284", @player6.batting_average
  end

  test "player batting average should handle trailing zeroes" do
    assert_equal ".250", @player2.batting_average
    assert_equal ".200", @player3.batting_average
  end

  test "obp should be figured correctly" do
    assert_equal ".413", @player4.obp
    assert_equal ".385", @player5.obp
    assert_equal ".422", @player6.obp
  end

  test "obp should figure trailing zeroes correctly" do
    stats = {
      hits: 100,
      at_bats: 500
    }
    assert_equal ".200", Baseball.compile(stats).obp
  end

  test "slugging percentage should be figured correctly" do
    assert_equal ".595", @player4.slg
    assert_equal ".554", @player5.slg
    assert_equal ".627", @player6.slg
  end

  test "slugging percentage should figure trailing zeroes correctly" do
    stats = {
      at_bats: 602,
      hits: 147,
      doubles: 22,
      triples: 0,
      hr: 40,
      singles: 85,
      walks: 50,
      hbp: 6,
      sac_flies: 3
    }
    assert_equal ".480", Baseball.compile(stats).slg
  end

  test "OPS should be figured by obp and slg" do
    assert_equal "1.008", @player4.ops
    assert_equal ".939", @player5.ops
    assert_equal "1.049", @player6.ops
    assert_equal ".708", @player7.ops
  end

  test "OPS should figure trailing zeroes correctly" do
    stats = {
      at_bats: 500,
      hits: 100,
      walks: 45,
      hbp: 3,
      sac_flies: 1,
      singles: 100,
      doubles: 0,
      triples: 0,
      hr: 0
    }
    low_ops = Baseball.compile(stats).ops
    assert_equal ".470", low_ops
  end

  test "OPS of whole number should still give 3 decimal zeroes" do
    stats = {
      walks: 90,
      hits: 192,
      singles: 100,
      doubles: 44,
      triples: 4,
      hr: 43,
      at_bats: 621,
      hbp: 4,
      sac_flies: 2
    }
    whole_ops = Baseball.compile(stats).ops
    assert_equal "1.000", whole_ops
  end

  test "runs compiled should be figured correctly" do
    assert_equal "48.58", @player7.runs_created
    assert_equal "155.94", @player8.runs_created
  end

  test "isolated power should be figured correctly" do
    # perfect ios of 3.000
    stats = {
      hits: 50,
      at_bats: 50,
      hr: 50,
      singles: 0,
      doubles: 0,
      triples: 0
    }
    assert_equal ".276", @player4.iso
    assert_equal "3.000", Baseball.compile(stats).iso
    assert_equal ".262", @player5.iso
  end

  test "fielding percentage should be accurate" do
    assert_equal ".953", @player2.fielding_percentage
    assert_equal ".909", @player3.fielding_percentage
    assert_equal ".974", @player7.fielding_percentage
  end

  test "base running percentage should be accurate" do
    assert_equal ".769", @player1.stolen_base_percentage
    assert_equal ".820", @player3.stolen_base_percentage
  end

  test "base running percentage should figure trailing zeroes" do
    assert_equal ".900", @player2.stolen_base_percentage
  end

  test "stolen base runs should be accurate" do
    assert_equal "2.4", @player1.stolen_base_runs
    assert_equal "2.1", @player2.stolen_base_runs
  end
end
