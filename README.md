# git-hash

Embed git hash in golang

## Build & Run

```sh
docker build \
    --build-arg GIT_VERSION=$(git rev-parse --short HEAD) \
	-t xshyamx/git-hash . \
	&& docker run --rm xshyamx/git-hash
```

## References

* [Inject build-time variables with Golang][golang-git]
* [Create the smallest and secured golang docker image based on scratch][golang-docker]

[golang-git]: https://blog.alexellis.io/inject-build-time-vars-golang/
[golang-docker]: https://medium.com/@chemidy/create-the-smallest-and-secured-golang-docker-image-based-on-scratch-4752223b7324
