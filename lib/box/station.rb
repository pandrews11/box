require_relative 'stations'

module Box
  class Station

    include Stations::Rename
    include Stations::Delete
    include Stations::Playlist

    attr_reader :data, :user, :playlist

    def self.create(data, user)
      new(data, user)
    end

    def initialize(data, user)
      @data = data
      @user = user
    end

    def rename(name)
      rename_station name
    end

    def delete
      delete_station
    end

    def playlist
      @playlist ||= Collectors::SongCollector.for self
    end

    def method_missing(method_sym, *arguments, &block)
      data[method_sym.to_s]
    end
  end
end