module Discogs2
  module Utils
    class << self
      def escape_json_newlines(str)
        str.gsub(/\r/, "\\r").gsub(/\n/, "\\n")
      end
    end
  end
end