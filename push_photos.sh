#!/bin/bash

local_photos=$(ls photos/ | sed '/^thumbnails$/d')
server_photos=$(curl -s -l ftp://69.10.39.19/public_html/photos/ --user lucasgou:Dpf5XzHc | sed 's/ /\n/g;/^..$/d;/^.$/d;/^thumbnails$/d')
local_thumbs=$(ls photos/thumbnails/)
server_thumbs=$(curl -s -l ftp://69.10.39.19/public_html/photos/thumbnails/ --user lucasgou:Dpf5XzHc | sed 's/ /\n/g;/^..$/d;/^.$/d')

photos_to_push=""
thumbs_to_push=""

for photo in $local_photos
do
    if [[ ! $(echo "$server_photos" | grep "$photo") ]]; then
        photos_to_push="$photos_to_push photos/$photo"
    fi
done

for thumb in $local_thumbs
do
    if [[ ! $(echo "$server_thumbs" | grep "$thumb") ]]; then
        thumbs_to_push="$thumbs_to_push photos/thumbnails/$thumb"
    fi
done


echo "ftp-upload -v -h 69.10.39.19 --user lucasgou --password Dpf5XzHc -d public_html/photos ${photos_to_push:1} -d thumbnails/ ${thumbs_to_push:1}" | bash