require 'test/unit'
require 'baseball'

class TestBaseballPlayers < Test::Unit::TestCase
  test "a player can be instantiated with a statistic" do
    player = BaseballPlayer.new(at_bats: 500)

    assert_equal(500, player.at_bats)
  end

  test "a player can be instantiated with many statistics" do
    stats = {
      name: "Bryce Harper",
      at_bats: 420,
      hits: 134,
      walks: 68,
      hbp: 1,
      sac_flies: 3,
      singles: 77,
      doubles: 27,
      triples: 1,
      hr: 29
    }

    bryce = BaseballPlayer.new(stats)

    assert_equal("Bryce Harper", bryce.name)
    assert_equal(420, bryce.at_bats)
    assert_equal(134, bryce.hits)
  end
end
