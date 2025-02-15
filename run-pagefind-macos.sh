#!/bin/bash
set -ev

# Build into _site folder
export BUNDLE_GEMFILE=$PWD/Gemfile
bundle install --jobs=3 --retry=3 --path=vendor
bundle exec jekyll clean
bundle exec jekyll build

# Run and serve the _site folder with search working
# install for MacOS aarch64
curl -L https://github.com/CloudCannon/pagefind/releases/download/v1.3.0/pagefind-v1.3.0-aarch64-apple-darwin.tar.gz -o pagefind.tar.gz
tar xzf pagefind.tar.gz
chmod +x pagefind
./pagefind --site _site --serve