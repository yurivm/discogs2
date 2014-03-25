require 'ostruct'
module Discogs2
  module Resources
    class SearchCollection < Resource
      attr_reader :pagination, :results

      def initialize(wrapper, src_hash)
        @wrapper = wrapper
        super(src_hash)
      end

      def per_page
        @pagination.per_page
      end

      def items
        @pagination.items
      end

      def page
        @pagination.page
      end

      def next_url
        @pagination.urls['next']
      end

      def last_url
        @pagination.urls['last']
      end

      protected

      def pagination=(pages)
        @pagination = OpenStruct.new(pages)
      end

    end
  end
end