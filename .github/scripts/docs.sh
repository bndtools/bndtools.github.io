#!/usr/bin/env bash
ruby --version
gem --version
bundle --version

bundle exec jekyll build

# create search index under _site/pagefind
./pagefind --verbose --site _site
