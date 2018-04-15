require 'test/unit'
require 'baseball'
require 'test_helper'
class TestPitchers < Test::Unit::TestCase
  include TestHelper

  test "a player can be instantiated with a statistic" do
    assert_equal @pitcher.class, Player::Player
  end

  test "pitchers ERA should be correct and figure third of innings properly" do
    assert_equal "3.34", @pitcher.era
    assert_equal "1.77", @pitcher2.era
    assert_equal "3.25", @pitcher3.era
  end

  test "pitchers ERA should figure trailing zeroes" do
    assert_equal "1.50", @pitcher5.era
    assert_equal "1.00", @pitcher6.era
  end

  test "pitchers WHIP should be correct and figure third of innings properly" do
    assert_equal "1.122", @pitcher.whip
    assert_equal "1.202", @pitcher3.whip
  end

  test "pitchers WHIP should figure zero whole number correctly" do
    assert_equal "0.857", @pitcher2.whip
  end

  test "pitchers WHIP should figure trailing zeroes" do
    assert_equal "1.016", @pitcher4.whip
    assert_equal "1.000", @pitcher6.whip
  end

  test "pitchers k/9 should be valid" do
    assert_equal "9.1", @pitcher.k_per_nine
    assert_equal "10.9", @pitcher2.k_per_nine
    assert_equal "9.7", @pitcher3.k_per_nine
    assert_equal "8.8", @pitcher4.k_per_nine
  end

  test "pitchers k/9 should figure trailing zero correctly" do
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

  # tests fix for a found glitch with rounding
  test "rounding era two digits should be correct with small amount of data" do
    stats = {
      ip: 14.1,
      hits: 17,
      er: 7,
      walks: 7,
      so: 11
    }
    assert_equal "4.40", Baseball.compile(stats).era
  end
end
