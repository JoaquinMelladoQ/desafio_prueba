
require "uri"
require "net/http"
require "json"


def request( url, api_key )

    url = URI( "#{ url }&api_key=#{ api_key }" )

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    data = response.read_body
    data_api = JSON.parse(data)

    data_photos = data_api[ "photos" ]
    
    data_imgs = []
    
    data_photos.each do | iter |
        iter.each do | key, value |
            data_imgs.push( value ) if ( key == "img_src" )
        end
    end
    return data_imgs    
    
end

params_request = request( "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000", "BRCj48Dlp7DbgVIWzYkRLp1zu60qKE92kfxDH4ec" )


def build_web_page( data_imgs )

    first_part = "<html>\n  <head>\n  </head>\n <body>\n"
    middle = "    <ul>"
    last_part = "    </ul>\n</body>\n</html>"

    data_imgs.each do | value |
        middle += "\n       <li><img src=\"#{ value }\"></img></li>\n"
    end
    return ( first_part + middle + last_part )
end

index = build_web_page( params_request )


File.write( './index.html', index )









