#!/bin/bash
# Regenerates the local `api` package (OpenAPI dart-dio client) from swagger/swagger.yaml.
# Same recipe as the bm / tech / hedged apps.
set -e
cd "$(dirname "$0")"
rm -rf api
openapi-generator-cli version-manager set 7.14.0
openapi-generator-cli generate -i swagger/swagger.yaml -g dart-dio -o api \
  --additional-properties serializationLibrary=json_serializable,pubVersion=1.0.0,pubName=api,finalProperties=false,enumUnknownDefaultCase=true
cd api
fvm flutter pub add --dev json_serializable:6.9.5
fvm flutter pub get
dart run build_runner build --delete-conflicting-outputs
dart format .
