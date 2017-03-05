# habighost

A [Habitat](https://www.habitat.sh/) plan for packaging a simple, SQLite-based Ghost installation.

https://app.habitat.sh/#/pkgs/cnunciato/ghost

## Getting Started

First, [install](https://www.habitat.sh/docs/get-habitat/) and [configure](https://www.habitat.sh/tutorials/getting-started/mac/setup-environment/) Habitat, then fork the project and clone from your own repository.

Once Habitat is installed and configured with [your origin](https://www.habitat.sh/docs/share-packages-overview/) (referred to below as `$HAB_ORIGIN`), enter the Habitat studio and build!

```
hab studio enter
build
hab start $HAB_ORIGIN/ghost
```

## Testing Packages

### With Vagrant

For testing built packages, I've included a Vagrantfile that provisions an Ubuntu VM and starts (via `hab pkg start`) the most recently built package. Make sure you run at least one build first:

```
hab studio run build
```

... then provision the VM, and in a few moments you should be able to navigate to the newly created blog:

```
vagrant up
open http://192.168.10.100:2368
```

### With Docker

You can also export a Docker container and run it either directly:

```
hab studio run "build && hab pkg export docker $HAB_ORIGIN/ghost"
docker run -it --rm -p 2368:2368 $HAB_ORIGIN/ghost
open http://localhost:2368
```

... or with Docker Compose:

```
hab studio run "build && hab pkg export docker $HAB_ORIGIN/ghost"
docker-compose up
open http://localhost:2368
```

## Configuration

The package currently supports only SQLite as a database, but the following [Ghost configuration settings](http://support.ghost.org/config/) can be changed in the usual [Habitat-supported ways](https://www.habitat.sh/docs/run-packages-apply-config-updates/):

  * url (string &mdash; default: `"http://localhost:2368"`)
  * mail (object &mdash; default: `{}`)
  * server.ip (string &mdash; default: `"0.0.0.0"`)
  * server.port (string &mdash; default: `"2368"`)

## What is Ghost?

It's this!

* https://ghost.org/
* https://ghost.org/developers/ &larr; downloadable version (on which this package is based)
