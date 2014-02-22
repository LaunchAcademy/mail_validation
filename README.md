# MailValidation

A simple validator for email addresses. Internally, the [mail](https://github.com/mikel/mail) gem is utilized to parse the email address.

## LoLwut? Why not use a regex?

Rails already depends on the mail gem, so why not utilize that dependency to parse email addresses properly? Framework wise, it makes sense that we would rely on the mail gem for all things email related.

## Usage

With ActiveRecord:

```ruby
class User < ActiveRecord::Base
  validates :email, "MailValidation::Email" => true
end
```

With just ActiveModel:

```ruby
class User
  include ActiveModel::Model
end
```

## Installation

Add this line to your application's Gemfile:

    gem 'mail_validation'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mail_validation

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
