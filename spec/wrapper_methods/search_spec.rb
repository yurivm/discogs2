require 'spec_helper'

describe Discogs2::Wrapper do
  let(:wrapper) { Discogs2::Wrapper.new("Discogs2 gem: test") }
  let(:search_result) { wrapper.search("Jethro Tull") }
  
  describe "#search", :vcr do
    it "returns a search collection" do
      expect(search_result).to be_a(Discogs2::Resources::SearchCollection)
    end
    it "provides pagination methods" do
      expect(search_result.per_page).to eq(50)
      expect(search_result.items).to be > 1000
      expect(search_result.current_page).to eq(1)
      expect(search_result.total_pages).to be > 1000 #this keeps growing.
    end
    it "provides the next/last urls" do
      expect(search_result.next_url).to eq("http://api.discogs.com/database/search?q=Jethro%2520Tull&per_page=50&page=2")
      last_u = URI.parse(search_result.last_url)
      expect(last_u).to be_a(URI::HTTP)
      expect(last_u.host).to eq("api.discogs.com")
    end
    it "provides results as an array" do
      expect(search_result.results).to be_a(Array)
    end
    it "intializes the results with the correct number of results" do
      expect(search_result.results.size).to eq(50)
    end
    it "sets the search result data correctly" do
      result = search_result.results.first
      expect(result).to be_a(Discogs2::Resources::SearchResult)
      expect(result.barcode).to eq(["JETHRO TULL   A  S 18   94", "JETHRO TULL   A  S 18   94"])
      expect(result.catno).to eq("Jethro Tull")
      expect(result.country).to eq("Bulgaria")
      expect(result.format).to eq(["Vinyl", "Album", "LP"])
      expect(result.genre).to eq(["Rock"])
      expect(result.id).to eq(4613649)
      expect(result.label).to eq(["Балкантон", "Chrysalis"])
      expect(result.resource_url).to eq("http://api.discogs.com/releases/4613649")
      expect(result.style).to eq(["Classic Rock"])
      expect(result.thumb).to eq("http://api.discogs.com/image/R-90-4613649-1369947471-1427.jpeg")
      expect(result.title).to eq("Jethro Tull - Aqualung")
      expect(result.type).to eq("release")
      expect(result.uri).to eq("/Jethro-Tull-Aqualung/release/4613649")
      expect(result.year).to eq(nil)
    end
  end

  describe "#next_page", :vcr do
    it "fetches the next page of results" do
      expect(search_result.next_page).to be_a(Discogs2::Resources::SearchCollection)
    end
    it "raises an exception if the last page is reached" do
      last_result = search_result.last_page
      expect { last_result.next_page }.to raise_error(RuntimeError)
    end
  end

  describe "#prev_page", :vcr do
    it "raises an exception if there is no prev page (you're at the first one)" do
      expect { search_result.prev_page }.to raise_error(RuntimeError)
    end
    it "fetches the previous page of results" do
      last_result = search_result.last_page
      expect(last_result.prev_page).to be_a(Discogs2::Resources::SearchCollection)
    end
  end
end