# F(x) Oracle Adapter

An Oracle adapter for (fx)[https://github.com/teoljungberg/fx] gem

## Installation

Add this line to gemfile

```ruby
gem 'fx-oracle-adapter'
```

And then execute
```bash
bundle
```

After that, you will need to tell F(x) to use this adapter in an initializer:
```ruby
# config/initializer/fx.rb

Fx.configure do |config|
  config.adapter = Fx::Adapters::Oracle.new
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zygotecnologia/fx-oracle-adapter.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the (Contributor Covenant)[http://contributor-covenant.org/] code of conduct.

## License

The gem is available as open source under the terms of the (MIT License)[https://opensource.org/licenses/MIT].


