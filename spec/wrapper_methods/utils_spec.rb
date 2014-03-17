require 'spec_helper'

describe Discogs2::Utils do
  describe "#escape_json_newlines" do
    it 'prepends an extra slash to \r and \n' do
      expect(Discogs2::Utils.escape_json_newlines("testing\r\n stuff \n\r")).to eq("testing\\r\\n stuff \\n\\r")
    end
    it 'leaves the string untouched if there were no \r \n symbols there' do
      expect(Discogs2::Utils.escape_json_newlines("all too easy")).to eq("all too easy")
    end
  end
end