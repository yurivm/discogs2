require 'spec_helper'

describe Discogs2::Wrapper do
  let(:wrapper) { Discogs2::Wrapper.new("Discogs2 gem: test") }
  it "stores the API host" do
    expect(Discogs2::Wrapper::API_HOST).to eq("http://api.discogs.com")
  end
  describe "#initialize" do
    it "sets the user agent" do
      w = Discogs2::Wrapper.new("All your releases are belong to us")
      expect(w.user_agent).to eq("All your releases are belong to us")
    end
  end

end