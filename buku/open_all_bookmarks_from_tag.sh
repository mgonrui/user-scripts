#!/bin/sh

# Define the tag you want to open bookmarks for
TAG=$1

# Use buku to print all bookmarks with the specified tag
echo $TAG
# buku --print --tag "$TAG" | while IFS= read -r URL; do
#     # Open each URL in the default web browser
#     # buku -o "$URL" 
#     echo "hello"
#     # echo $URL
# done
