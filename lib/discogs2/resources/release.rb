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


    end
  end
end