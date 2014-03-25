module Discogs2
  class Wrapper
    API_HOST = 'http://api.discogs.com'

    attr_reader :user_agent

    def initialize(user_agent)
      @user_agent = user_agent
    end

    def get_artist(artist_id)
      response = query_api("/artists/#{artist_id}")
      escaped_response = ::Discogs2::Utils.escape_json_newlines(response)
      Resources::Artist.new(JSON.parse(escaped_response))
    end

    def get_release(release_id)
      response = query_api("/releases/#{release_id}")
      escaped_response = ::Discogs2::Utils.escape_json_newlines(response)
      Resources::Release.new(JSON.parse(escaped_response))
    end

    def get_master_release(release_id)
      response = query_api("/masters/#{release_id}")
      escaped_response = ::Discogs2::Utils.escape_json_newlines(response)
      Resources::MasterRelease.new(JSON.parse(escaped_response))
    end

    def get_label(label_id)
      response = query_api("/labels/#{label_id}")
      escaped_response = ::Discogs2::Utils.escape_json_newlines(response)
      Resources::Label.new(JSON.parse(escaped_response))
    end

    def search(query, opt_params = {})
      params = { q: query, page: 1}.merge(opt_params)
      response = query_api("/database/search", params)
      escaped_response = ::Discogs2::Utils.escape_json_newlines(response)
      Resources::SearchCollection.new(self, JSON.parse(escaped_response))
    end

    private

    def api_host
      self.class::API_HOST
    end

    include RequestMethods

  end
end