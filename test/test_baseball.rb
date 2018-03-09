require 'test/unit'
require 'baseball'

class TestBaseball < Test::Unit::TestCase

  def test_version_number
    assert_equal Baseball.version_number, Baseball::VERSION
  end

end
