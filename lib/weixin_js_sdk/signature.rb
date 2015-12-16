require 'digest/sha1'

module WeixinJsSDK
  class Signature
    TEMPLATE = 'jsapi_ticket=%{jsapi_ticket}&noncestr=%{nonce_str}&timestamp=%{timestamp}&url=%{url}'.freeze

    def initialize(ticket, nonce_str, timestamp, url)
      @ticket = ticket
      @nonce_str = nonce_str
      @timestamp = timestamp
      @url = url
    end

    def sign
      str = TEMPLATE % {
        jsapi_ticket: @ticket,
        nonce_str: @nonce_str,
        timestamp: @timestamp,
        url: @url
      }

      Digest::SHA1.hexdigest(str)
    end
  end
end
