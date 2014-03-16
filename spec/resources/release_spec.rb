require 'spec_helper'

describe Discogs2::Resources::Release do
  let(:src_hash) do
    src = <<-JSON
    {"styles": ["Prog Rock"], "videos": [{"duration": 282, "embed": true, "title": "The Advent of Panurge - Gentle Giant (1972)", "description": "The Advent of Panurge - Gentle Giant (1972)", "uri": "http://www.youtube.com/watch?v=v3ozXQNsQYs"}, {"duration": 2218, "embed": true, "title": "Gentle Giant Gentle Giant 1970 Full Album", "description": "Gentle Giant Gentle Giant 1970 Full Album", "uri": "http://www.youtube.com/watch?v=328UvOKmhM8"}, {"duration": 277, "embed": true, "title": "The Boys in the Band - Gentle Giant (1972)", "description": "The Boys in the Band - Gentle Giant (1972)", "uri": "http://www.youtube.com/watch?v=BTet3C_afKA"}, {"duration": 239, "embed": true, "title": "Gentle Giant - Raconteur Troubadour", "description": "Gentle Giant - Raconteur Troubadour", "uri": "http://www.youtube.com/watch?v=RgCuyLumKDE"}, {"duration": 246, "embed": true, "title": "GENTLE GIANT Octopus 03  A Cry For Everyone", "description": "GENTLE GIANT Octopus 03  A Cry For Everyone", "uri": "http://www.youtube.com/watch?v=iQAFQlSmogU"}, {"duration": 192, "embed": true, "title": "GENTLE GIANT - OCTOPUS - Dog's Life", "description": "GENTLE GIANT - OCTOPUS - Dog's Life", "uri": "http://www.youtube.com/watch?v=uCpkqtq8aHk"}], "series": [], "labels": [{"resource_url": "http://api.discogs.com/labels/2266", "entity_type": "1", "catno": "6360 080", "id": 2266, "name": "Vertigo"}], "community": {"status": "Accepted", "rating": {"count": 31, "average": 4.45}, "want": 146, "contributors": [{"username": "Johnny-X", "resource_url": "http://api.discogs.com/users/Johnny-X"}, {"username": "rhythmic_disturbance", "resource_url": "http://api.discogs.com/users/rhythmic_disturbance"}, {"username": "Internaut", "resource_url": "http://api.discogs.com/users/Internaut"}, {"username": "marcelrecords", "resource_url": "http://api.discogs.com/users/marcelrecords"}, {"username": "vada_19-79.", "resource_url": "http://api.discogs.com/users/vada_19-79."}, {"username": "cameosis", "resource_url": "http://api.discogs.com/users/cameosis"}], "have": 122, "submitter": {"username": "Johnny-X", "resource_url": "http://api.discogs.com/users/Johnny-X"}, "data_quality": "Needs Vote"}, "year": 1972, "images": [{"uri": "http://api.discogs.com/image/R-584068-1275050106.jpeg", "height": 450, "width": 450, "resource_url": "http://api.discogs.com/image/R-584068-1275050106.jpeg", "type": "primary", "uri150": "http://api.discogs.com/image/R-150-584068-1275050106.jpeg"}, {"uri": "http://api.discogs.com/image/R-584068-1310999545.jpeg", "height": 450, "width": 600, "resource_url": "http://api.discogs.com/image/R-584068-1310999545.jpeg", "type": "secondary", "uri150": "http://api.discogs.com/image/R-150-584068-1310999545.jpeg"}, {"uri": "http://api.discogs.com/image/R-584068-1310999554.jpeg", "height": 450, "width": 600, "resource_url": "http://api.discogs.com/image/R-584068-1310999554.jpeg", "type": "secondary", "uri150": "http://api.discogs.com/image/R-150-584068-1310999554.jpeg"}, {"uri": "http://api.discogs.com/image/R-584068-1275050118.jpeg", "height": 400, "width": 400, "resource_url": "http://api.discogs.com/image/R-584068-1275050118.jpeg", "type": "secondary", "uri150": "http://api.discogs.com/image/R-150-584068-1275050118.jpeg"}], "format_quantity": 1, "id": 584068, "genres": ["Rock"], "thumb": "http://api.discogs.com/image/R-150-584068-1275050106.jpeg", "extraartists": [{"join": "", "name": "Ray Shulman", "anv": "Raymond Shulman", "tracks": "", "role": "Bass, Violin, Guitar, Percussion, Vocals", "resource_url": "http://api.discogs.com/artists/213074", "id": 213074}, {"join": "", "name": "Derek Shulman", "anv": "Shulman", "tracks": "", "role": "Composed By", "resource_url": "http://api.discogs.com/artists/342789", "id": 342789}, {"join": "", "name": "Kerry Minnear", "anv": "Minnear", "tracks": "", "role": "Composed By", "resource_url": "http://api.discogs.com/artists/342791", "id": 342791}, {"join": "", "name": "Philip Shulman", "anv": "Shulman", "tracks": "", "role": "Composed By", "resource_url": "http://api.discogs.com/artists/873901", "id": 873901}, {"join": "", "name": "Ray Shulman", "anv": "Shulman", "tracks": "", "role": "Composed By", "resource_url": "http://api.discogs.com/artists/213074", "id": 213074}, {"join": "", "name": "Roger Dean (4)", "anv": "", "tracks": "", "role": "Design [Uncredited]", "resource_url": "http://api.discogs.com/artists/1826912", "id": 1826912}, {"join": "", "name": "John Weathers", "anv": "John Wethers", "tracks": "", "role": "Drums, Congas, Percussion", "resource_url": "http://api.discogs.com/artists/579149", "id": 579149}, {"join": "", "name": "Martin Rushent", "anv": "", "tracks": "", "role": "Effects", "resource_url": "http://api.discogs.com/artists/40403", "id": 40403}, {"join": "", "name": "Gary Green", "anv": "", "tracks": "", "role": "Guitar, Percussion", "resource_url": "http://api.discogs.com/artists/342790", "id": 342790}, {"join": "", "name": "Kerry Minnear", "anv": "", "tracks": "", "role": "Keyboards, Vibraphone, Percussion, Cello, Synthesizer [Moog], Lead Vocals, Backing Vocals", "resource_url": "http://api.discogs.com/artists/342791", "id": 342791}, {"join": "", "name": "Derek Shulman", "anv": "", "tracks": "", "role": "Lead Vocals, Alto Saxophone", "resource_url": "http://api.discogs.com/artists/342789", "id": 342789}, {"join": "", "name": "Gentle Giant", "anv": "", "tracks": "", "role": "Producer", "resource_url": "http://api.discogs.com/artists/240248", "id": 240248}, {"join": "", "name": "Philip Shulman", "anv": "", "tracks": "", "role": "Saxophone, Trumpet, Mellophone, Lead Vocals, Backing Vocals", "resource_url": "http://api.discogs.com/artists/873901", "id": 873901}], "title": "Octopus", "artists": [{"join": "", "name": "Gentle Giant", "anv": "", "tracks": "", "role": "", "resource_url": "http://api.discogs.com/artists/240248", "id": 240248}], "master_id": 15513, "tracklist": [{"duration": "", "position": "A1", "type_": "track", "title": "The Advent Of Panurge"}, {"duration": "", "position": "A2", "type_": "track", "title": "Raconteur, Troubadour"}, {"duration": "", "position": "A3", "type_": "track", "title": "A Cry For Everyone"}, {"duration": "", "position": "A4", "type_": "track", "title": "Knots"}, {"duration": "", "position": "B1", "type_": "track", "title": "The Boys In The Band"}, {"duration": "", "position": "B2", "type_": "track", "title": "Dog's Life"}, {"duration": "", "position": "B3", "type_": "track", "title": "Think Of Me With Kindness"}, {"duration": "", "position": "B4", "type_": "track", "title": "River"}], "status": "Accepted", "released_formatted": "Dec 1972", "estimated_weight": 230, "master_url": "http://api.discogs.com/masters/15513", "released": "1972-12-00", "country": "UK", "notes": "Released in a fold-out cover, with company inner sleeve and a \u201cswirl\u201d Vertigo label.\\r\\n\\r\\nThis LP was released in 1973 in USA with an alternate cover.", "companies": [], "uri": "http://www.discogs.com/Gentle-Giant-Octopus/release/584068", "formats": [{"qty": "1", "descriptions": ["LP", "Album"], "name": "Vinyl"}], "resource_url": "http://api.discogs.com/releases/584068", "data_quality": "Needs Vote"}
    JSON
    JSON.parse(src)
  end
  let(:release) { Discogs2::Resources::Release.new(src_hash)}

  describe "#initialize" do
    ["id", "title", "resource_url", "uri", "status", "data_quality", "master_id", "master_url", "country", "year", "released", "released_formatted", "notes", "styles", "genres", "estimated_weight", "format_quantity"].each do |attribute|
      it "sets the #{attribute}" do
        expect(release.send(attribute.to_sym)).to eq(src_hash[attribute])
      end
    end

    it "provides the community data (have and want, rating)" do
      community = release.community
      expect(community.have).to eq(122)
      expect(community.want).to eq(146)
      expect(community.rating.count).to eq(31)
      expect(community.rating.average).to eq(4.45)
    end

    it "creates the tracklist as an array of tracks" do
      expect(release.tracklist).to be_a(Array)
    end
    it "creates the correct number of tracks" do
      expect(release.tracklist.size).to eq(8)
    end
    it "populates the track attributes correctly" do
      track = release.tracklist.first
      expect(track.title).to eq("The Advent Of Panurge")
      expect(track.position).to eq("A1")
      expect(track.duration).to eq("") #it is not given 
    end

    it "creates the images as an array" do
      expect(release.images).to be_a(Array)
    end
    it "creates the images as an array" do
      expect(release.images.size).to eq(4)
    end
    it "populates the image attributes correctly" do
      img = release.images.first
      expect(img.type).to eq("primary")
      expect(img.resource_url).to eq("http://api.discogs.com/image/R-584068-1275050106.jpeg")
      expect(img.height).to eq(450)
      expect(img.width).to eq(450)
    end
    
    it "creates the labels as an array of the correct size" do
      expect(release.labels.size).to eq(1)
    end
    it "populates the label attributes correctly" do
      label = release.labels.first
      expect(label.resource_url).to eq("http://api.discogs.com/labels/2266")
      #expect(label.entity_type).to eq(1)
      expect(label.catno).to eq("6360 080")
      expect(label.id).to eq(2266)
      expect(label.name).to eq("Vertigo")
    end
    it "creates the formats as an array of the correct size" do
      expect(release.formats.size).to eq(1)
    end
    it "populates the format attributes correctly" do
      format = release.formats.first
      expect(format.descriptions).to eq(["LP", "Album"])
      expect(format.qty).to eq("1")
      expect(format.name).to eq("Vinyl")
    end
  end
end