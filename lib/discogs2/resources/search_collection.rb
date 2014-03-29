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

      def current_page
        @pagination.page
      end

      def total_pages
        @pagination.pages
      end

      def prev_url
        @pagination.urls['prev']
      end

      def next_url
        @pagination.urls['next']
      end

      def last_url
        @pagination.urls['last']
      end

      def prev_page
        if prev_url.present?
          @wrapper.fetch_and_create_object(prev_url, SearchCollection)
        else
          raise "Prev url is not set. You are probably at the very first search result page"
        end
      end

      def next_page
        if next_url.present?
          @wrapper.fetch_and_create_object(next_url, SearchCollection)
        else
          raise "Next url is not set. You have probably reached the last search result page"
        end
      end

      def last_page
        @wrapper.fetch_and_create_object(last_url, SearchCollection)
      end

      protected

      def pagination=(pages)
        @pagination = OpenStruct.new(pages)
      end

      def results=(results)
        @results = results.map {|hsh| SearchResult.new(hsh)}
      end

    end
  end
end