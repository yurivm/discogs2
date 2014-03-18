require 'spec_helper'

describe Discogs2::Wrapper do
  let(:wrapper) { Discogs2::Wrapper.new("Discogs2 gem: test") }

  describe "#get_master_release", :vcr => {:re_record_interval => 7200} do
    let(:release) { wrapper.get_master_release(32937) }
    
    it "returns the MasterRelease object" do
      expect(release).to be_a(Discogs2::Resources::MasterRelease)
    end    
  end

end