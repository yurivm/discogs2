module Discogs2
  module Resources
    class SearchResult < Resource
      attr_reader :style,
                  :thumb,
                  :format,
                  :country,
                  :barcode,
                  :uri,
                  :label,
                  :catno,
                  :year,
                  :genre,
                  :title,
                  :resource_url,
                  :type,
                  :id
    end
  end
end