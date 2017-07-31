# Rails Flytrap

Flytrap is an exception handler for Rails JSON APIs with the intention of making error handling very simple.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails-flytrap'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails-flytrap

## Usage

To use Flytrap, just include the Flytrap module in your base API controller to set it up as an exception handler.
```ruby
class ApplicationController
  include Flytrap
end
```

Once you have that set up, any class that extends `Flytrap::Exception` will be caught and spit out in JSON!

For example, if you have:
```ruby
class DummyException < Flytrap::Exception
  self.status_code = 500 # The status code to be returned alongside the JSON output
  self.message = 'Oops! Something broke!' # A developer-friendly message
  self.code = 1 # An arbitrary code for you to identify errors from your front-end!
end
```
and some error flow in a controller:

```ruby
class SomeController < ApplicationController
  def index
    raise DummyException.new if dummy?
    render json: { foo: 'bar' }
  end
end
```

Then if `dummy?` returns `true`, the output you get is:
```json
{
  "error": {
    "message": "Oops! Something broke!",
    "code": 1,
    "class_name": "DummyException"
  }
}
```
with, of course, your 500 status code!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ilanusse/rails-flytrap.
