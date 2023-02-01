
DOCKER_IMAGES += pandoc-full
DOCKER_IMAGES += wkhtmltopdf

.PHONY: all
all: $(DOCKER_IMAGES)

%: %.Dockerfile
	./build.sh $<
