# WeixinJsSdk

a Weixin [JS-SDK](http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html) Toolkit.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'weixin_js_sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weixin_js_sdk

## Usage

* Fetch Access Token

```ruby
access_token = WeixinJsSDK::AccessToken.new(
  app_id: ENV['WEXIN_APP_ID',
  app_secret: ENV['WEIXIN_APP_SECRET']
).fetch
#=> xxx
```

* Fetch Ticket

```ruby
ticket = WeixinJsSDK::Ticket.new(access_token: access_token).fetch
#=> xxx
```

* Generate Signature

```ruby
signature = WeixinJsSDK::Signature.new(
  ticket: ticket,
  nonce_str: 'Wm3WZYTPz0wzccnW',
  timestamp: '1414587457',
  url: 'http://mp.weixin.qq.com'
).sign
#=> f4d90daf4b3bca3078ab155816175ba34c443a7b
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/weixin_js_sdk/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
