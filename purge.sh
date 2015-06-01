#!/bin/sh
MODULE=$1
git submodule deinit $MODULE
git rm -rf $MODULE
rm -rf .git/modules/$MODULE
gsed -i "/$MODULE/,+2 d" .gitmodules
