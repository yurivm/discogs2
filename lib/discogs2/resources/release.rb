module Discogs2
  module Resources
    class Release < Resource
      attr_reader :id,
                  :title,
                  :resource_url,
                  :uri,
                  :status,
                  :data_quality,
                  :master_id,
                  :master_url,
                  :country,
                  :year,
                  :released,
                  :released_formatted,
                  :notes,
                  :styles,
                  :genres,
                  :estimated_weight,
                  :format_quantity,
                  :community,
                  :labels,
                  :companies,
                  :extraartists,
                  :videos,
                  :artists,
                  :formats,
                  :images,
                  :identifiers,
                  :tracklist

      alias :discogs_release_id :id
      alias :discogs_master_id :master_id
      
      protected

      def community=(community)
        @community = Community.new(community) if community.present?
      end

      def tracklist=(tracklist)
        @tracklist = tracklist.map { |hsh| Track.new(hsh)}
      end

      def images=(images)
        @images = images.map { |hsh| Image.new(hsh) }
      end

      def labels=(labels)
        @labels = labels.map { |hsh| Label.new(hsh) }
      end

      def formats=(formats)
        @formats = formats.map { |hsh| Format.new(hsh) }
      end

      def videos=(videos)
        @videos = videos.map { |hsh| Video.new(hsh) }
      end

      def extraartists=(extraartists)
        @extraartists = extraartists.map {|hsh| ExtraArtist.new(hsh)}
      end

      def artists=(artists)
        @artists = artists.map {|hsh| Artist.new(hsh)}
      end

    end
  end
end