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

    @pitcher2 = {
      er: 39,
      ip: 198.1,
      walks: 31,
      hits: 139
    }
  end

  test "pitchers ERA should be correct and account for third of innings properly" do
    #puts Baseball.era(@pitcher)
    assert_equal "3.34", Baseball.era(@pitcher)
    assert_equal "1.77", Baseball.era(@pitcher2)
  end

  test "pitchers WHIP should be correct and account for third of innings properly" do
    #puts Baseball.whip(@pitcher)
    #puts Baseball.whip(@pitcher2)
    assert_equal "1.122", Baseball.whip(@pitcher)
  end

  test "pitchers k/9 should be valid" do
    #k/9 test logic here
  end

end
