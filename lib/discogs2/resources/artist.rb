module Discogs2
  module Resources
    class Artist < Resource

     attr_reader  :profile,
                  :name,
                  :releases_url,
                  :uri,
                  :members,
                  :urls,
                  :images,
                  :aliases,
                  :resource_url,
                  :id,
                  :data_quality,
                  :namevariations,
                  :active 

      def initialize(src_hash)
        src_hash['profile'] = Resource.escape_json_newlines(src_hash['profile']) if src_hash.key?("profile")
        super
      end

      protected

      def members=(members)
        unless members.blank?
          @members = members.map {|mhash| Artist.new(mhash)}
        end
      end

      def images=(images)
        unless images.blank?
          @images = images.map { |hsh| Image.new(hsh) }
        end
      end

      def aliases=(aliases)
        unless aliases.blank?
          @aliases = aliases.map { |hsh| Artist.new(hsh) }
        end
      end

    end
  end
end
