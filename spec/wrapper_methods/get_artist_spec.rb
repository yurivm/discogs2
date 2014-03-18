require 'spec_helper'

describe Discogs2::Wrapper do
  let(:wrapper) { Discogs2::Wrapper.new("Discogs2 gem: test") }

  describe "#get_artist", :vcr => {:re_record_interval => 7200} do
    let(:artist) { wrapper.get_artist(240248) }
    
    it "returns the Artist object" do
      expect(artist).to be_a(Discogs2::Resources::Artist)
    end
    
    {
      "profile" => "Gentle Giant were a British progressive rock band, one of the most experimental of the 1970s. Textually inspired by philosophy, personal events and the works of François Rabelais, the group's compositional purpose was to \"expand the frontiers of contemporary popular music at the risk of becoming very unpopular.",
      "releases_url" => "http://api.discogs.com/artists/240248/releases",
      "name" => "Gentle Giant",
      "uri" => "http://www.discogs.com/artist/240248-Gentle-Giant",
      "resource_url" => "http://api.discogs.com/artists/240248",
      "id" => 240248,
      "data_quality" => "Correct",
      "namevariations" => ["G.G."],
      "urls" => ["http://www.blazemonger.com/GG/", "http://en.wikipedia.org/wiki/Gentle_Giant"]
    }.each_pair do |key, value|
      it "sets the attribute #{key} correctly" do
        expect(artist.send(key.to_sym)).to eq(value)
      end
    end

    it "initializes the members collection as an array" do
      expect(artist.members).to be_a(Array)
    end
    it "populates the members collection with the correct number of artists" do
      expect(artist.members.size).to eq(8)
    end
    it "sets the member data correctly" do
      member = artist.members.first
      expect(member.name).to eq("Derek Shulman")
      expect(member.resource_url).to eq("http://api.discogs.com/artists/342789")
      expect(member.id).to eq(342789)
      expect(member.active).to be_true      
    end

    it "initializes the images collection as an array" do
      expect(artist.images).to be_a(Array)
    end
    it "populates the images collection with the correct number of images" do
      expect(artist.images.size).to eq(4)
    end
    it "sets the image data correctly" do
      image = artist.images.last
      expect(image.height).to eq(397)
      expect(image.width).to eq(600)
      expect(image.resource_url).to eq("http://api.discogs.com/image/A-240248-1303818003.jpeg")
      expect(image.uri).to eq("http://api.discogs.com/image/A-240248-1303818003.jpeg")
      expect(image.uri150).to eq("http://api.discogs.com/image/A-150-240248-1303818003.jpeg")
      expect(image.type).to eq("secondary")
    end
  end

end