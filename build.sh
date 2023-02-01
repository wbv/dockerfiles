#!/bin/sh

# Usage:
#   ./build.sh DOCKERFILE1 [DOCKERFILE2 [...]]

[ "$REPO_OWNER" != "" ] || REPO_OWNER="wbvn"

while [ $# -gt 0 ]; do
	DOCKERFILE="$1"
	if [ ! -r "$DOCKERFILE" ]; then
		echo "'$DOCKERFILE' not found." >&2
		DOCKERFILE="$1".Dockerfile
		echo "Trying '$DOCKERFILE'." >&2
		if [ ! -r "$DOCKERFILE" ]; then
			echo "'$DOCKERFILE' not found. Skipping." >&2
			shift
			continue
		fi
	fi
	echo "found: $DOCKERFILE"

	TAG="$REPO_OWNER/$(basename $DOCKERFILE .Dockerfile)"
	echo "using tag: $TAG"
	shift
	docker build \
		-t "$TAG":latest \
		-t "$TAG":$(date "+%Y-%m-%d") \
		- < "$DOCKERFILE"
done
