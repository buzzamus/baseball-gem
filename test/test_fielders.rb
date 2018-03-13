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
  end

  test "fielding percentage should be accurate" do
    #puts Baseball.fielding_percentage(@fielder)
    assert_equal ".990", Baseball.fielding_percentage(@fielder)
  end

end
