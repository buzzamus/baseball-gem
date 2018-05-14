# Baseball  [![Gem Version](https://badge.fury.io/rb/baseball.svg)](https://badge.fury.io/rb/baseball)

This Ruby gem contains a pre-created library for factoring baseball statistics.

* Gem is still in development with more stats to be added.

* Note: This project is in no way taking credit for creating any of the included baseball stats.
This is a library created strictly to be used for easily figuring the included statistics based on the data received by the user.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'baseball'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install baseball

## Usage

### Version 1 (1.3.0 and lower)

All methods in `Baseball` take a hash as an argument. The hash should contain all the
key-value pairs needed for the specific method called.

Example hash:

```ruby
your_player_hash = {
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
```

Example uses:

##### Figuring Batting Average

```ruby
Baseball.batting_average(your_player_hash)
# will return value of ".319"
```

#### Figure On Base Percentage
```ruby
Baseball.obp(your_player_hash)
# will return value of ".413"
```

#### Figure Slugging Percentage
```ruby
Baseball.slg(your_player_hash)
# will return a value of ".595"
```

#### Figure On Base Plus Slugging
```ruby
Baseball.ops(your_player_hash)
# will return a value of "1.008"
```

All values are returned as a string

Libary includes pitching, fielding, running, and batting stats. See tests for full hash key-values needed.
(More detailed documentation will be added shortly)

### version 2

include a hash with all the key-value pairs desired for each individual statistic into `Baseball.compile()`

The result is an object with all statistics based off of the hash passed as the argument. You can then call each method in the object.

example:

```ruby
your_player_hash = {
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

player = Baseball.compile(your_player_hash)

player.batting_average # => ".319"
player.obp # => ".413"
player.ops # => "1.008"

```

notes:

* each specific stats' required values must be passed, or you will not receive the correct result. For instance, if you try to get batting statistics, but only entered pitching values into your hash you will not receive correct results.

* since pitchers and batters share some stats (hits, walks) you will want to create two separate object records
(one for batting, one for pitching) for pitchers that bat.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/buzzamus/baseball.

Ruby programmers that are also very familiar with baseball statistics especially welcome.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
