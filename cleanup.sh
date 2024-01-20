#!/usr/bin/env bash

dangling_imgs=($(docker images -qa --filter 'dangling=true'))

if [[ 0 -ne "${#dangling_imgs[@]}" ]]; then
  docker rmi "${dangling_imgs[@]}"
else
  echo no dangling images to clean up
fi
