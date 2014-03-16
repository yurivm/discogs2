require 'ostruct'
module Discogs2
  module Resources
    class Community < Resource
      attr_reader :have,
                  :want,
                  :rating

      protected 

      def rating=(rating_hash)
        @rating = OpenStruct.new(rating_hash)
      end
    end
  end
end