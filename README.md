# Baseball

This Ruby gem contains a pre-created library for factoring baseball statistics.

* Gem is still in development and not yet available via rubygems.org

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

Example uses:

##### Figuring Batting Average

```ruby
Baseball.batting_average(400, 100)
# will return value of .25
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/buzzamus/baseball.

Ruby programmers that are also very familiar with baseball statistics especially welcome.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
