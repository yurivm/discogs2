module Discogs2
  module Resources
    class Label < Resource
      attr_reader :entity_type,
                  :catno,
                  :id,
                  :entity_type_name,
                  :name,
                  :resource_url,
                  :releases_url,
                  :profile,
                  :data_quality,
                  :contact_info,
                  :parent_label,
                  :sublabels,
                  :urls,
                  :images

       def images=(images)
         @images = images.map { |hsh| Image.new(hsh) } if images.present?
       end

       def sublabels=(sublabels)
        @sublabels = sublabels.map { |hsh| Label.new(hsh) } if sublabels.present?
       end

    end
  end
end