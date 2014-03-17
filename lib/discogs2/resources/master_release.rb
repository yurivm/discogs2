module Discogs2
  module Resources
    class MasterRelease < Release
     attr_reader  :id,
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
                  #:labels,
                  :companies,
                  #:extraartists,
                  :videos,
                  :artists,
                  #:formats,
                  :images,
                  :identifiers,
                  :tracklist      
    end
  end
end