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
        return [] if error?

        stations = []

        data['stations'].each do |s|
          stations << Station.create(s, user)
        end

        stations
      end

      private

      def error?
          user.error = response.error if response.error?
      end

      def response
        @response ||= Server.post params, opts, request_opts
      end

      def data
        response.result
      end

      def request_opts
        { :encrypt => true, :secure => false }
      end

      def params
        {
          :method => 'user.getStationList' ,
          :user_id => user.user_id,
          :partner_id => user.partner.partner_id,
          :auth_token => user.user_auth_token
        }
      end

      def opts
        {
          :userAuthToken => user.user_auth_token,
          :syncTime => Time.now.to_i - user.sync_time
        }
      end
    end
  end
end