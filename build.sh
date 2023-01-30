#!/bin/sh

[ "$TAG" != "" ] || TAG=wbvn/pandoc-full

docker build \
	-t wbvn/pandoc-full:latest \
	-t wbvn/pandoc-full:$(date "+%Y-%m-%d") \
	- < Dockerfile
