# Eltiempo

CLI in ruby to know the weather of the cities of Barcelona

I have not used any external code to do the CLI part, so, is not perfect, but
it's working, and I can control everything that could happen.

I'm using net/http to access to the external API.

I'm using Nokogiri to access to the XML data.
https://github.com/sparklemotion/nokogiri

## Installation

```ruby
    $ bundle exec rake install
```

## Usage

    $ eltiempo -today 'Gavá'
    $ eltiempo -av_max 'Gavá'
    $ eltiempo -av_min 'Gavá'

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/eltiempo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/eltiempo/blob/master/CODE_OF_CONDUCT.md).


## Code of Conduct

Everyone interacting in the Eltiempo project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/eltiempo/blob/master/CODE_OF_CONDUCT.md).
