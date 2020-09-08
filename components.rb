#define method for first part

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

puts data_photos[0]["img_src"]
puts data_photos[1]["img_src"]
puts data_photos[2]["img_src"]
puts data_photos[3]["img_src"]
puts data_photos[4]["img_src"]
puts data_photos[5]["img_src"]

#define method for building web

def head
    "<!DOCTYPE html>
    <html lang='en'>
        <head>
            <meta charset='UTF-8'>
            <meta name='viewport' content='width=device-width, initial-scale=1.0'>
            <title>Document</title>
            <!--CSS de Bootstrap 4-->
            <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css' integrity='sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk' crossorigin='anonymous'>
            <!--Font Awesome-->
            <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.13.1/css/all.css' integrity='sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q' crossorigin='anonymous'>
            <!--Mi Estilo-->
            <link rel='stylesheet' href='./assets/css/style.css'>
        </head>
        <body>"
end


#adding logic to the web
#create a list for imgs

def build_web_page( data_photos )
    i = 1
    html = ""
    ul = ""

    while ( i < data_photos )
        i += 1
        ul = "<ul>#{html}</ul>"
        html += "\n\t<li> #{} </li>\n"
    end

end


#foot
def foot
    "<!--JQuery-->
    <script src='https://code.jquery.com/jquery-3.5.1.min.js' integrity='sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=' crossorigin='anonymous'></script>
    <!--PopperJS-->
    <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js' integrity='sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo' crossorigin='anonymous'></script>
    <!--BootstrapJS-->
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js' integrity='sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI' crossorigin='anonymous'></script>
</body>
</html>"
end

#conecting everything adding file

index = head() + build_web_page + foot()

File.write('./index.html', index)









