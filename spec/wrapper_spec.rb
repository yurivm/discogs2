require 'spec_helper'

describe Discogs2::Wrapper do
  it "stores the API host" do
    expect(Discogs2::Wrapper::API_HOST).to eq("http://api.discogs.com")
  end
end