require 'json'
require 'faraday'

module WeixinJsSDK
  class Util
    def self.get_json(url)
      conn = Faraday.new do |faraday|
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
      response = conn.get url
      JSON.parse(response.body)
    end
  end
end
