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
    "sqlite3_version",
    "sqlite3_auto_extension"
    ])

  cOverride:
    type sqlite3_index_info* {.bycopy.} = object 
      nConstraint*: cint       ## ```
                              ##   Number of entries in aConstraint
                              ## ```
      iColumnConstrained*: cint           ## ```
                              ##   Column constrained.  -1 for ROWID
                              ## ```
      op*: cuchar              ## ```
                              ##   Constraint operator
                              ## ```
      usable*: cuchar          ## ```
                              ##   True if this constraint is usable
                              ## ```
      iTermOffset*: cint       ## ```
                              ##   Used internally - xBestIndex should ignore
                              ## ```
      nOrderBy*: cint          ## ```
                              ##   Number of terms in the ORDER BY clause
                              ## ```
      iColumnOrderBy*: cint           ## ```
                              ##   Column number
                              ## ```
      desc*: cuchar            ## ```
                              ##   True for DESC.  False for ASC.
                              ## ```
      argvIndex*: cint         ## ```
                              ##   if >0, constraint is part of argv to xFilter
                              ## ```
      omit*: cuchar            ## ```
                              ##   Do not code a test for this constraint
                              ## ```
      idxNum*: cint            ## ```
                              ##   Number used to identify the index
                              ## ```
      idxStr*: cstring         ## ```
                              ##   String, possibly obtained from sqlite3_malloc
                              ## ```
      needToFreeIdxStr*: cint  ## ```
                              ##   Free idxStr using sqlite3_free() if true
                              ## ```
      orderByConsumed*: cint   ## ```
                              ##   True if output is already ordered
                              ## ```
      estimatedCost*: cdouble ## ```
                              ##   Estimated cost of using this index 
                              ##      Fields below are only available in SQLite 3.8.2 and later
                              ## ```
      estimatedRows*: int64 ## ```
                            ##   Estimated number of rows returned 
                            ##      Fields below are only available in SQLite 3.9.0 and later
                            ## ```
      idxFlags*: cint ## ```
                      ##   Mask of SQLITE_INDEX_SCAN_* flags 
                      ##      Fields below are only available in SQLite 3.10.0 and later
                      ## ```
      colUsed*: uint64         ## ```
                              ##   Input: Mask of columns used by statement
                              ## ```
    

cPlugin:
  import strutils

  proc onSymbol*(sym: var Symbol) {.exportc, dynlib.} =
    if sym.kind == nskType:
      case sym.name
      of "sqlite_int64", "sqlite3_int64": sym.name = "int64"
      of "sqlite_uint64", "sqlite3_uint64": sym.name = "uint64"

#cExclude("stdarg.h")
#cCompile("sqlite3.c")

cImport("sqlite3ext.h", recurse=true, flags="-H", nimfile="sqlite3_gen.nim")


{.passL: "-lpthread".}


