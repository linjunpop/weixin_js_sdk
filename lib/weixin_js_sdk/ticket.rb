module WeixinJsSDK
  class Ticket
    URI_TEMPLATE = 'https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%{access_token}&type=jsapi'.freeze

    attr_reader :token, :expires_in

    def initialize(access_token)
      url = URI_TEMPLATE % {
        access_token: access_token
      }

      json = Util.get_json(url)

      @token = json['ticket']
      @expires_in = json['expires_in']
    end

    # <b>DEPRECATED:</b> Please use <tt>token</tt> instead.
    def fetch
      warn "[DEPRECATION] `fetch` is deprecated.  Please use `token` instead."
      token
    end

    alias_method :ticket, :token
  end
end
