#!/bin/bash
# One-shot codegen for app + api package (riverpod, auto_route, json, flutter_gen).
# Pass "watch" to keep build_runner running: ./generate_code.sh watch
set -e
cd "$(dirname "$0")"
(cd api && fvm flutter pub get && dart run build_runner build -d)
fvm flutter pub get
if [ "$1" == "watch" ]; then
  dart run build_runner watch -d
else
  dart run build_runner build -d
fi
