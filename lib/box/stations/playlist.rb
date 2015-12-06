module Box
  module Stations
    module Playlist
      def self.included(base)
      end

      def get_playlist
        Box::Server.post \
          playlist_params,
          playlist_opts,
          playlist_request_opts
      end

      def playlist_request_opts
        { :encrypt => true, :secure => true }
      end

      def playlist_params
        {
          :method => 'station.getPlaylist',
          :user_id => user.user_id,
          :partner_id => user.partner.partner_id,
          :auth_token => user.user_auth_token
        }
      end

      def playlist_opts
        {
          :userAuthToken => user.user_auth_token,
          :syncTime => Time.now.to_i - user.sync_time,
          :stationToken => station_token,
          :includeTrackLength => true
        }
      end

    end
  end
end
