module Discogs2
  class Resource

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

      protected

      def escape_json_newlines(str)
        str.gsub(/\r/, "\\r").gsub(/\n/, "\\n")
      end

    end
    
    def initialize(src_hash)
      attrs.each { |attribute| set_attr(attribute, src_hash[attribute.to_s]) }
    end

    def attrs
      self.class.attrs
    end

    protected

    def set_attr(attribute, value)
      raise "#{attribute} is not an attribute. Check the attr_reader list" unless attrs.include?(attribute)
      setter = "#{attribute}=".to_sym
      self.respond_to?(setter, true) ? self.send(setter, value) : self.instance_variable_set("@#{attribute}", value)
    end

  end
end