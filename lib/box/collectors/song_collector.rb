module Box
  module Collectors
    class SongCollector

      attr_reader :data, :station

      def self.for(station)
        new(station).retrieve_songs
      end

      def initialize(station)
        @station = station
      end

      def retrieve_songs
        @data ||= station.get_playlist

        songs = []

        @data.result['items'].each do |s|
          songs << Song.create(s)
        end

        songs
      end
    end
  end
end