require 'spec_helper'

describe Discogs2::Wrapper do
  let(:wrapper) { Discogs2::Wrapper.new("Discogs2 gem: test") }

  def release
    @cached_master_release ||= wrapper.get_master_release(32937)
  end
  
  describe "#get_master_release", :vcr => {:re_record_interval => 7200} do
    
    it "returns the MasterRelease object" do
      expect(release).to be_a(Discogs2::Resources::MasterRelease)
    end    
    {
      "companies" => nil,
       "country" => nil,
       "data_quality" => "Correct",
       "estimated_weight" => nil,
       "format_quantity" => nil,
       "genres" => ["Rock"],
       "id" => 32937,
       "identifiers" => nil,
       "master_id" => nil,
       "master_url" => nil,
       "notes" => nil,
       "released" => nil,
       "released_formatted" => nil,
       "resource_url" => "http://api.discogs.com/masters/32937",
       "status" => nil,
       "styles" => ["Thrash"],
       "title" => "Rust In Peace",
       "uri" => "http://www.discogs.com/Megadeth-Rust-In-Peace/master/32937",
       "year" => 1990

    }.each_pair do |key, value|
      it "sets the attribute #{key} correctly" do
        expect(release.send(key.to_sym)).to eq(value)
      end
    end    

    it "initializes the artists as an array" do
      expect(release.artists).to be_a(Array)
    end
    it "populates the artists collection with the correct number of artists" do
      expect(release.artists.size).to eq(1)
    end
    it "populates the artist data correctly" do
      artist = release.artists.first
      expect(artist.active).to be_nil
      expect(artist.data_quality).to be_nil
      expect(artist.id).to eq(11770)
      expect(artist.name).to eq("Megadeth")
      expect(artist.namevariations).to be_nil
      expect(artist.profile).to be_nil
      expect(artist.releases_url).to be_nil
      expect(artist.uri).to be_nil
      expect(artist.urls).to be_nil
      expect(artist.resource_url).to eq("http://api.discogs.com/artists/11770")
    end

    it "initializes the videos as an array" do
      expect(release.videos).to be_a(Array)
    end
    it "populates the videos collection with the correct number of videos" do
      expect(release.videos.size).to eq(4)
    end
    it "populates the video data correctly" do
      video = release.videos.first
      expect(video.description).to eq("Megadeth - Rust In Peace... Polaris [Rust In Peace Live]")
      expect(video.duration).to eq(357)
      expect(video.embed).to eq(true)
      expect(video.title).to eq("Megadeth - Rust In Peace... Polaris [Rust In Peace Live]")
      expect(video.uri).to eq("http://www.youtube.com/watch?v=70eQZCdcPFY")
    end

    it "initializes the images as an array" do
      expect(release.images).to be_a(Array)
    end
    it "populates the images collection with the correct number of images" do
      expect(release.images.size).to eq(1)
    end
    it "populates the image data correctly" do
      image = release.images.first
      expect(image.height).to eq(599)
      expect(image.resource_url).to eq("http://api.discogs.com/image/R-3262407-1322894355.jpeg")
      expect(image.type).to eq("secondary")
      expect(image.uri).to eq("http://api.discogs.com/image/R-3262407-1322894355.jpeg")
      expect(image.uri150).to eq("http://api.discogs.com/image/R-150-3262407-1322894355.jpeg")
      expect(image.width).to eq(594)
    end

    it "initializes the tracklist as an array" do
      expect(release.tracklist).to be_a(Array)
    end
    it "populates the tracklist collection with the correct number of tracklist" do
      expect(release.tracklist.size).to eq(9)
    end
    it "populates the video data correctly" do
      track = release.tracklist[6]
      expect(track.duration).to eq("5:21")
      expect(track.position).to eq("B3")
      expect(track.title).to eq("Tornado Of Souls")
      expect(track.type_).to eq("track")
    end

  end


end