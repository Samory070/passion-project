require 'rspotify'

get '/search' do
  # authenticate
  # @artists = RSpotify::Artist.search('Arctic Monkeys')
  # @albums = RSpotify::Album.search('The Wall')
  # @tracks = RSpotify::Track.search('Thriller')
  # @top_tracks_names = SpotifyAPI.get_top_tracks_names(params[:search_input])
  #   spotify_results = RSpotify::Artist.search(search_term)
  #   # assumes top artist in artist search is desired artist
  #   spotify_results[0].top_tracks(:US).map(&:name)

  erb :'spotify/show'
end

post '/search' do
  require 'uri'
  require 'net/http'

  url = URI("https://api.spotify.com/v1/search?q=#{params[:search_input]}&type=#{params[:type]}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["content-type"] = 'application/json'
  request["authorization"] = 'Bearer BQASRoQFqmsMTj4Zi3HzM1YHxnZ1FqE8Zw80gg8Wnzhm1s_8KYwJmW5VK_AN5Jp_nX9fc2Vvq3CoDUH48bw8gHfu0uCikhF17TU3BZsxxn_Jg_-PiWA9SU-q5CajuGlCK-Aml25UgVXnkJ4'
  request["cache-control"] = 'no-cache'
  request["postman-token"] = 'c360a89f-e929-154e-6219-63eac234ce76'

  response = http.request(request)
  # binding.pry
  @res_body = response.read_body.to_s
  erb :"spotify/results"

end
