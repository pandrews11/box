module Box
  module Collectors
    class StationCollector

      attr_accessor :data
      attr_reader :user

      def self.for(user)
        new(user).retrieve_stations
      end

      def initialize(user)
        @user = user
      end

      def retrieve_stations
        @data ||= Server.post params, opts, request_opts

        stations = []

        @data.result['stations'].each do |s|
          stations << Station.create(s, user)
        end

        stations
      end

      def request_opts
        { :encrypt => true, :secure => false }
      end

      def params
        {
          :method => 'user.getStationList' ,
          :user_id => user.userId,
          :partner_id => user.partner.partnerId,
          :auth_token => user.userAuthToken
        }
      end

      def opts
        {
          :userAuthToken => user.userAuthToken,
          :syncTime => Time.now.to_i - user.sync_time
        }
      end
    end
  end
end