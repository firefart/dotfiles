#!/bin/bash

set -eu -o pipefail

git submodule update --init --recursive

./install -p ./dotbot-git/git.py --plugin-dir dotbot-ifarch -x
