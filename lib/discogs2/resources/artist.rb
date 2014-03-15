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
                  :resource_url,
                  :id,
                  :data_quality,
                  :namevariations,
                  :active 

      class << self
        def from_hash(src_hash)
          #extra slashes for profile for now
          src_hash['profile'] = Resource.escape_json_newlines(src_hash['profile'])
          Artist.new(src_hash)
        end
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

    end
  end
end
