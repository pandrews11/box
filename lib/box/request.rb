require 'uri'
require 'net/http'
require 'json'
require 'active_support/all'

module Box
  class Request

    attr_reader :params, :opts, :encrypt, :secure

    def self.for(params, opts, req_opts)
      new(params, opts, req_opts).post.body
    end

    def initialize(params, opts, req_opts)
      @params = params
      @opts = opts
      @encrypt = req_opts[:encrypt]
      @secure = req_opts[:secure]
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
      params.to_query
    end

    def uri
      secure? ? secure_uri : insecure_uri
    end

    def secure_uri
      URI::HTTPS.build :host => host, :path => path, :query => query
    end

    def insecure_uri
      URI::HTTP.build :host => host, :path => path, :query => query
    end

    def secure?
      !!secure
    end

    def scheme
      { :use_ssl => uri.scheme == 'https' }
    end

    def headers
      { 'Content-Type' => 'text/plain' }
    end

    def encrypt?
      !!encrypt
    end

    def payload
      if encrypt?
        Box::Cryptor.encrypt opts.to_json
      else
        opts.to_json
      end
    end
  end
end
