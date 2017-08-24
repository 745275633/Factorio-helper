#!/bin/zsh

[[ "$install" ]] && output="$install"
[[ "$installdir" ]] && output="$installdir"
[[ "$OUTPUT" ]] && output="$OUTPUT"
[[ "$prefix" ]] && output="$prefix"
[[ "$PREFIX" ]] && output="$PREFIX"
[[ "$output" ]] || output=/usr/local

lib="$output/lib/factorio-helper"
bin="$lib/bin"
xmake install "--installdir=$lib" --root
install -d "$output/bin"
install -d "$bin"
install -d "$output/share/zsh/site-functions"

install -m755 _factorio-helper "$output/share/zsh/site-functions"
install -m755 src/factorio-helper "$output/bin"

files=(
  add
  change
  delete
  download
  download.file
  download.git
  init
  list
  passwd
  pull
  push
  update
)
for file in $files
do
  install -m755 src/$file "$bin"
done
