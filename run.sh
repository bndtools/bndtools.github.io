#!/bin/bash
set -ev

export BUNDLE_GEMFILE=$PWD/Gemfile
bundle install --jobs=3 --retry=3 --path=vendor
bundle exec jekyll clean
bundle exec jekyll serve -w --incremental 

