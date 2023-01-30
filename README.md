```bash
# Optional: build the container yourself
# (Recommended: skip this step and just pull from Docker Hub)
./build.sh

# Usage:
# mount your working directory to /data,
# set your user/group perms to match,
# and pass arguments like you would to pandoc
docker run --rm \
    --volume $(pwd):/data \
    --user $(id -u):$(id -g) \
    wbvn/pandoc-full --help

# Example:
docker run --rm \
    --volume $(pwd):/data \
    --user $(id -u):$(id -g) \
    wbvn/pandoc-full README.md -o README.pdf --pdf-engine xelatex --listings
```
