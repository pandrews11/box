require_relative 'collectors'

module Box
  class User

    attr_reader :username, :password, :data, :response
    attr_writer :error

    def self.login(username, password)
      new(username, password)
    end

    def initialize(username, password)
      @username = username
      @password = password

      @response ||= Server.post(params, opts, request_opts)
      @data ||= @response.result
    end

    def stations
      @stations ||= Collectors::StationCollector.for self
    end

    def partner
      @partner ||= Partner.login
    end

    def sync_time
      Cryptor.decrypt(partner.sync_time)[4..-1].to_i
    end

    def user_auth_token
      @user_auth_token ||= data['userAuthToken']
    end

    def has_audio_ads
      @has_audio_ads ||= data['hasAudioAds']
    end
    alias_method :has_audio_ads?, :has_audio_ads

    def user_id
      @user_id ||= data['userId']
    end

    def max_stations_allowed
      @max_stations_allowed ||= data['maxStationsAllowed']
    end

    def user_profile_url
      @user_profile_url ||= data['userProfileUrl']
    end

    def can_listen
      @can_listen ||= data['canListen']
    end
    alias_method :can_listen?, :can_listen

    def error
      @error ||@response.error
    end

    private

    def request_opts
      {:encrypt => true, :secure => true}
    end

    def params
      {
        :method => 'auth.userLogin',
        :partner_id => partner.partner_id,
        :auth_token => partner.partner_auth_token
      }
    end

    def opts
      {
        :loginType => 'user',
        :username => username,
        :password => password,
        :partnerAuthToken => partner.partner_auth_token,
        :syncTime => Time.now.to_i - sync_time
      }
    end
  end
end
