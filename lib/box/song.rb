module Box
  class Song

    attr_reader :data

    def self.create(data)
      new(data)
    end

    def  initialize(data)
      @data = data
    end

    def song_identity
      @song_identity ||= data['songIdentity']
    end

    def track_token
      @track_token ||= data['trackToken']
    end

    def artist_name
      @artist_name ||= data['artistName']
    end

    def album_name
      @album_name ||= data['albumName']
    end

    def amazon_album_url
      @amazon_album_url ||= data['amazonAlbumUrl']
    end

    def song_explorer_url
      @song_explorer_url ||= data['songExplorerUrl']
    end

    def is_featured
      @is_featured ||= data['isFeatured']
    end
    alias_method :is_featured?, :is_featured

    def album_art_url
      @album_art_url ||= data['albumArtUrl']
    end

    def artist_detail_url
      @artist_detail_url ||= data['artistDetailUrl']
    end

    def audio_url_map
      @audio_url_map ||= data['audioUrlMap']
    end

      def high_quality_bit_rate
        @high_quality_bit_rate ||=  audio_url_map['highQuality']['bitrate']
      end

      def high_quality_encoding
        @high_quality_encoding ||= audio_url_map['highQuality']['encoding']
      end

      def high_quality_audio_url
        @high_quality_audio_url ||= audio_url_map['highQuality']['audioUrl']
      end

      def high_quality_protocol
        @high_quality_protocol ||= audio_url_map['highQuality']['protocol']
      end

      def medium_quality_bit_rate
        @medium_quality_bit_rate ||=  audio_url_map['mediumQuality']['bitrate']
      end

      def medium_quality_encoding
        @medium_quality_encoding ||= audio_url_map['mediumQuality']['encoding']
      end

      def medium_quality_audio_url
        @medium_quality_audio_url ||= audio_url_map['mediumQuality']['audioUrl']
      end

      def medium_quality_protocol
        @medium_quality_protocol ||= audio_url_map['mediumQuality']['protocol']
      end

    def itunes_song_url
      @itunes_song_url ||= data['itunesSongUrl']
    end

    def share_landing_url
      @share_landing_url ||= data['shareLandingUrl']
    end

    def album_identity
      @album_identity ||= data['albumIdentity']
    end

    def amazon_album_asin
      @amazon_album_asin ||= data['amazonAlbumAsin']
    end

    def track_type
      @track_type ||= data['trackType']
    end

    def amazon_album_digital_asin
      @amazon_album_digital_asin ||= data['amazonAlbumDigitalAsin']
    end

    def artist_explorer_url
      @artist_explorer_url ||= data['artistExplorerUrl']
    end

    def song_name
      @song_name ||= data['songName']
    end

    def album_detail_url
      @album_detail_url ||= data['albumDetailUrl']
    end

    def song_detail_url
      @song_detail_url ||= data['songDetailUrl']
    end

    def station_id
      @station_id ||= data['stationId']
    end

    def song_rating
      @song_rating ||= data['songRating']
    end

    def track_gain
      @track_gain ||= data['trackGain']
    end

    def album_explorer_url
      @album_explorer_url ||= data['albumExplorerUrl']
    end

    def allow_feedback
      @allow_feedback ||= data['allowFeedback']
    end

    def amazon_song_digital_asin
      @amazon_song_digital_asin ||= data['amazonSongDigitalAsin']
    end

    def music_id
      @music_id ||= data['musicId']
    end

    def category_descriptor
      @category_descriptor ||= data['categoryDescriptor']
    end

    def program_descriptor
      @program_descriptor ||= data['programDescriptor']
    end

  end
end