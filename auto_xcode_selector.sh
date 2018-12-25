#!/bin/sh -eu

echo "\nAuto Xcode Selector🍣\n"

SWIFT_VERSION=`grep -r SWIFT_VERSION ./*.xcodeproj | head -n 1 | sed -e "s/^.*SWIFT_VERSION =\ \(.*\);.*$/\1/"`

echo "Swift Version "$SWIFT_VERSION

#support cocoapods
select_project_file() {	
	if [ -e ./*.xcworkspace ]; then
		open -a /Applications/Xcode$1.app *.xcworkspace
	elif [ -e ./*.xcodeproj ]; then
		open -a /Applications/Xcode$1.app *.xcodeproj
	fi
}

if [ `echo "$SWIFT_VERSION >= 4.2" | bc` == 1 ]; then
	select_project_file 10.1

elif [ `echo "$SWIFT_VERSION >= 4.1" | bc` == 1 ]; then
	select_project_file 9.4.1

elif [ `echo "$SWIFT_VERSION >= 4.0" | bc` == 1 ]; then
	select_project_file 9.3

elif [ `echo "$SWIFT_VERSION >= 3.0" | bc` == 1 ]; then
	select_project_file 8.2

elif [ `echo "$SWIFT_VERSION >= 2.0" | bc` == 1 ]; then
	select_project_file 7.3

fi
