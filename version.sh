#!/bin/zsh

flutter pub publish --dry-run
if [ $? -ne 0 ]
then
  echo "Dry run failed"
  exit 1
fi

if [ -z "$1" ]
then
  echo "No version code supplied"
  exit 2
fi

sed -i "" "s%version: .*%version $1%" -e pubspec.yaml

git tag -a V$1 -m "Version $1"
flutter pub publish --dry-run
