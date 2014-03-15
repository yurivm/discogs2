require 'spec_helper'

describe Discogs2::Resources::Artist do
  describe ".from_hash" do
    let(:src_hash) do
      src = <<-JSON
      {"profile": "Formed: 1983 in Los Angeles, California.\\r\\nDisbanded: 2002.\\r\\n\\r\\n [a=Metallica]", "releases_url": "http://api.discogs.com/artists/11770/releases", "name": "Megadeth", "uri": "http://www.discogs.com/artist/11770-Megadeth", "members": [{"active": false, "resource_url": "http://api.discogs.com/artists/271505", "id": 271505, "name": "Al Pitrelli"}, {"active": true, "resource_url": "http://api.discogs.com/artists/892658", "id": 892658, "name": "Chris Broderick"}, {"active": false, "resource_url": "http://api.discogs.com/artists/410707", "id": 410707, "name": "Chris Poland"}, {"active": false, "resource_url": "http://api.discogs.com/artists/410952", "id": 410952, "name": "Chuck Behler"}, {"active": true, "resource_url": "http://api.discogs.com/artists/251808", "id": 251808, "name": "Dave Mustaine"}, {"active": true, "resource_url": "http://api.discogs.com/artists/374278", "id": 374278, "name": "David Ellefson"}, {"active": false, "resource_url": "http://api.discogs.com/artists/1747976", "id": 1747976, "name": "Dijon Carruthers"}, {"active": false, "resource_url": "http://api.discogs.com/artists/410706", "id": 410706, "name": "Gar Samuelson"}, {"active": false, "resource_url": "http://api.discogs.com/artists/352849", "id": 352849, "name": "Glen Drover"}, {"active": false, "resource_url": "http://api.discogs.com/artists/1584605", "id": 1584605, "name": "Greg Handevidt"}, {"active": false, "resource_url": "http://api.discogs.com/artists/299762", "id": 299762, "name": "James LoMenzo"}, {"active": false, "resource_url": "http://api.discogs.com/artists/450337", "id": 450337, "name": "James McDonough"}, {"active": false, "resource_url": "http://api.discogs.com/artists/407059", "id": 407059, "name": "Jay Reynolds (2)"}, {"active": false, "resource_url": "http://api.discogs.com/artists/410394", "id": 410394, "name": "Jeff Young (3)"}, {"active": false, "resource_url": "http://api.discogs.com/artists/410710", "id": 410710, "name": "Jimmy DeGrasso"}, {"active": false, "resource_url": "http://api.discogs.com/artists/251588", "id": 251588, "name": "Kerry King"}, {"active": false, "resource_url": "http://api.discogs.com/artists/277594", "id": 277594, "name": "Marty Friedman"}, {"active": false, "resource_url": "http://api.discogs.com/artists/410708", "id": 410708, "name": "Nick Menza"}, {"active": true, "resource_url": "http://api.discogs.com/artists/768786", "id": 768786, "name": "Shawn Drover"}], "urls": ["http://www.megadeth.com", "http://www.myspace.com/megadeth", "http://www.themegadethvinylarchives.com", "http://en.wikipedia.org/wiki/Megadeth", "https://www.facebook.com/Megadeth", "http://www.last.fm/music/megadeth", "http://www.twitter.com/megadeth"], "images": [{"uri": "http://api.discogs.com/image/A-11770-1371177621-1567.jpeg", "height": 344, "width": 573, "resource_url": "http://api.discogs.com/image/A-11770-1371177621-1567.jpeg", "type": "primary", "uri150": "http://api.discogs.com/image/A-150-11770-1371177621-1567.jpeg"}, {"uri": "http://api.discogs.com/image/A-11770-1280605685.jpeg", "height": 400, "width": 600, "resource_url": "http://api.discogs.com/image/A-11770-1280605685.jpeg", "type": "secondary", "uri150": "http://api.discogs.com/image/A-150-11770-1280605685.jpeg"}, {"uri": "http://api.discogs.com/image/A-11770-1280605655.jpeg", "height": 391, "width": 600, "resource_url": "http://api.discogs.com/image/A-11770-1280605655.jpeg", "type": "secondary", "uri150": "http://api.discogs.com/image/A-150-11770-1280605655.jpeg"}, {"uri": "http://api.discogs.com/image/A-11770-1280605617.jpeg", "height": 460, "width": 546, "resource_url": "http://api.discogs.com/image/A-11770-1280605617.jpeg", "type": "secondary", "uri150": "http://api.discogs.com/image/A-150-11770-1280605617.jpeg"}, {"uri": "http://api.discogs.com/image/A-11770-1280605608.jpeg", "height": 442, "width": 547, "resource_url": "http://api.discogs.com/image/A-11770-1280605608.jpeg", "type": "secondary", "uri150": "http://api.discogs.com/image/A-150-11770-1280605608.jpeg"}, {"uri": "http://api.discogs.com/image/A-11770-1280605593.jpeg", "height": 376, "width": 550, "resource_url": "http://api.discogs.com/image/A-11770-1280605593.jpeg", "type": "secondary", "uri150": "http://api.discogs.com/image/A-150-11770-1280605593.jpeg"}, {"uri": "http://api.discogs.com/image/A-11770-1280605584.jpeg", "height": 450, "width": 535, "resource_url": "http://api.discogs.com/image/A-11770-1280605584.jpeg", "type": "secondary", "uri150": "http://api.discogs.com/image/A-150-11770-1280605584.jpeg"}, {"uri": "http://api.discogs.com/image/A-11770-1280605576.jpeg", "height": 600, "width": 596, "resource_url": "http://api.discogs.com/image/A-11770-1280605576.jpeg", "type": "secondary", "uri150": "http://api.discogs.com/image/A-150-11770-1280605576.jpeg"}, {"uri": "http://api.discogs.com/image/A-11770-1359749271-9545.jpeg", "height": 419, "width": 600, "resource_url": "http://api.discogs.com/image/A-11770-1359749271-9545.jpeg", "type": "secondary", "uri150": "http://api.discogs.com/image/A-150-11770-1359749271-9545.jpeg"}, {"uri": "http://api.discogs.com/image/A-11770-1359749312-8726.jpeg", "height": 600, "width": 522, "resource_url": "http://api.discogs.com/image/A-11770-1359749312-8726.jpeg", "type": "secondary", "uri150": "http://api.discogs.com/image/A-150-11770-1359749312-8726.jpeg"}, {"uri": "http://api.discogs.com/image/A-11770-1359749348-6034.jpeg", "height": 409, "width": 600, "resource_url": "http://api.discogs.com/image/A-11770-1359749348-6034.jpeg", "type": "secondary", "uri150": "http://api.discogs.com/image/A-150-11770-1359749348-6034.jpeg"}, {"uri": "http://api.discogs.com/image/A-11770-1359749374-4202.jpeg", "height": 406, "width": 600, "resource_url": "http://api.discogs.com/image/A-11770-1359749374-4202.jpeg", "type": "secondary", "uri150": "http://api.discogs.com/image/A-150-11770-1359749374-4202.jpeg"}, {"uri": "http://api.discogs.com/image/A-11770-1359749410-6671.jpeg", "height": 600, "width": 446, "resource_url": "http://api.discogs.com/image/A-11770-1359749410-6671.jpeg", "type": "secondary", "uri150": "http://api.discogs.com/image/A-150-11770-1359749410-6671.jpeg"}], "resource_url": "http://api.discogs.com/artists/11770", "id": 11770, "data_quality": "Needs Vote", "namevariations": ["Megadeath"]}
      JSON
      JSON.parse(src)
    end
    let(:artist) { Discogs2::Resources::Artist.from_hash(src_hash)}
    ["profile", "releases_url", "name", "uri", "resource_url", "id", "data_quality"].each do |string_attr|
      it "sets the #{string_attr}" do 
        expect(artist.send(string_attr.to_sym)).to eq(src_hash[string_attr]) 
      end
    end
    it "sets the urls" do
      expect(artist.urls).to eq([
        "http://www.megadeth.com",
        "http://www.myspace.com/megadeth",
        "http://www.themegadethvinylarchives.com",
        "http://en.wikipedia.org/wiki/Megadeth",
        "https://www.facebook.com/Megadeth",
        "http://www.last.fm/music/megadeth",
        "http://www.twitter.com/megadeth"
      ])
    end
    it "sets the name variations" do
      expect(artist.namevariations).to eq(["Megadeath"])
    end

    it "creates Artist resources for members if provided" do
      member = artist.members.first
      expect(member.name).to eq("Al Pitrelli")
      expect(member.resource_url).to eq("http://api.discogs.com/artists/271505")
      expect(member.id).to eq(271505)
      expect(member.active).to be_false
    end
    it "creates exactly as many artists as there were members" do
      expect(artist.members.size).to eq(19)
    end
    it "does not create members otherwise" do
      member = artist.members.first
      expect(member.members).to be_nil
    end

    it "creates Image resources for members if provided" do
      image = artist.images.first
      expect(image.uri).to eq("http://api.discogs.com/image/A-11770-1371177621-1567.jpeg")
      expect(image.height).to eq(344)
      expect(image.width).to eq(573)
      expect(image.resource_url).to eq("http://api.discogs.com/image/A-11770-1371177621-1567.jpeg")
      expect(image.type).to eq("primary")
      expect(image.uri150).to eq("http://api.discogs.com/image/A-150-11770-1371177621-1567.jpeg")
    end

    it "creates exactly as many images as there were images in the JSON string" do
      expect(artist.images.size).to eq(13)
    end
    it "does not create images if there were none in the src JSON" do
      expect(artist.members.first.images).to be_nil
    end
  end
end