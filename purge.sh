#!/bin/sh
MODULE=$1
git submodule deinit bundle/$MODULE
git rm -rf bundle/$MODULE
rm -rf .git/modules/bundle/$MODULE
gsed -i "/$MODULE/,+2 d" .gitmodules
