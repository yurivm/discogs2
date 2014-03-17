require 'spec_helper'

describe Discogs2::Wrapper do
  let(:wrapper) { Discogs2::Wrapper.new("Discogs2 gem: test") }

  describe "#get_label", :vcr => {:re_record_interval => 3600} do
    let(:label) { wrapper.get_label(654) }
    
    it "returns the Label object" do
      pp label
      expect(label).to be_a(Discogs2::Resources::Label)
    end    

    it "initializes the images collection as an array" do
      expect(label.images).to be_a(Array)
    end
    it "populates the images collection with the correct number of images" do
      expect(label.images.size).to eq(5)
    end
    it "sets the image data correctly" do
      image = label.images.last
      expect(image.height).to eq(327)
      expect(image.width).to eq(313)
      expect(image.resource_url).to eq("http://api.discogs.com/image/L-654-1264628288.jpeg")
      expect(image.uri).to eq("http://api.discogs.com/image/L-654-1264628288.jpeg")
      expect(image.uri150).to eq("http://api.discogs.com/image/L-150-654-1264628288.jpeg")
      expect(image.type).to eq("secondary")
    end

    it "sets the sublabels" do
      #TODO
      expect(label.sublabels).to be_a(Array)
      expect(label.sublabels.count).to eq(48) #zomg you've been productive (c)
    end
  end

end