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
          :user_id => user.userId,
          :partner_id => user.partner.partnerId,
          :auth_token => user.userAuthToken
        }
      end

      def delete_opts
        {
          :userAuthToken => user.userAuthToken,
          :sync_time => Time.now.to_i - user.sync_time,
          :stationToken => stationToken
        }
      end
    end
  end
end