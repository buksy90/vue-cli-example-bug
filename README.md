# Demo repository of vue-cli bug
Here is a link to [issue 2934](https://github.com/vuejs/vue-cli/issues/2934)

## Short summary
When I try to build this repository locally on Windows 10 machine it works.
But when I use docker and try to build using docker (use ./scripts/build) it fails with following error

```
user@machine MINGW64 /c/dev/vue-cli-bug (master)
$ ./scripts/build
Building UI
Error response from daemon: No such container: vue-cli-example-container
Error: No such container: vue-cli-example-container
[+] Building 8.8s (11/11) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                                                                          0.0s
 => => transferring dockerfile: 32B                                                                                                                                                                           0.0s
 => [internal] load .dockerignore                                                                                                                                                                             0.0s
 => => transferring context: 2B                                                                                                                                                                               0.0s
 => [internal] load metadata for docker.io/library/node:lts-alpine                                                                                                                                            2.0s
 => [internal] load build context                                                                                                                                                                             2.9s
 => => transferring context: 7.40MB                                                                                                                                                                           2.8s
 => [1/7] FROM docker.io/library/node:lts-alpine@sha256:8bd6100693a93cca2a3c3b1d8dfbcb7434d4b1731c625204966a87ea2efb36bc                                                                                      0.0s
 => CACHED [2/7] RUN npm install -g http-server @vue/cli @vue/cli-service                                                                                                                                     0.0s
 => CACHED [3/7] WORKDIR /app                                                                                                                                                                                 0.0s
 => CACHED [4/7] COPY package*.json ./                                                                                                                                                                        0.0s
 => CACHED [5/7] RUN npm install                                                                                                                                                                              0.0s
 => [6/7] COPY [^package]* .                                                                                                                                                                                  1.7s
 => ERROR [7/7] RUN npm run build                                                                                                                                                                             2.2s
------
 > [7/7] RUN npm run build:
#11 0.340
#11 0.340 > vue-cli-bug@0.1.0 build /app
#11 0.340 > vue-cli-service build
#11 0.340
#11 0.745
#11 0.746 -  Building for production...
#11 1.695 Starting type checking service...
#11 1.695 Using 1 worker with 2048MB memory limit
#11 2.121  ERROR  Failed to compile with 1 error8:56:22 PM
#11 2.121
#11 2.121 This relative module was not found:
#11 2.121
#11 2.121 * ./src/main.ts in multi ./src/main.ts
#11 2.122  ERROR  Build failed with errors.
#11 2.131 npm ERR! code ELIFECYCLE
#11 2.131 npm ERR! errno 1
#11 2.134 npm ERR! vue-cli-bug@0.1.0 build: `vue-cli-service build`
#11 2.134 npm ERR! Exit status 1
#11 2.134 npm ERR!
#11 2.135 npm ERR! Failed at the vue-cli-bug@0.1.0 build script.
#11 2.135 npm ERR! This is probably not a problem with npm. There is likely additional logging output above.
#11 2.141
#11 2.141 npm ERR! A complete log of this run can be found in:
#11 2.141 npm ERR!     /root/.npm/_logs/2021-03-28T20_56_22_540Z-debug.log
------
executor failed running [/bin/sh -c npm run build]: exit code: 1
Unable to find image 'vue-cli-example:latest' locally
Error response from daemon: pull access denied for vue-cli-example, repository does not exist or may require 'docker login': denied: requested access to the resource is denied
Removin old dist folder
```
