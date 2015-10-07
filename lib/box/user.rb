module Box
  class User
    attr_reader :username, :password
    attr_accessor :response

    def self.login(username, password)
      new(username, password).login
    end

    def initialize(username, password)
      @username = username
      @password = password
    end

    def login
      @response ||= Box::Response.for(Box::Request.for params, opts, true)
      self
    end

    def stations

    end

    private

    def method_missing(method_sym, *arguments, &block)
      self.response.send(method_sym)
    end

    def partner
      @partner ||= Box::Partner.login
    end

    def partner_auth_token
      partner.partnerAuthToken
    end

    def partner_id
      partner.partnerId
    end

    def sync_time
      Box::Cryptor.decrypt(partner.syncTime)[4..-1].to_i
    end

    def params
      {
        :method => 'auth.userLogin',
        :partner_id => partner_id,
        :auth_token => partner_auth_token
      }
    end

    def opts
      {
        :loginType => 'user',
        :username => username,
        :password => password,
        :partnerAuthToken => partner_auth_token,
        :syncTime => Time.now.to_i - sync_time
      }
    end
  end
end
