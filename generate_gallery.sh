#!/bin/bash

photos=$(ls photos/*.jpg)

echo '<html>
	<head>
		<title>Gallery</title>
		<meta name="google-site-verification" content="s2kFiCPyvkHJSaF_XxCsofeoEWb9noKf2oGcs4FixK0" />
		<link rel="stylesheet" type="text/css" href="style.css">
		<script src="http://127.0.0.1:9001/js/socket.js"></script>
		<style>
      @import url("https://fonts.googleapis.com/css?family=Work+Sans");
    </style>
	</head>
	<body>
    <div class="global-header">
      <a href="index.html" class="name">
        <h1>Lucas Goudin</h1>
      </a>
      <img src="portrait cropped web.png" class="profile-pic" height=70px>
    </div>
		<div class="navbar">
  <div class="el-container">
    <div class="nav-element"><a href="gallery.html">Gallery</a></div>
  </div>
  <div class="el-container">
    <div class="nav-element"><a href="cv.html">CV</a></div>
  </div>
  <div class="el-container">
    <div class="nav-element"><a href="https://github.com/Rukkaitto" target="_blank">Github</a></div>
  </div>
  <div class="el-container">
    <div class="nav-element"><a href="contact.html">Contact</a></div>
  </div>
</div>
		<div class="gallery">' > gallery.html

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

echo '</div>
		<div class="footer">
			&copy; 2019 lucasgoudin.com
    </div>
	</body>
</html>' >> gallery.html