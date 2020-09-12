
require "uri"
require "net/http"
require "json"
require "openssl"

def request( url, api_key )

    url = URI( "#{url}&api_key=#{api_key}" )
    https = Net::HTTP.new( url.host, url.port );
    request = Net::HTTP::Get.new( url )
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_PEER
    response = https.request( request )
    data_api = JSON.parse( response.read_body )

    data_photos = data_api[ "photos" ]
    data_imgs = []
    # data_name = []
    data_photos.each do | iter |
        iter.each do | key, value |
            data_imgs.push( value ) if ( key == "img_src" )
            # data_name.push ( value["name"] ) if key == "camera"
        end
    end
    # return data_name    
    return data_imgs
    
end

params_request = request( "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000", "BRCj48Dlp7DbgVIWzYkRLp1zu60qKE92kfxDH4ec" )

# data_name = []
# params_request["photos"].each do | iter |
#     iter.each do | key, value |
#         data_name.push ( value["name"] ) if key == "camera"
#     end
# end

# puts data_name


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









