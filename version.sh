#!/bin/zsh

# Check for version code
if [ -z "$1" ]
then
  echo "No version code supplied"
  exit 2
fi


# Update version in pubspec
sed -i "" -e "s%version: .*%version: $1%" pubspec.yaml

# Check if publish would work
flutter pub publish --dry-run
if [ $? -ne 0 ]
then
  echo "Dry run failed"
  exit 1
fi

# Only allow run in master branch
CURRENT=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

 if [ $CURRENT != 'master' ]
   then
     echo "Your branch has to be 'master' but is '$CURRENT'"
     exit 1
 fi

# Git it
git tag -a V$1 -m "Version $1"
git add .
git commit -m "Updated version, published"
git push origin master

# Upload
flutter pub publish
