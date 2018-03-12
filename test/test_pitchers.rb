require 'test/unit'
require 'baseball'

class TestPitchers < Test::Unit::TestCase

  def setup
    #jon lester, 2015 courtesy of baseball-reference
    @pitcher = {
      er: 76,
      ip: 205,
      walks: 47,
      hits: 183
    }
  end

  test "pitchers ERA should be correct" do
    #puts Baseball.era(@pitcher)
    assert_equal 3.34, Baseball.era(@pitcher)
  end

  test "pitchers WHIP should be correct" do
    #puts Baseball.whip(@pitcher)
    assert_equal 1.122, Baseball.whip(@pitcher)
  end

  test "pitchers ERA should account for third of innings pitched" do
    #logic for testing in situations with .1 and .2 of an inning pitched
    #need to convert into thirds
  end

end
