get '/search' do
  RSpotify.authenticate(ENV["SPOTIFY_TOKEN"],ENV["SPOTIFY_SECRET_KEY"])
  @artists = RSpotify::Artist.search('Arctic Monkeys')
  @albums = RSpotify::Album.search('The Wall')
  @tracks = RSpotify::Track.search('Thriller')
  @top_tracks_names = SpotifyAPI.get_top_tracks_names(params[:search_input])
  #   spotify_results = RSpotify::Artist.search(search_term)
  #   # assumes top artist in artist search is desired artist
  #   spotify_results[0].top_tracks(:US).map(&:name)

  erb :show
end

# post '/search' do

# end
