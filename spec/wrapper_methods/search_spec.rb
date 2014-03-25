require 'spec_helper'

describe Discogs2::Wrapper do
  let(:wrapper) { Discogs2::Wrapper.new("Discogs2 gem: test") }
  let(:search_result) { wrapper.search("Jethro Tull") }
  
  describe "#search", :vcr => {:re_record_interval => 7200} do
    it "returns a search collection" do
      expect(search_result).to be_a(Discogs2::Resources::SearchCollection)
    end
    it "provides pagination methods" do
      expect(search_result.per_page).to eq(50)
      expect(search_result.items).to eq(57719)
      expect(search_result.page).to eq(1)
    end
    it "provides the next/last urls" do
      expect(search_result.next_url).to eq("http://api.discogs.com/database/search?q=Jethro%2520Tull&per_page=50&page=2")
      expect(search_result.last_url).to eq("http://api.discogs.com/database/search?q=Jethro%2520Tull&per_page=50&page=1155")
    end
  end
end