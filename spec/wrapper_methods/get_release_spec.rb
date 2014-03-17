require 'spec_helper'

describe Discogs2::Wrapper do
  let(:wrapper) { Discogs2::Wrapper.new("Discogs2 gem: test") }

  describe "#get_release", :vcr => {:re_record_interval => 3600} do
    let(:release) { wrapper.get_release(584068) }
    
    it "returns the Release object" do
      expect(release).to be_a(Discogs2::Resources::Release)
    end
    {
      "id" => 584068,
       "title" => "Octopus",
       "resource_url" => "http://api.discogs.com/releases/584068",
       "uri" => "http://www.discogs.com/Gentle-Giant-Octopus/release/584068",
       "status" => "Accepted",
       "data_quality" => "Needs Vote",
       "master_id" => 15513,
       "master_url" => "http://api.discogs.com/masters/15513",
       "country" => "UK",
       "year" => 1972,
       "released" => "1972-12-00",
       "released_formatted" => "Dec 1972",
       "notes" => "Released in a fold-out cover, with company inner sleeve and a “swirl” Vertigo label.\r\n\r\nThis LP was released in 1973 in USA with an alternate cover.",
       "styles" => ["Prog Rock"],
       "genres" => ["Rock"],
       "estimated_weight" => 230,
       "format_quantity" => 1
    }.each_pair do |key, value|
      it "sets the attribute #{key} correctly" do
        expect(release.send(key.to_sym)).to eq(value)
      end
    end

    it "initializes the community as a Resource::Community object" do
      expect(release.community).to be_a(Discogs2::Resources::Community)
    end
    it "sets the community data correctly" do
      community = release.community
      expect(community.have).to eq(122)
      expect(community.want).to eq(148)
      expect(community.rating.count).to eq(31)
      expect(community.rating.average).to eq(4.45)
    end

    it "initializes the formats as an array" do
      expect(release.formats).to be_a(Array)
    end
    it "populates the formats collection with the correct number of formats" do
      expect(release.formats.size).to eq(1)
    end
    it "populates the format data correctly" do
      format = release.formats.first
      expect(format.descriptions).to eq(["LP", "Album"])
      expect(format.name).to eq("Vinyl")
      expect(format.qty).to eq("1")
    end

    it "initializes the images as an array" do
      expect(release.images).to be_a(Array)
    end
    it "populates the images collection with the correct number of images" do
      expect(release.images.size).to eq(4)
    end
    it "populates the image data correctly" do
      image = release.images.first
      expect(image.height).to eq(450)
      expect(image.width).to eq(450)
      expect(image.type).to eq("primary")
      expect(image.uri).to eq("http://api.discogs.com/image/R-584068-1275050106.jpeg")
      expect(image.uri150).to eq("http://api.discogs.com/image/R-150-584068-1275050106.jpeg")
      expect(image.resource_url).to eq("http://api.discogs.com/image/R-584068-1275050106.jpeg")
    end

    it "initializes the labels as an array" do
      expect(release.labels).to be_a(Array)
    end
    it "populates the labels collection with the correct number of labels" do
      expect(release.labels.size).to eq(1)
    end
    it "populates the image data correctly" do
      label = release.labels.first
      expect(label.catno).to eq("6360 080")
      expect(label.entity_type).to eq("1")
      expect(label.entity_type_name).to be_nil
      expect(label.id).to eq(2266)
      expect(label.name).to eq("Vertigo")
      expect(label.resource_url).to eq("http://api.discogs.com/labels/2266")
    end
    
    it "initializes the tracklist as an array" do
      expect(release.tracklist).to be_a(Array)
    end
    it "populates the tracklist collection with the correct number of tracklist" do
      expect(release.tracklist.size).to eq(8)
    end
    it "populates the tracklist data correctly" do
      track = release.tracklist[1]
      expect(track.duration).to eq("")
      expect(track.position).to eq("A2")
      expect(track.title).to eq("Raconteur, Troubadour")
      expect(track.type_).to eq("track")
    end

    it "initializes the extraartists as an array" do
      expect(release.extraartists).to be_a(Array)
    end
    it "populates the extraartists collection with the correct number of extraartists" do
      expect(release.extraartists.size).to eq(13)
    end
    it "populates the extraartists data correctly" do
      eartist = release.extraartists.last
      expect(eartist.anv).to eq("")
      expect(eartist.join).to eq("")
      expect(eartist.role).to eq("Saxophone, Trumpet, Mellophone, Lead Vocals, Backing Vocals")
      expect(eartist.tracks).to eq("")
    end

    it "initializes the videos as an array" do
      expect(release.videos).to be_a(Array)
    end
    it "populates the videos collection with the correct number of videos" do
      expect(release.videos.size).to eq(6)
    end
    it "populates the videos data correctly" do
      video = release.videos.first
      expect(video.duration).to eq(282)
      expect(video.embed).to be_true
      expect(video.uri).to eq("http://www.youtube.com/watch?v=v3ozXQNsQYs")
      expect(video.title).to eq("The Advent of Panurge - Gentle Giant (1972)")
    end

  end

end