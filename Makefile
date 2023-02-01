
DOCKER_IMAGES += pandoc-full
DOCKER_IMAGES += wkhtmltopdf
DOCKER_IMAGES += mdbook

.PHONY: all
all: $(DOCKER_IMAGES)

%: %.Dockerfile
	./build.sh $<
