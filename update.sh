#!/bin/bash

MAJOR="${1:-3}"
MINOR="${2:-40}"
PATCH="${3:-1}"

VER_INT="$(printf "%d%02d%02d00" "$MAJOR" "$MINOR" "$PATCH")"

# TODO check sha256sum
cd sqlite3_abi

ZIP="sqlite-amalgamation-$VER_INT.zip"
[ -f "$ZIP" ] || wget https://www.sqlite.org/2022/$ZIP

unzip -jo $ZIP "sqlite-amalgamation-$VER_INT/sqlite3.c" "sqlite-amalgamation-$VER_INT/sqlite3.h" "sqlite-amalgamation-$VER_INT/sqlite3ext.h"

cd ..

if [[ ! -n "$HAS_NIMTEROP" ]]; then
  nimble install -y nimterop@0.6.13
fi

nim c -o:wrap -d:debug --verbosity:0 --hints:off ./sqlite3_abi/wrap.nim
./wrap

sed -i \
  -e "s|cdecl|sqlitedecl|g" \
  -e "s|$PWD/||" \
  -e "s|$HOME/||" \
  -e 's|{.experimental: "codeReordering".}|{.experimental: "codeReordering".}\nwhen (NimMajor, NimMinor) < (1, 4):\n  {.pragma: sqlitedecl, cdecl, gcsafe, raises: [Defect].}\nelse:\n  {.pragma: sqlitedecl, gcsafe, cdecl, raises: [].}|' \
  -e "s|sqlite3_column_text\\*(a1: ptr sqlite3_stmt; iCol: cint): ptr cuchar|sqlite3_column_text\\*(a1: ptr sqlite3_stmt; iCol: cint): cstring|" \
  -e "s|sqlite3_value_text\\*(a1: ptr sqlite3_value): ptr cuchar|sqlite3_value_text\\*(a1: ptr sqlite3_value): cstring|" \
  sqlite3_abi/sqlite3_gen.nim
