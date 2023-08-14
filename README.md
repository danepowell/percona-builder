This is a Docker container allowing you to build Percona for MySQL 5.7 for Ubuntu Focal. It is intended to support developers on arm64 (Mac M1) architectures, but I suppose could work on x86 as well, although then you'd probably be better off just downloading the pre-built binaries :)

Use it like this:
```
docker build . --build-arg BRANCH=5.7 -t percona
docker cp percona:/tmp/BUILD_PS .
```

This project is not affiliated with Percona and does not come with any warranties or support. Enjoy!

To do:

- Automatic compilation on GitHub Actions. Need to cross-compile from x86: https://github.com/actions/runner-images/issues/5631

Known issues:

- I think the generated deb is missing a dependency on debsums. Make sure to install it yourself.