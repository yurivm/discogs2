module Discogs2
  module Resources
    class Artist

     class << self
      def attr_reader(*args)
        @attrs ||= []
        @attrs.concat(args)
        @attrs.uniq!
        super(*args)
      end

      def attrs
        @attrs
      end
     end

     def attrs
      self.class.attrs
     end

     def set_attr(attribute, value)
      raise "#{attribute} is not an attribute. Check the attr_reader list" unless attrs.include?(attribute)
      self.instance_variable_set("@#{attribute}", value)
     end

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
                  :namevariations

      def initialize(src_hash)
        attrs.each do |attribute|
          set_attr(attribute, src_hash[attribute.to_s])
        end
      end

      class << self
        def from_hash(src_hash)
          Artist.new(src_hash)
        end
      end

    end
  end
end
