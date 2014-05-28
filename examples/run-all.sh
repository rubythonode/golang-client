#!/bin/bash
#
# Enables all the examples to execute as a form of acceptance testing.

# Get the directory the examples are in and change into it.
DIR="$(cd $(dirname "$0") && pwd)"
echo "Executing the examples in: $DIR"
cd $DIR

# Run all the tests.
for T in $(ls -1 [0-9][0-9]*.go); do
	if ! [ -x $T ]; then
		CMD="go run $T setup.go"
		echo "$CMD ..."
		if ! $CMD ; then
			echo "Error executing example $T."
			exit 1
		fi
	fi
done