require 'test/unit'
require 'baseball'

class TestPitchers < Test::Unit::TestCase

  def setup
    #jon lester, 2015 courtesy of baseball-reference
    @pitcher = {
      er: 76,
      ip: 205.0,
      walks: 47,
      hits: 183,
      so: 207
    }

    @pitcher2 = {
      er: 39,
      ip: 198.1,
      walks: 31,
      hits: 139,
      so: 239
    }

    @pitcher3 = {
      er: 75,
      ip: 208.0,
      walks: 83,
      hits: 167,
      so: 225
    }

    @pitcher4 = {
      er: 55,
      ip: 202.2,
      walks: 52,
      hits: 154,
      so: 197
    }

  end

  test "pitchers ERA should be correct and account for third of innings properly" do
    assert_equal "3.34", Baseball.era(@pitcher)
    assert_equal "1.77", Baseball.era(@pitcher2)
    assert_equal "3.25", Baseball.era(@pitcher3)
  end

  test "pitchers WHIP should be correct and account for third of innings properly" do
    assert_equal "1.122", Baseball.whip(@pitcher)
    assert_equal "0.857", Baseball.whip(@pitcher2)
    assert_equal "1.202", Baseball.whip(@pitcher3)
    assert_equal "1.016", Baseball.whip(@pitcher4)
  end

  test "pitchers k/9 should be valid" do
    assert_equal "9.1", Baseball.k_per_nine(@pitcher)
    assert_equal "10.9", Baseball.k_per_nine(@pitcher2)
    assert_equal "9.7", Baseball.k_per_nine(@pitcher3)
    assert_equal "8.8", Baseball.k_per_nine(@pitcher4)
  end

end
