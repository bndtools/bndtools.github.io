#!/bin/bash
set -ev

# Build into _site folder
export BUNDLE_GEMFILE=$PWD/Gemfile
bundle install --jobs=3 --retry=3 --path=vendor
bundle exec jekyll clean
bundle exec jekyll build

# Run and serve the _site folder with search working
# install Linux x86_64
curl -L https://github.com/CloudCannon/pagefind/releases/download/v1.3.0/pagefind-v1.3.0-x86_64-unknown-linux-musl.tar.gz -o pagefind.tar.gz
tar xzf pagefind.tar.gz
chmod +x pagefind
./pagefind --site _site --serve