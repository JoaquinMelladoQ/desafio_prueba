require "uri"
require "net/http"
require "json"

url = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=BRCj48Dlp7DbgVIWzYkRLp1zu60qKE92kfxDH4ec")
api_key = 'BRCj48Dlp7DbgVIWzYkRLp1zu60qKE92kfxDH4ec'

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
data = response.read_body
data_api = JSON.parse(data)

data_photos = data_api["photos"]

puts data_photos[1]["img_src"]