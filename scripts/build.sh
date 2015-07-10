#!/bin/bash

tmpdir="/tmp"
rootdir="$(realpath $(dirname $(dirname $0)))"
cd "$rootdir"

rm -rf "$tmpdir/s9e"
mkdir -p "$tmpdir/s9e/emoji/config"


files="
	LICENSE
	README.md
	composer.json
	config/services.yml
	listener.php
";
for file in $files;
do
	cp "$file" "$tmpdir/s9e/emoji/$file"
done

cd "$tmpdir"
rm -f "$tmpdir/emoji.zip"
kzip -r -y "$tmpdir/emoji.zip" s9e
advzip -z4 "$tmpdir/emoji.zip"

rm -rf "$tmpdir/s9e"