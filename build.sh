#!/bin/bash

JMXTRANS_VERSION="256"
IMAGE_TAG="pitrho/jmxtrans"

# Custom die function.
#
die() { echo >&2 -e "\nRUN ERROR: $@\n"; exit 1; }

# Parse the command line flags.
#
while getopts "v:t:" opt; do
  case $opt in
    t)
      IMAGE_TAG=${OPTARG}
      ;;

    v)
      JMXTRANS_VERSION=${OPTARG}
      ;;

    \?)
      die "Invalid option: -$OPTARG"
      ;;
  esac
done

# Crete the build directory
rm -rf build
mkdir build

cp run-jmxtrans.sh build/
cp logback.xml build/

# Copy docker file, and override the REDIS_VERSION string
sed 's/%%JMXTRANS_VERSION%%/'"$JMXTRANS_VERSION"'/g' Dockerfile.tmpl > build/Dockerfile

docker build -t="${IMAGE_TAG}" build/

rm -rf build
