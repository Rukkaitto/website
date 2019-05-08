#!/bin/bash

photos=$(ls photos/*.jpg)

echo "<html>
	<head>
		<title>Gallery</title>
        <meta charset=\"UTF-8\">
        <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
        <style>
            @import url('https://fonts.googleapis.com/css?family=Work+Sans');
        </style>
	</head>

	<body>
    <a href=\"index.html\"><h1>Lucas Goudin</h1></a>
		<img src=\"portrait cropped web.png\" class=\"profile_pic\" height=70px>
		<nav class=\"navbar\">
			<ul>
				<li><a href=\"gallery.html\"><u>Gallery</u></a></li>
				<li><a href=\"cv.html\">CV</a></li>
				<li><a href=\"https://github.com/Rukkaitto\" target=\"_blank\">Github</a></li>
				<li><a href=\"contact.html\">Contact</a></li>
			</ul>
		</nav>
    <div class=\"gallery\">" > gallery.html

for photo in $photos
do
    photo_base=$(basename $photo)
    thumb_name="${photo_base%.*}_thumbnail.jpg"
    if [ ! -f photos/thumbnails/$thumb_name ]; then
        echo "converting $photo to thumbnail..."
        convert $photo -resize 256x256 photos/thumbnails/$thumb_name
    fi
    
    echo "<a target=\"_blank\" href=\"$photo\"><img class=\"photo\" src=\"photos/thumbnails/$thumb_name\"></a>" >> gallery.html
done

echo "</div>
<footer>
			&copy; 2019 lucasgoudin.com
		</footer>
	</body>
</html>" >> gallery.html