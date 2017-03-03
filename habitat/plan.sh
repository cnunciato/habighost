pkg_name=ghost
pkg_origin=cnunciato
pkg_version="0.11.7"
pkg_source="https://github.com/TryGhost/Ghost/releases/download/0.11.7/Ghost-0.11.7.zip"
pkg_shasum="36bf538a369de6067201bb23ceffcfd2cc478f8ab281a5a698a97d6a11b57dcf"

pkg_deps=(
  core/coreutils
  core/python2
  core/sqlite
  core/node
)

pkg_build_deps=(
  core/make
  core/gcc
)

do_begin() {
  return 0
}

do_download() {
  do_default_download
}

do_verify() {
  do_default_verify
}

do_clean() {
  do_default_clean
}

do_unpack() {
  unzip -o $HAB_CACHE_SRC_PATH/${pkg_filename} -d "$HAB_CACHE_SRC_PATH/${pkg_name}-${pkg_version}"
}

do_prepare() {
  export GHOST_NODE_VERSION_CHECK=false
}

do_build() {
  if [[ ! -x "$(readlink -f /usr/bin/env)" ]]; then
    ln -sfv $(pkg_path_for coreutils)/bin/env /usr/bin/env
  fi

  npm install --production sqlite3 --build-from-source --sqlite=$(pkg_path_for core/sqlite) --progress=false
  npm install --production --progress=false

  for b in node_modules/.bin/*; do
    echo $b
    fix_interpreter $(readlink -f -n $b) core/coreutils bin/env
  done

  if [[ ! -x "$(readlink -f /usr/bin/env)" ]]; then
    rm /usr/bin/env
  fi
}

do_check() {
  return 0
}

do_install() {
  cp Gruntfile.js index.js package.json $pkg_prefix/
  cp -R content core node_modules $pkg_prefix/
}

do_strip() {
  # do_default_strip
  return 0
}

do_end() {
  return 0
}

