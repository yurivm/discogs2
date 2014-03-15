module Discogs2
  module Resources
    class Image < Resource
      attr_reader :uri,
                  :height,
                  :width,
                  :resource_url,
                  :type,
                  :uri150

    end
  end
end