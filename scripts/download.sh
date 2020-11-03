#!/bin/bash

source scripts/utils.sh echo -n

# Saner programming env: these switches turn some bugs into errors
set -o errexit -o pipefail

# This script is meant to be used with the command 'datalad run'

wget -O README.txt "https://www.robots.ox.ac.uk/~vgg/data/dtd/download/README.txt"
files_url=(
	"https://www.robots.ox.ac.uk/~vgg/data/dtd/download/dtd-r1.0.1.tar.gz dtd-r1.0.1.tar.gz" \
	"https://www.robots.ox.ac.uk/~vgg/data/dtd/download/dtd-r1.0.1-labels.tar.gz dtd-r1.0.1-labels.tar.gz" \
	"https://www.robots.ox.ac.uk/~vgg/data/dtd/download/dtd-r1-decaf_feats.tar.gz dtd-r1-decaf_feats.tar.gz")

# These urls require login cookies to download the file
git-annex addurl --fast -c annex.largefiles=anything --raw --batch --with-files <<EOF
$(for file_url in "${files_url[@]}" ; do echo "${file_url}" ; done)
EOF
git-annex get --fast -J8
git-annex migrate --fast -c annex.largefiles=anything *

[[ -f md5sums ]] && md5sum -c md5sums
[[ -f md5sums ]] || md5sum $(git-annex list --fast | grep -o " .*") > md5sums
