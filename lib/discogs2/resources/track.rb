module Discogs2
  module Resources
    class Track < Resource
      attr_reader :type_,
                  :duration,
                  :position,
                  :title
    end
  end
end