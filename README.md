# habighost

A Habitat plan for packaging a simple SQLite-based Ghost installation.

```
hab studio enter
build
hab start cnunciato/ghost # Substituting your own origin name, of course.
```

Or if you just want to build and then run it, you can use Vagrant:

```
hab studio run build
vagrant up
open http://192.168.10.100:2368
```

or Docker:

```
hab studio run 'build && hab pkg export docker cnunciato/ghost'
docker run -it --rm -p 2368:2368 cnunciato/ghost
open http://localhost:2368
```

or Docker Compose, if you want to leave the service running, restart, etc.:

```
docker-compose up -d
```

## Configuration

The following [Ghost configuration settings](http://support.ghost.org/config/) can be changed (see `habitat/default.toml` for their default values):

  * url (string)
  * mail (object)
  * server.ip
  * server.port

## What is Ghost?

It's this!

* https://ghost.org/
* https://ghost.org/developers/ &larr; downloadable version (on which this package is based)
