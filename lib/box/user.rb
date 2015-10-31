require_relative 'collectors'

module Box
  class User

    attr_reader :username, :password, :data

    def self.login(username, password)
      new(username, password).login
    end

    def initialize(username, password)
      @username = username
      @password = password
    end

    def login
      @data ||= Server.post params, opts, request_opts
      self
    end

    def stations
      @stations ||= Collectors::StationCollector.for self
    end

    def partner
      @partner ||= Partner.login
    end

    def sync_time
      Cryptor.decrypt(partner.syncTime)[4..-1].to_i
    end

    private

    def request_opts
      {:encrypt => true, :secure => true}
    end

    def method_missing(method_sym, *arguments, &block)
      self.data.send(method_sym)
    end

    def partner_auth_token
      partner.partnerAuthToken
    end

    def partner_id
      partner.partnerId
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
