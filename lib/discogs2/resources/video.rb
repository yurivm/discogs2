module Discogs2
  module Resources
    class Video < Resource
      attr_reader :duration,
                  :description,
                  :embed,
                  :uri,
                  :title
    end
  end
end