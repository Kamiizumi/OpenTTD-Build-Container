# OpenTTD Build Container

[Docker](https://www.docker.com) build container containing the dependencies required to build [OpenTTD](https://www.openttd.org/).

## Requirements

To use this build container you must have [Docker](https://www.docker.com) installed.

> If running on a Windows host ensure Linux containers are being used. The build container cannot be used with Windows containers.

> The source code must use Unix style (LF) line endings. Windows style (CRLF) line endings will cause the OpenTTD **./configure** script to fail.

## Building the Container

1. Check out this repository.
1. Run the following command from the folder containing the **Dockerfile**:

    `docker build . -t openttd-build`

## Usage

To build a Windows x64 version of OpenTTD perform the following steps:

1. Run the container interactively, mounting the OpenTTD source code:

    `docker run -it -v C:\path\to\source:/src openttd-build /bin/bash`

1. Change to the mounted source code:

    `cd /src`

1. Run the **./configure** script:

    `./configure --host=x86_64-w64-mingw32.static --pkg-config=x86_64-w64-mingw32.static-pkg-config --enable-static --with-lzo2=/usr/lib/mxe/usr/x86_64-w64-mingw32.static/lib/liblzo2.a`

1. Build OpenTTD:

    `make`

The executables will be in the repositories **bin/** folder once the build has completed.
