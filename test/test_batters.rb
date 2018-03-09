require 'test/unit'
require 'baseball'

class TestBatters < Test::Unit::TestCase

  def test_batting_average
    assert_equal 0.25, Baseball.batting_average(400, 100)
  end

end
