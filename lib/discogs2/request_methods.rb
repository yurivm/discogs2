require 'uri'
require 'net/http'
require 'zlib'
require 'stringio'

module Discogs2
  # mostly taken from the original discogs that handles request/response efficiently.
  module RequestMethods
    
    # Queries the API and handles the response.
    def query_api(path, params = {}, skip_building_url = false)
      response = perform_request(path, params, skip_building_url)

      raise "Unknown resource #{path}" if response.code == "404"
      raise "Internal server error when querying #{path}" if response.code == "500"
      # Unzip the response data, or just read it in directly
      # if the API responds without gzipping.
      response_body = nil
      begin
          inflated_data = Zlib::GzipReader.new(StringIO.new(response.body))
          response_body = inflated_data.read
      rescue Zlib::GzipFile::Error
          response_body = response.body
      end
      response_body
    end

    def build_uri(path, params={})
      querystring = "?" + params.map { |key, value| "#{key}=#{value}" }.sort.join("&")

      URI.parse(File.join(api_host, URI.encode(sanitize_path(path, URI.escape(querystring)))))
    end    

    def sanitize_path(*path_parts)
      clean_path = path_parts.map { |part| part.gsub(/\s/, '+') }
      clean_path.join
    end
    
    def perform_request(path_or_uri, params={}, skip_building_url = false)
      uri = if skip_building_url
        URI.parse(path_or_uri)
      else
        build_uri(path_or_uri, params)
      end
      request = Net::HTTP::Get.new(uri.path + "?" + uri.query)
      request.add_field("Accept", "application/json")
      request.add_field("Accept-Encoding", "gzip,deflate")
      request.add_field("User-Agent", user_agent)

      Net::HTTP.new(uri.host).start do |http|
        http.request(request)
      end
    end    
  end
end