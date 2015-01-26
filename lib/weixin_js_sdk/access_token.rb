module WeixinJsSDK
  class AccessToken
    URI_TEMPLATE = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%{app_id}&secret=%{app_secret}'.freeze

    def initialize(app_id:, app_secret:)
      @app_id = app_id
      @app_secret = app_secret
    end

    def fetch
      url = URI_TEMPLATE % {
        app_id: @app_id,
        app_secret: @app_secret
      }

      json = Util.get_json(url)

      return json['errmsg'] if json['errcode']

      access_token = json['access_token']
      expires_in = json['expires_in']

      access_token
    end
  end
end
