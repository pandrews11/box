require_relative 'stations'

module Box
  class Station

    include Stations::Rename
    include Stations::Delete
    include Stations::Playlist

    attr_reader :data, :user

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
      Collectors::SongCollector.for self
    end

    def station_id
      data['stationId']
    end

    def station_detail_url
      data['stationDetailUrl']
    end

    def genre
      data['genre']
    end

    def is_shared
      data['isShared']
    end
    alias_method :is_shared?, :is_shared

    def date_created
      data['dateCreated']
    end

    def station_token
      data['stationToken']
    end

    def station_name
      data['stationName']
    end

    def station_sharing_url
      data['stationSharingUrl']
    end

    def allow_rename
      data['allowRename']
    end
    alias_method :allow_rename?, :allow_rename

    def allow_add_music
      data['allowAddMusic']
    end
    alias_method :allow_add_music?, :allow_add_music

    def allow_delete
      data['allowDelete']
    end
    alias_method :allow_delete?, :allow_delete

  end
end
