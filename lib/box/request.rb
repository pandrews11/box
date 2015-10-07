require 'uri'
require 'net/http'
require 'json'

module Box
  class Request

    attr_reader :method, :opts

    def self.for(method, opts)
      new(method, opts).post.body
    end

    def initialize(method, opts)
      @method = method
      @opts = opts
    end

    def post
      Net::HTTP.start(uri.host, uri.port, scheme) do |http|
        response = http.request request
      end
    end

    private

    def request
      @request ||= Net::HTTP::Post.new(uri.request_uri, headers)

      @request.body = payload
      @request
    end

    def host
      'internal-tuner.pandora.com'
    end

    def path
      '/services/json/'
    end

    def query
      "method=#{method}"
    end

    def uri
      URI::HTTPS.build :host => host, :path => path, :query => query
    end

    def scheme
      { :use_ssl => uri.scheme == 'https' }
    end

    def headers
      { 'Content-Type' => 'application/json' }
    end

    def payload
      opts.to_json
    end
  end
end
