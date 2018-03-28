require 'test/unit'
require 'baseball'

class TestFielders < Test::Unit::TestCase

  def setup
    #Jason Heyward 2015 RF
    @fielder = {
      put_outs: 278,
      assists: 9,
      errors: 3
    }

    @fielder2 = {
      put_outs: 33,
      assists: 49,
      errors: 4
    }

    @fielder3 = {
      put_outs: 6,
      assists: 4,
      errors: 1
    }
  end

  test "fielding percentage should be accurate" do
    assert_equal ".990", Baseball.fielding_percentage(@fielder)
    assert_equal ".953", Baseball.fielding_percentage(@fielder2)
    assert_equal ".909", Baseball.fielding_percentage(@fielder3)
  end

end
