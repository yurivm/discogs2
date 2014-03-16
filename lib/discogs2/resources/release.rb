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

      protected

      def community=(community)
        @community = Community.new(community)
      end

      def tracklist=(tracklist)
        @tracklist = tracklist.map { |hsh| Track.new(hsh)}
      end

      def images=(images)
        @images = images.map { |hsh| Image.new(hsh) }
      end

    end
  end
end