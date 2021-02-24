# DescentDemosaic

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/descent_demosaic`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'descent_demosaic'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install descent_demosaic

## Usage

TODO: Write usage instructions here

### Input images

The raw images uploaded by nasa seem tho have the following filter pattern:
```
  0 1 2 3

0 R G R G

1 G B G B

2 R G R G

3 G B G B
```

Thus we can assume:
Col even, row even: This pixel contains information for red
Col even, row uneven: This pixel contains information for green
Col uneven, row even: This pixel contains information for green
Col uneven, row uneven: This pixel contains information for blue

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/descent_demosaic. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/descent_demosaic/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the DescentDemosaic project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/descent_demosaic/blob/master/CODE_OF_CONDUCT.md).
