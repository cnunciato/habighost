pkg_name=ghost
pkg_description="A Habitat package for Ghost, the excellent blog publishing platform. See the GitHub repo for details on how to use it."
pkg_origin=cnunciato
pkg_maintainer="Christian Nunciato <chris@nunciato.org>"
pkg_version="0.11.8"
pkg_source="https://github.com/TryGhost/Ghost/releases/download/$pkg_version/Ghost-$pkg_version.zip"
pkg_shasum="244faad0b16eb1b90c8095f1e536db65299a3a2d85a20af76342be3707522b38"
pkg_upstream_url="https://github.com/cnunciato/habighost"
pkg_deps=(
  core/bash
  core/coreutils
  core/node
  core/sqlite
)
pkg_build_deps=(
  core/gcc
  core/make
  core/python2
)
pkg_exports=(
  [server-host]=server.host
  [server-port]=server.port
)
pkg_exposes=(
  server-port
)

do_unpack() {
  unzip -o "$HAB_CACHE_SRC_PATH/$pkg_filename" -d "$HAB_CACHE_SRC_PATH/$pkg_name-$pkg_version"
}

do_prepare() {
  export GHOST_NODE_VERSION_CHECK=false
}

do_build() {
  if [[ ! -x "$(readlink -f /usr/bin/env)" ]]; then
    ln -sfv "$(pkg_path_for coreutils)/bin/env" /usr/bin/env
  fi

  npm config set progress false
  npm config set production true

  npm install sqlite3 --build-from-source --sqlite="$(pkg_path_for core/sqlite)"
  npm install

  for b in node_modules/.bin/*; do
    echo "$b"
    fix_interpreter "$(readlink -f -n "$b")" core/coreutils bin/env
  done

  if [[ ! -x "$(readlink -f /usr/bin/env)" ]]; then
    rm /usr/bin/env
  fi
}

do_install() {
  cp -R \
    node_modules \
    content \
    core \
    index.js \
    Gruntfile.js \
    package.json "$pkg_prefix"/
}

do_strip() {
  return 0
}
