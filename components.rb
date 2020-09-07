
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

def build_web_page( param )
    
    i = 1
    html = ""
    ul = ""

    while (i < data)
        i += 1
        ul = "<ul>#{html}</ul>"
        html += "\n\t<li> #{i - 1} </li>\n"

    end

    puts "#{ul}"
end

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