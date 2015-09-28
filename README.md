# EnvBranch

[![Gem version][gem-image]][gem-url] [![Travis-CI Status][travis-image]][travis-url] [![yard docs][docs-image]][docs-url]

> Get BRANCH_NAME from environment variables.


## Usage

```ruby
require 'env_branch'

env_branch = EnvBranch.new
env_branch.branch? #=> true
env_branch.branch_name #=> 'your-branch-name'
```

### User defined block

```ruby
require 'env_branch'

env_branch =
  EnvBranch.new do
    if ENV['USER_DEFINED_BRANCH'] &&
       !ENV['USER_DEFINED_BRANCH'].empty?
      ENV['USER_DEFINED_BRANCH']
    end
  end

env_branch.branch? #=> true
env_branch.branch_name #=> 'your-branch-name'
```


## API

### EnvBranch.new -> Base

### EnvBranch.new(&block) -> Base

#### block

*optional*

Type: `block`

User defined block for getting `branch name`.


### Base#branch_name -> String | nil

Return branch name or nil.


### Base#branch? -> boolean

Return true if this has branch name.

And more *[details][docs-url]*.


## Supported services / applications

* Travis-ci
    * `ENV['TRAVIS_BRANCH']`
    * [Environment Variables - Travis CI](http://docs.travis-ci.com/user/environment-variables/#Default-Environment-Variables)
* CircleCI
    * `ENV['CIRCLE_BRANCH']`
    * [Environment variables - CircleCI](https://circleci.com/docs/environment-variables#build-details)


## Changelog

[changelog.md](./changelog.md).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'env_branch'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install env_branch


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/packsaddle/ruby-env_branch. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

© [sanemat](http://sane.jp)

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[travis-url]: https://travis-ci.org/packsaddle/ruby-env_branch
[travis-image]: https://img.shields.io/travis/packsaddle/ruby-env_branch/master.svg?style=flat-square&label=build%20%28linux%29
[gem-url]: https://rubygems.org/gems/env_branch
[gem-image]: http://img.shields.io/gem/v/env_branch.svg?style=flat-square
[docs-url]: http://www.rubydoc.info/gems/env_branch
[docs-image]: https://img.shields.io/badge/yard-docs-blue.svg?style=flat-square
