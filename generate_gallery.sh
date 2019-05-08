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
    echo "<a target=\"_blank\" href=\"$photo\"><img class=\"photo\" src=\"$photo\"></a>" >> gallery.html
done

echo "</div>
<footer>
			&copy; 2019 lucasgoudin.com
		</footer>
	</body>
</html>" >> gallery.html