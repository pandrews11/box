module Box
  module Stations
    module Rename
      def self.included(base)
      end

      def rename_station(name)
        Box::Server.post \
          rename_params,
          rename_opts(name),
          rename_request_opts
      end

      def rename_request_opts
        { :encrypt => true, :secure => false }
      end

      def rename_params
        {
          :method => 'station.renameStation',
          :user_id => user.user_id,
          :partner_id => user.partner.partner_id,
          :auth_token => user.user_auth_token
        }
      end

      def rename_opts(name)
        {
          :userAuthToken => user.user_auth_token,
          :syncTime => Time.now.to_i - user.sync_time,
          :stationToken => station_token,
          :stationName => name
        }
      end
    end
  end
end