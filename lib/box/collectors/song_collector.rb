module Box
  module Collectors
    class SongCollector

      attr_reader :data, :station

      def self.for(station)
        station.user.with_auth do
          new(station).retrieve_songs
        end
      end

      def initialize(station)
        @station = station
      end

      def retrieve_songs
        songs = []

        station.get_playlist.result['items'].each do |s|
          songs << Song.create(s)
        end

        songs
      end
    end
  end
end
