require 'json'

module WeixinJsSDK
  class Util
    def self.get_json(uri_str)
      uri = URI(uri_str)
      request = Net::HTTP::Get.new(uri)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      response = http.request(request)

      case response
      when Net::HTTPSuccess then
        json = JSON.parse(response.body)

        if json['errcode'] && (json['errcode'] != 0)
          raise Errors::InvalidRequest.new(
            error_code: json['errcode'],
            message: json['errmsg']
          ), caller
        else
          json
        end
      else
        raise Errors::ServerHTTPError, response.value, caller
      end
    end
  end
end
