require 'spec_helper'

describe Discogs2::RequestMethods do
  let(:test_class) {
    Class.new do
      include Discogs2::RequestMethods

      def api_host
        'http://api.discogs.com'
      end
    end
  }
  let(:test_instance) { test_class.new }
  describe "#sanitize_path" do
    it "replaces spaces with + in all the parts given and returns the joined string" do
      expect(test_instance.sanitize_path("param", "some value", "one more space")).to eq("paramsome+valueone+more+space")
    end
    it "joins the arguments into a string with no replacement otherwise" do
      expect(test_instance.sanitize_path("no", "replacements", "here")).to eq("noreplacementshere")
    end
  end
  describe "#build_uri" do
    it "builds a fully qualified url with parameters" do
      expect(test_instance.build_uri("/path/to/resource", "param" => "value", "param2" => "value2").to_s).to eq("http://api.discogs.com/path/to/resource?param2=value2&param=value")
    end
    #not sure about this. should have been either a + or an encoded space %20.
    xit "encodes spaces in params properly" do
      expect(test_instance.build_uri("/path/to/resource", "param" => "value", "param2" => "value with spaces").to_s).to eq("http://api.discogs.com/path/to/resource?param2=value%2520with%2520spaces&param=value")
    end
  end

  describe "#query_api" do
    it "raises "
  end

end