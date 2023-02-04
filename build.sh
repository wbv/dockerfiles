#!/bin/sh

# build.sh - build and tag docker images
#
# Usage:
#   ./build.sh IMAGE [IMAGE [...]]
#
# will build and tag each IMAGE from IMAGE.Dockerfile
#
# Environment Variables:
#   IMAGE_PREFIX     an optional prefix to the image tag (omit the trailing '/')


# return value of the script, nonzero if anything failed
SUCCESS=0

# add a separator (trailing '/') for the image prefix if supplied
if [ "${IMAGE_PREXIX}" != "" ]; then
	IMAGE_PREFIX="${IMAGE_PREFIX}/"
fi

while [ $# -gt 0 ]; do
	DOCKERFILE="${1}".Dockerfile
	if [ ! -r "$DOCKERFILE" ]; then
		echo "'$DOCKERFILE' not found. Skipping." >&2
		SUCCESS=1
		shift
		continue
	fi
	echo "building: $DOCKERFILE"

	TAG="${IMAGE_PREFIX}${1}"
	echo "with tag: $TAG"
	shift
	docker build \
		-t "$TAG":latest \
		-t "$TAG":$(date "+%Y-%m-%d") \
		- < "$DOCKERFILE"
done
