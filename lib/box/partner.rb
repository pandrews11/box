module Box
  class Partner

    def self.login
      new.login
    end

    def login
      @response ||= Box::Response.for(Box::Request.for method, params)
    end

    private

    def method
      'auth.partnerLogin'
    end

    def params
      {
        :username => 'pandora one',
        :password => 'TVCKIBGS9AO9TSYLNNFUML0743LH82D',
        :deviceModel => 'D01',
        :version => '5'
      }
    end
  end
end
