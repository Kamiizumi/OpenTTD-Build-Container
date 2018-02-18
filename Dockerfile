FROM debian:jessie
RUN echo "deb http://pkg.mxe.cc/repos/apt/debian wheezy main" > /etc/apt/sources.list.d/mxeapt.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB
RUN apt-get update && apt-get install -y mxe-x86-64-w64-mingw32.static-gcc mxe-x86-64-w64-mingw32.static-zlib mxe-x86-64-w64-mingw32.static-libpng mxe-x86-64-w64-mingw32.static-lzo mxe-x86-64-w64-mingw32.static-freetype mxe-x86-64-w64-mingw32.static-xz mxe-x86-64-w64-mingw32.static-icu4c
ENV PATH="/usr/lib/mxe/usr/bin:${PATH}"
RUN cd /usr/lib/mxe/usr/x86_64-w64-mingw32.static/lib && mv libsicudt.a libsicudt.a.old && ln -s sicudt.a /usr/lib/mxe/usr/x86_64-w64-mingw32.static/lib/libsicudt.a
