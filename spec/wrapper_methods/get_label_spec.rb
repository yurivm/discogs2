require 'spec_helper'

describe Discogs2::Wrapper do
  let(:wrapper) { Discogs2::Wrapper.new("Discogs2 gem: test") }

  describe "#get_label", :vcr => {:re_record_interval => 7200} do
    let(:label) { wrapper.get_label(654) }
    
    it "returns the Label object" do
      expect(label).to be_a(Discogs2::Resources::Label)
    end    

    {
      "id" => 654,
      "catno"  => nil,
      "contact_info" => "1750 North Vine Street\r\nHollywood, CA  90028\r\nUSA\r\n\r\n150 5th Avenue\r\nNew York, NY 10011\r\nUSA\r\n\r\nE-mail: ContactUs@CapitolRecords.com\r\nPhone: (323) 462-6252\r\n",
      "data_quality" => "Needs Vote",
      "entity_type" => nil,
      "entity_type_name" => nil,
      "name" => "Capitol Records",
      "profile" => "[b]Please note, many Capitol Records issues also carry an EMI logo. This is not a label and EMI should not be added as a label, it instead indicates that Capitol was part of the EMI Group. For lps it appears mandatory to describe the label design, cause there very often different version are available.[/b]\r\n\r\nThe Capitol Records company was founded by the songwriters Johnny Mercer, Buddy DeSylva and record store owner Glenn Wallichs on April 9, 1942 in Hollywood, California. By 1946 Capitol had sold 42 million records and was established as one of the Big Six studios.\r\n\r\nIn 1955, the British record company EMI acquired Capitol Records for $8.5 million. In 1979, Capitol was made part of the EMI Music Worldwide division. In 2001, EMI merged Capitol Records label with the Priority Records label.\r\n\r\nIn September 2012 Capitol Records was purchased by Universal Music Group\r\n\r\nLabel Code: LC 0148 / LC 00148",
      "resource_url" => "http://api.discogs.com/labels/654",
      "releases_url" => "http://api.discogs.com/labels/654/releases",
      "urls" => [
         "http://www.capitolrecords.com",
         "http://www.hollywoodandvine.com",
         "http://www.friktech.com/btls/capitol/capitollabels.pdf",
         "http://en.wikipedia.org/wiki/Capitol_Records",
         "http://eighthavenue.com/capitol.htm"
      ],
      "data_quality" => "Needs Vote",
      "parent_label" => {
        "id" => 38404,
        "name" => "Universal Music Group",
        "resource_url" => "http://api.discogs.com/labels/38404"
      },
    }.each_pair do |key, value|
      it "sets the attribute #{key} correctly" do
        expect(label.send(key.to_sym)).to eq(value)
      end
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

    it "initializes sublabels as an array" do
      expect(label.sublabels).to be_a(Array)
    end
    it "populates the sublabels collection with the correct number of sublabels" do
      expect(label.sublabels.count).to eq(48) #zomg you've been productive (c)
    end
    it "sets the sublabel data correctly" do
      sublabel = label.sublabels.first
      expect(sublabel.id).to eq(173583)
      expect(sublabel.name).to eq("123")
      expect(sublabel.resource_url).to eq("http://api.discogs.com/labels/173583")
    end
  end

end