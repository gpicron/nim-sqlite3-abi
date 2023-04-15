import nimterop/cimport

static:
  cSkipSymbol(@[
    # can use native nim types instead
    "sqlite_int64",
    "sqlite_uint64",
    "sqlite3_int64",
    "sqlite3_uint64",
    # Code reording problems
    "SQLITE_STATIC",
    # cchar problem
    "sqlite3_version"
    ])

  cOverride:
    type sqlite3_index_info* {.importc, bycopy, incompleteStruct.} = object

cPlugin:
  import strutils

  proc onSymbol*(sym: var Symbol) {.exportc, dynlib.} =
    if sym.kind == nskType:
      case sym.name
      of "sqlite_int64", "sqlite3_int64": sym.name = "int64"
      of "sqlite_uint64", "sqlite3_uint64": sym.name = "uint64"

#cExclude("stdarg.h")

cImport("sqlite3ext.h", recurse=false, flags="-H", nimfile="sqlite3_module_gen.nim")



