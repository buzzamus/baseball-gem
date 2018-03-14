# Baseball

This Ruby gem contains a pre-created library for factoring baseball statistics.

* Gem is still in development with ore stats to be added.

* Note: This project is in no way taking credit for creating any of the included baseball stats.
This is a library created strictly to be used in easily figuring the included statistics based on the data received by the user.

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/buzzamus/baseball.

Ruby programmers that are also very familiar with baseball statistics especially welcome.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
