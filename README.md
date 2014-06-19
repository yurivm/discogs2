# Discogs2

Discogs2 is a yet another Ruby wrapper for the [Discogs API v2.0](http://www.discogs.com/developers/). 

I built it as an exercise and also because at that time the discogs gem used XML that was missing some of the information that I needed.
Currently the original discogs gem uses JSON too :)

For now, Discogs2 supports only the public parts of the Discogs API. Accessing oauth-protected resources is in progress.

## Installation

Add this line to your application's Gemfile:

    gem 'discogs2'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install discogs2

## Usage
Using discogs2 is very similar to discogs.

Create a wrapper using your application name:
  
    require 'discogs2'
    wrapper = Discogs::Wrapper.new("My awesome web app")

Get information:

    artist = wrapper.get_artist(240248)  
    master_release = wrapper.get_master_release(32937)
    release = wrapper.get_release(584068)
    search = wrapper.search("Jethro Tull")

    artist.name                             # => "Gentle Giant"
    artist.members.count                    # => 8
    artist.members.first.name               # => "Derek Shulman"

    release.title                           # => "Octopus"
    release.community.have                  # => 136
    release.community.want                  # => 168
    release.community.rating                # #<OpenStruct count=36, average=4.44>

    master_release.title                    # "Rust In Peace"
    master_release.images.first.uri         # "http://api.discogs.com/image/R-3262407-1322894355.jpeg"

    search.items                            # 60717
    search.results.first.format             # ["Vinyl", "Album", "LP"]
    search.results.first.title              # "Jethro Tull - Aqualung"
    search_results.next_page                # #<Discogs2::Resources::SearchCollection...>


## Contributing

1. Fork it ( http://github.com/<my-github-username>/discogs2/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
