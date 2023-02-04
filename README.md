Generic Docker Images
---------------------

A collection of generally-reusable docker images I've found myself wishing for
in various contexts.

The Dockerfiles here get built/tagged/pushed automatically to:
- GitHub Container Repository: [wbv](https://github.com/wbv?tab=packages)
- Docker Hub: [wbvn](https://hub.docker.com/u/wbvn)

You can also build them locally yourself:

```bash
./build.sh pandoc-full

# Usage:
# mount your working directory to /data,
# set your user/group perms to match,
# and pass arguments like you would to pandoc
docker run --rm \
    --volume $(pwd):/data \
    --user $(id -u):$(id -g) \
    pandoc-full --help

# Example:
docker run --rm \
    --volume $(pwd):/data \
    --user $(id -u):$(id -g) \
    pandoc-full README.md -o README.pdf --pdf-engine xelatex --listings
```
