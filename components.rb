require "uri"
require "net/http"
require "json"

url = URI("https://api.nasa.gov/planetary/apod?api_key=BRCj48Dlp7DbgVIWzYkRLp1zu60qKE92kfxDH4ec")
api_key = 'BRCj48Dlp7DbgVIWzYkRLp1zu60qKE92kfxDH4ec'

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
data = response.read_body
data_api = JSON.parse(data)

puts data_api.class