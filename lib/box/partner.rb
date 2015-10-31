module Box
  class Partner

    attr_accessor :response

    def self.login
      new.login
    end

    def login
      @response ||= Server.post params, opts, request_opts
      self
    end

    private

    def method_missing(method_sym, *arguments, &block)
      self.response.send(method_sym)
    end

    def request_opts
      { :secure => true, :encrypt => false }
    end

    def params
      { :method => 'auth.partnerLogin' }
    end

    def opts
      {
        :username => 'pandora one',
        :password => 'TVCKIBGS9AO9TSYLNNFUML0743LH82D',
        :deviceModel => 'D01',
        :version => '5'
      }
    end
  end
end
