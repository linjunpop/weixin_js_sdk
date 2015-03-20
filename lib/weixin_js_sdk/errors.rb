module WeixinJsSDK
  class Errors
    Standard = Class.new(StandardError)

    class InvalidRequest < Standard
      DOC_URI = 'http://mp.weixin.qq.com/wiki/17/fa4e1434e57290788bde25603fa2fcbd.html'.freeze

      def initialize(error_code: '', message: '')
        @error_code = error_code
        @message = message
      end

      def message
        <<-EOS

        Code: #{@error_code}
        Message: #{@message}

        Please read the doc: #{DOC_URI}
        EOS
      end
    end

    class ServerHTTPError < Standard; end
  end
end
