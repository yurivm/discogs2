module Discogs2
  module Resources
    class Label < Resource
      attr_reader :entity_type,
                  :catno,
                  :id,
                  :entity_type_name,
                  :name,
                  :resource_url
    end
  end
end