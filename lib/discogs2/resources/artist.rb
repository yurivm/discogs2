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

      def from_hash(src_hash)
        Artist.new(src_hash)
      end
    end

     def attrs
      self.class.attrs
     end

     def set_attr(attribute, value)
      raise "#{attribute} is not an attribute. Check the attr_reader list" unless attrs.include?(attribute)
      setter = "#{attribute}=".to_sym
      self.respond_to?(setter, true) ? self.send(setter, value) : self.instance_variable_set("@#{attribute}", value)
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
                  :namevariations,
                  :active 

      def initialize(src_hash)
        attrs.each do |attribute|
          #puts "#{attribute} : #{src_hash[attribute.to_s]}"
          set_attr(attribute, src_hash[attribute.to_s])
        end
      end

      protected

      def members=(members)
        #require 'pry-byebug'; binding.pry
        unless members.blank?
          @members = members.map {|mhash| Artist.new(mhash)}
        end
      end
    end
  end
end
