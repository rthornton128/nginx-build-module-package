Nginx Build Module Package
==========================
This module is a fork of https://hg.nginx.org/pkg-oss to allow for Acro Media Inc. specific changes/requirements for our specific needs. It is not guaranteed to work for anyone so use at your own risk.

Pre-requesites
--------------
These programs are recommended:
- docker
  - setup an Ubuntu:16.04 container to build in: `docker run ubtuntu:16.04`.
  - enter the container with: `docker exec -it <container_id> /bin/bash`.
- git
- several other packages will need to be installed in the container or on your system of which the script will warn you.

Install
-------
Follow these steps to create a dynamic module for nginx:
1. Clone: https://github.com/rthornton128/nginx-build-module-package.
2. Run: `apt list nginx | grep nginx` to get the current version of nginx installed. It's important to note the full version number. It should look something like `1.14.0-0+xenial2`.
3. Update `debian/nginx-module-rules.in` and `debian/Makefile` to match the above version number/value and push it up to the repo. See the TODOs for improving this.
4. If running in a separate build environment (docker), run: `wget https://raw.githubusercontent.com/rthornton128/nginx-
uild-module-package/master/build_module.sh -O build_module.sh`
5. Run: `./build_module.sh -n vts -v <nginx-version> -f https://github.com/v
zlt/nginx-module-vts.git`. The nginx version number should have the format of `1.14.0` which matches the nginx version installed.
6. Exit your container if you are using one and run: `docker cp <container_id>:/<your_path>/debuild/nginx-module-vts_1.14.0-1~xenial2_amd64.deb <dest>`.
7. Move the debian file to the target server and install it.

TODO
----
- Update that damned script to figure out the correct nginx version so none of that manual crap needs to be done! It should not require editing the Makefile and nginx-module-rules.in file.