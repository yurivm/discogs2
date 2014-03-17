require "discogs2/resources/artist"

module Discogs2
  module Resources
    class ExtraArtist < Artist
      attr_reader :join,
                  :anv,
                  :tracks,
                  :role
    end
  end
end