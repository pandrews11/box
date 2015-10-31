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
          :user_id =>user.userId,
          :partner_id => user.partner.partnerId,
          :auth_token => user.userAuthToken
        }
      end

      def playlist_opts
        {
          :userAuthToken => user.userAuthToken,
          :syncTime => Time.now.to_i - user.sync_time,
          :stationToken => stationToken
        }
      end

    end
  end
end