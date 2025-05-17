#!/usr/bin/env bash
set -o errexit

bundle install
bin/rails assets:precompile
bin/rails assets:clean
# For free tier, keep migrations here:
bin/rails db:migrate
