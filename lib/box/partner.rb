require 'forwardable'

module Box
  class Partner

    extend Forwardable
    def_delegator :@response, :error, :error

    attr_reader :data, :response

    def self.login
      new.login
    end

    def initialize
    end

    def login
      @response ||= Server.post(params, opts, request_opts)
      @data ||= @response.data
    end

    def station_skip_limit
      data['stationSkipLimit']
    end

    def partner_id
      data['partnerId']
    end

    def partner_auth_token
      data['partnerAuthToken']
    end

    def sync_time
      data['syncTime']
    end

    def station_skip_unit
      data['stationSkipUnit']
    end

    private

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
