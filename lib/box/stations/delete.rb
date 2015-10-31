module Box
  module Stations
    module Delete
      def self.included(base)
      end

      def delete_station(name)
        Box::Server.post \
          delete_params,
          delete_opts,
          delete_request_opts
      end

      def delete_request_opts
        { :encrypt=> true, :secure => false }
      end

      def delete_params
        {
          :method => 'station.deleteStation',
          :user_id => user.user_id,
          :partner_id => user.partner.partner_id,
          :auth_token => user.user_auth_token
        }
      end

      def delete_opts
        {
          :userAuthToken => user.user_auth_token,
          :sync_time => Time.now.to_i - user.sync_time,
          :stationToken => station_token
        }
      end
    end
  end
end