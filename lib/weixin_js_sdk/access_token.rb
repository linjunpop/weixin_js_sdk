module WeixinJsSDK
  class AccessToken
    URI_TEMPLATE = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%{app_id}&secret=%{app_secret}'.freeze

    attr_reader :token, :expires_in

    def initialize(app_id, app_secret)
      url = URI_TEMPLATE % {
        app_id: app_id,
        app_secret: app_secret
      }

      json = Util.get_json(url)

      @token = json['access_token']
      @expires_in = json['expires_in']
    end

    # <b>DEPRECATED:</b> Please use <tt>token</tt> instead.
    def fetch
      warn "[DEPRECATION] `fetch` is deprecated.  Please use `token` instead."
      token
    end

    alias_method :access_token, :token
  end
end
