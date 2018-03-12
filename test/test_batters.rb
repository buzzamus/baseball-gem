require 'test/unit'
require 'baseball'

class TestBatters < Test::Unit::TestCase

  def test_batting_average
    puts Baseball.batting_average(400, 100)
    puts Baseball.batting_average(500, 100)
    puts Baseball.batting_average(420, 134)
    assert_equal ".250", Baseball.batting_average(400, 100)
    assert_equal ".200", Baseball.batting_average(500, 100)
    assert_equal ".319", Baseball.batting_average(420, 134)
  end

end
