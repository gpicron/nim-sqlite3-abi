## This file contains additional definitions that nimterop does not generate
## code for

when (NimMajor, NimMinor) < (1, 4):
  {.pragma: sqlitedecl, cdecl, gcsafe, raises: [Defect].}
else:
  {.pragma: sqlitedecl, gcsafe, cdecl, raises: [].}

import sqlite3_abi/sqlite3_gen

const SQLITE_STATIC* = cast[sqlite3_destructor_type](0)
const SQLITE_TRANSIENT* = cast[sqlite3_destructor_type](-1)
# /*
# ** CAPI3REF: Constants Defining Special Destructor Behavior
# **
# ** These are special values for the destructor that is passed in as the
# ** final argument to routines like [sqlite3_result_blob()].  ^If the destructor
# ** argument is SQLITE_STATIC, it means that the content pointer is constant
# ** and will never change.  It does not need to be destroyed.  ^The
# ** SQLITE_TRANSIENT value means that the content will likely change in
# ** the near future and that SQLite should make its own private copy of
# ** the content before returning.
# **
# ** The typedef is necessary to work around problems in certain
# ** C++ compilers.
# */

when defined(sqliteextdll):
  export sqlite3_gen except 
    sqlite3_aggregate_context,
    sqlite3_aggregate_count,
    sqlite3_bind_blob,
    sqlite3_bind_double,
    sqlite3_bind_int,
    sqlite3_bind_int64,
    sqlite3_bind_null,
    sqlite3_bind_parameter_count,
    sqlite3_bind_parameter_index,
    sqlite3_bind_parameter_name,
    sqlite3_bind_text,
    sqlite3_bind_text16,
    sqlite3_bind_value,
    sqlite3_busy_handler,
    sqlite3_busy_timeout,
    sqlite3_changes,
    sqlite3_close,
    sqlite3_collation_needed,
    sqlite3_collation_needed16,
    sqlite3_column_blob,
    sqlite3_column_bytes,
    sqlite3_column_bytes16,
    sqlite3_column_count,
    sqlite3_column_decltype,
    sqlite3_column_decltype16,
    sqlite3_column_double,
    sqlite3_column_int,
    sqlite3_column_int64,
    sqlite3_column_name,
    sqlite3_column_name16,
    sqlite3_column_text,
    sqlite3_column_text16,
    sqlite3_column_type,
    sqlite3_column_value,
    sqlite3_commit_hook,
    sqlite3_complete,
    sqlite3_complete16,
    sqlite3_create_collation,
    sqlite3_create_collation16,
    sqlite3_create_collation_v2,
    sqlite3_create_function,
    sqlite3_create_function16,
    sqlite3_create_module,
    sqlite3_create_module_v2,
    sqlite3_data_count,
    sqlite3_db_handle,
    sqlite3_declare_vtab,
    sqlite3_enable_load_extension,
    sqlite3_errcode,
    sqlite3_errmsg,
    sqlite3_errmsg16,
    sqlite3_exec,
    sqlite3_expired,
    sqlite3_finalize,
    sqlite3_free,
    sqlite3_get_autocommit,
    sqlite3_get_auxdata,
    sqlite3_global_recover,
    sqlite3_initialize,
    sqlite3_interrupt,
    sqlite3_last_insert_rowid,
    sqlite3_libversion,
    sqlite3_libversion_number,
    sqlite3_malloc,
    sqlite3_memory_highwater,
    sqlite3_memory_used,
    sqlite3_mprintf,
    sqlite3_open,
    sqlite3_open16,
    sqlite3_open_v2,
    sqlite3_prepare,
    sqlite3_prepare16,
    sqlite3_prepare16_v2,
    sqlite3_prepare_v2,
    sqlite3_profile,
    sqlite3_progress_handler,
    sqlite3_realloc,
    sqlite3_reset,
    sqlite3_result_blob,
    sqlite3_result_double,
    sqlite3_result_error,
    sqlite3_result_error16,
    sqlite3_result_error_code,
    sqlite3_result_error_nomem,
    sqlite3_result_error_toobig,
    sqlite3_result_int,
    sqlite3_result_int64,
    sqlite3_result_null,
    sqlite3_result_text,
    sqlite3_result_text16,
    sqlite3_result_text16be,
    sqlite3_result_text16le,
    sqlite3_result_value,
    sqlite3_result_zeroblob,
    sqlite3_rollback_hook,
    sqlite3_set_authorizer,
    sqlite3_set_auxdata,
    sqlite3_snprintf,
    sqlite3_soft_heap_limit,
    sqlite3_sourceid,
    sqlite3_sql,
    sqlite3_status,
    sqlite3_step,
    sqlite3_table_column_metadata,
    sqlite3_thread_cleanup,
    sqlite3_total_changes,
    sqlite3_trace,
    sqlite3_transfer_bindings,
    sqlite3_update_hook,
    sqlite3_user_data,
    sqlite3_value_blob,
    sqlite3_value_bytes,
    sqlite3_value_bytes16,
    sqlite3_value_double,
    sqlite3_value_int,
    sqlite3_value_int64,
    sqlite3_value_numeric_type,
    sqlite3_value_text,
    sqlite3_value_text16,
    sqlite3_value_text16be,
    sqlite3_value_text16le,
    sqlite3_value_type,
    sqlite3_vmprintf,
    sqlite3_vsnprintf,
    sqlite3_wal_autocheckpoint,
    sqlite3_wal_checkpoint,
    sqlite3_wal_checkpoint_v2,
    sqlite3_wal_hook
  
  var sqlite3_api : ptr sqlite3_api_routines

  template SQLITE_EXTENSION_INIT*(v) =
    ## this template must be called in the init proc of the extension 
    sqlite3_api = v
  

  template sqlite3_aggregate_context*(a1: ptr sqlite3_context; nBytes: cint): pointer = sqlite3_api.aggregate_context(a1, nBytes)
  template sqlite3_aggregate_count*(a1: ptr sqlite3_context): cint = sqlite3_api.aggregate_count(a1)
  template sqlite3_bind_blob*(a1: ptr sqlite3_stmt; a2: cint; a3: pointer; n: cint; a5: proc (a1: pointer) {.sqlitedecl.}): cint = sqlite3_api.bind_blob(a1, a2, a3, n, a5)
  template sqlite3_bind_double*(a1: ptr sqlite3_stmt; a2: cint; a3: cdouble): cint = sqlite3_api.bind_double(a1, a2, a3)
  template sqlite3_bind_int*(a1: ptr sqlite3_stmt; a2: cint; a3: cint): cint = sqlite3_api.bind_int(a1, a2, a3)
  template sqlite3_bind_int64*(a1: ptr sqlite3_stmt; a2: cint; a3: int64): cint = sqlite3_api.bind_int64(a1, a2, a3)
  template sqlite3_bind_null*(a1: ptr sqlite3_stmt; a2: cint): cint = sqlite3_api.bind_null(a1, a2)
  template sqlite3_bind_parameter_count*(a1: ptr sqlite3_stmt): cint = sqlite3_api.bind_parameter_count(a1)
  template sqlite3_bind_parameter_index*(a1: ptr sqlite3_stmt; zName: cstring): cint = sqlite3_api.bind_parameter_index(a1, zName)
  template sqlite3_bind_parameter_name*(a1: ptr sqlite3_stmt; a2: cint): cstring = sqlite3_api.bind_parameter_name(a1, a2)
  template sqlite3_bind_text*(a1: ptr sqlite3_stmt; a2: cint; a3: cstring; n: cint; a5: proc (a1: pointer) {.sqlitedecl.}): cint = sqlite3_api.bind_text(a1, a2, a3, n, a5)
  template sqlite3_bind_text16*(a1: ptr sqlite3_stmt; a2: cint; a3: pointer; a4: cint; a5: proc (a1: pointer) {.sqlitedecl.}): cint = sqlite3_api.bind_text16(a1, a2, a3, a4, a5)
  template sqlite3_bind_value*(a1: ptr sqlite3_stmt; a2: cint; a3: ptr sqlite3_value): cint = sqlite3_api.bind_value(a1, a2, a3)
  template sqlite3_busy_handler*(a1: ptr sqlite3; a2: proc (a1: pointer; a2: cint): cint {.sqlitedecl.}; a3: pointer): cint = sqlite3_api.busy_handler(a1, a2, a3)
  template sqlite3_busy_timeout*(a1: ptr sqlite3; a2: cint): cint = sqlite3_api.busy_timeout(a1, a2)
  template sqlite3_changes*(a1: ptr sqlite3): cint = sqlite3_api.changes(a1)
  template sqlite3_close*(a1: ptr sqlite3): cint = sqlite3_api.close(a1)
  template sqlite3_collation_needed*(a1: ptr sqlite3; a2: pointer; a3: proc (a1: pointer; a2: ptr sqlite3; eTextRep: cint; a4: cstring) {.sqlitedecl.}): cint = sqlite3_api.collation_needed(a1, a2, a3)
  template sqlite3_collation_needed16*(a1: ptr sqlite3; a2: pointer; a3: proc (a1: pointer; a2: ptr sqlite3; eTextRep: cint; a4: pointer) {.sqlitedecl.}): cint = sqlite3_api.collation_needed16(a1, a2, a3)
  template sqlite3_column_blob*(a1: ptr sqlite3_stmt; a2: cint): pointer = sqlite3_api.column_blob(a1, a2)
  template sqlite3_column_bytes*(a1: ptr sqlite3_stmt; a2: cint): cint = sqlite3_api.column_bytes(a1, a2)
  template sqlite3_column_bytes16*(a1: ptr sqlite3_stmt; a2: cint): cint = sqlite3_api.column_bytes16(a1, a2)
  template sqlite3_column_count*(a1: ptr sqlite3_stmt): cint = sqlite3_api.column_count(a1)
  template sqlite3_column_database_name*(a1: ptr sqlite3_stmt; a2: cint): cstring = sqlite3_api.column_database_name(a1, a2)
  template sqlite3_column_database_name16*(a1: ptr sqlite3_stmt; a2: cint): pointer = sqlite3_api.column_database_name16(a1, a2)
  template sqlite3_column_decltype*(a1: ptr sqlite3_stmt; a2: cint): cstring = sqlite3_api.column_decltype(a1, a2)
  template sqlite3_column_decltype16*(a1: ptr sqlite3_stmt; a2: cint): pointer = sqlite3_api.column_decltype16(a1, a2)
  template sqlite3_column_double*(a1: ptr sqlite3_stmt; a2: cint): cdouble = sqlite3_api.column_double(a1, a2)
  template sqlite3_column_int*(a1: ptr sqlite3_stmt; a2: cint): cint = sqlite3_api.column_int(a1, a2)
  template sqlite3_column_int64*(a1: ptr sqlite3_stmt; a2: cint): int64 = sqlite3_api.column_int64(a1, a2)
  template sqlite3_column_name*(a1: ptr sqlite3_stmt; a2: cint): cstring = sqlite3_api.column_name(a1, a2)
  template sqlite3_column_name16*(a1: ptr sqlite3_stmt; a2: cint): pointer = sqlite3_api.column_name16(a1, a2)
  template sqlite3_column_origin_name*(a1: ptr sqlite3_stmt; a2: cint): cstring = sqlite3_api.column_origin_name(a1, a2)
  template sqlite3_column_origin_name16*(a1: ptr sqlite3_stmt; a2: cint): pointer = sqlite3_api.column_origin_name16(a1, a2)
  template sqlite3_column_table_name*(a1: ptr sqlite3_stmt; a2: cint): cstring = sqlite3_api.column_table_name(a1, a2)
  template sqlite3_column_table_name16*(a1: ptr sqlite3_stmt; a2: cint): pointer = sqlite3_api.column_table_name16(a1, a2)
  template sqlite3_column_text*(a1: ptr sqlite3_stmt; a2: cint): cstring = sqlite3_api.column_text(a1, a2)
  template sqlite3_column_text16*(a1: ptr sqlite3_stmt; a2: cint): pointer = sqlite3_api.column_text16(a1, a2)
  template sqlite3_column_type*(a1: ptr sqlite3_stmt; a2: cint): cint = sqlite3_api.column_type(a1, a2)
  template sqlite3_column_value*(a1: ptr sqlite3_stmt; a2: cint): ptr sqlite3_value = sqlite3_api.column_value(a1, a2)
  template sqlite3_commit_hook*(a1: ptr sqlite3; a2: proc (a1: pointer): cint {.sqlitedecl.}; a3: pointer): proc (a1: pointer): cint = sqlite3_api.commit_hook(a1, a2, a3)
  template sqlite3_complete*(a1: cstring): cint = sqlite3_api.complete(a1)
  template sqlite3_complete16*(a1: pointer): cint = sqlite3_api.complete16(a1)
  template sqlite3_create_collation*(a1: ptr sqlite3; a2: cstring; a3: cint; a4: pointer; a5: proc (a1: pointer; a2: cint; a3: pointer; a4: cint; a5: pointer): cint {.sqlitedecl.}): cint = sqlite3_api.create_collation(a1, a2, a3, a4, a5)
  template sqlite3_create_collation16*(a1: ptr sqlite3; a2: pointer; a3: cint; a4: pointer; a5: proc (a1: pointer; a2: cint; a3: pointer; a4: cint; a5: pointer): cint {.sqlitedecl.}): cint = sqlite3_api.create_collation16(a1, a2, a3, a4, a5)
  template sqlite3_create_function*(a1: ptr sqlite3; a2: cstring; a3: cint; a4: cint; a5: pointer; a6: proc (a1: ptr sqlite3_context; a2: cint; a3: ptr ptr sqlite3_value) {.sqlitedecl.}; a7: proc (a1: pointer; a2: cint; a3: pointer): cdouble {.sqlitedecl.}; a8: proc (a1: pointer; a2: cint; a3: pointer): cint {.sqlitedecl.}): cint = sqlite3_api.create_function(a1, a2, a3, a4, a5, a6, a7, a8)
  template sqlite3_create_function16*(a1: ptr sqlite3; a2: pointer; a3: cint; a4: cint; a5: pointer; a6: proc (a1: ptr sqlite3_context; a2: cint; a3: ptr ptr sqlite3_value) {.sqlitedecl.}; a7: proc (a1: pointer; a2: cint; a3: pointer): cdouble {.sqlitedecl.}; a8: proc (a1: pointer; a2: cint; a3: pointer): cint {.sqlitedecl.}): cint = sqlite3_api.create_function16(a1, a2, a3, a4, a5, a6, a7, a8)
  template sqlite3_create_module*(a1: ptr sqlite3; a2: cstring; a3: ptr sqlite3_module; a4: pointer): cint = sqlite3_api.create_module(a1, a2, a3, a4)
  template sqlite3_data_count*(a1: ptr sqlite3_stmt): cint = sqlite3_api.data_count(a1)
  template sqlite3_db_handle*(a1: ptr sqlite3_stmt): ptr sqlite3 = sqlite3_api.db_handle(a1)
  template sqlite3_declare_vtab*(a1: ptr sqlite3; a2: cstring): cint = sqlite3_api.declare_vtab(a1, a2)
  template sqlite3_enable_shared_cache*(a1: cint): cint = sqlite3_api.enable_shared_cache(a1)
  template sqlite3_errcode*(a1: ptr sqlite3): cint = sqlite3_api.errcode(a1)
  template sqlite3_errmsg*(a1: ptr sqlite3): cstring = sqlite3_api.errmsg(a1)
  template sqlite3_errmsg16*(a1: ptr sqlite3): pointer = sqlite3_api.errmsg16(a1)
  template sqlite3_exec*(a1: ptr sqlite3; a2: cstring; a3: sqlite3_callback; a4: pointer; a5: ptr pointer): cint = sqlite3_api.exec(a1, a2, a3, a4, a5)
  template sqlite3_expired*(a1: ptr sqlite3_stmt): cint = sqlite3_api.expired(a1)
  template sqlite3_finalize*(pStmt: ptr sqlite3_stmt): cint = sqlite3_api.finalize(pStmt)
  template sqlite3_free*(a1: pointer) = sqlite3_api.free(a1)
  template sqlite3_free_table*(result: ptr cstring) = sqlite3_api.free_table(result)
  template sqlite3_get_autocommit*(a1: ptr sqlite3): cint = sqlite3_api.get_autocommit(a1)
  template sqlite3_get_auxdata*(a1: ptr sqlite3_context; a2: cint): pointer = sqlite3_api.get_auxdata(a1, a2)
  template sqlite3_get_table*(a1: ptr sqlite3; a2: cstring; a3: ptr ptr cstring; a4: ptr cint; a5: ptr cint; a6: ptr cstring): cint = sqlite3_api.get_table(a1, a2, a3, a4, a5, a6)
  template sqlite3_get_table16*(a1: ptr sqlite3; a2: pointer; a3: ptr ptr pointer; a4: ptr cint; a5: ptr cint; a6: ptr pointer): cint = sqlite3_api.get_table16(a1, a2, a3, a4, a5, a6)
  template sqlite3_global_recover*(a1: cint): cint = sqlite3_api.global_recover(a1)
  template sqlite3_interruptx*(a1: ptr sqlite3) = sqlite3_api.interruptx(a1)
  template sqlite3_last_insert_rowid*(a1: ptr sqlite3): int64 = sqlite3_api.last_insert_rowid(a1)
  template sqlite3_libversion*(): cstring = sqlite3_api.libversion(a1)
  template sqlite3_libversion_number*(): cint = sqlite3_api.libversion_number(a1)
  template sqlite3_malloc*(a1: cint): pointer = sqlite3_api.malloc(a1)
  template sqlite3_mprintf*(a1: cstring): cstring = sqlite3_api.mprintf(a1)
  template sqlite3_open*(a1: cstring; a2: ptr ptr sqlite3): cint = sqlite3_api.open(a1, a2)
  template sqlite3_open16*(a1: pointer; a2: ptr ptr sqlite3): cint = sqlite3_api.open16(a1, a2)
  template sqlite3_prepare*(a1: ptr sqlite3; a2: cstring; a3: cint; a4: ptr ptr sqlite3_stmt; a5: ptr cstring): cint = sqlite3_api.prepare(a1, a2, a3, a4, a5)
  template sqlite3_prepare16*(a1: ptr sqlite3; a2: pointer; a3: cint; a4: ptr ptr sqlite3_stmt; a5: ptr pointer): cint = sqlite3_api.prepare16(a1, a2, a3, a4, a5)
  template sqlite3_profile*(a1: ptr sqlite3; a2: proc (a1: pointer; a2: cstring; a3: uint64) {.sqlitedecl.}; a3: pointer): pointer = sqlite3_api.profile(a1, a2, a3)
  template sqlite3_progress_handler*(a1: ptr sqlite3; a2: cint; a3: proc (a1: pointer): cint {.sqlitedecl.}; a4: pointer): pointer = sqlite3_api.progress_handler(a1, a2, a3, a4)
  template sqlite3_realloc*(a1: pointer; a2: cint): pointer = sqlite3_api.realloc(a1, a2)
  template sqlite3_reset*(pStmt: ptr sqlite3_stmt): cint = sqlite3_api.reset(pStmt)
  template sqlite3_result_blob*(a1: ptr sqlite3_context; a2: pointer; a3: cint; a4: proc (a1: pointer) {.sqlitedecl.}) = sqlite3_api.result_blob(a1, a2, a3, a4)
  template sqlite3_result_double*(a1: ptr sqlite3_context; a2: cdouble) = sqlite3_api.result_double(a1, a2)
  template sqlite3_result_error*(a1: ptr sqlite3_context; a2: cstring; a3: cint) = sqlite3_api.result_error(a1, a2, a3)
  template sqlite3_result_error16*(a1: ptr sqlite3_context; a2: pointer; a3: cint) = sqlite3_api.result_error16(a1, a2, a3)
  template sqlite3_result_int*(a1: ptr sqlite3_context; a2: cint) = sqlite3_api.result_int(a1, a2)
  template sqlite3_result_int64*(a1: ptr sqlite3_context; a2: int64) = sqlite3_api.result_int64(a1, a2)
  template sqlite3_result_null*(a1: ptr sqlite3_context) = sqlite3_api.result_null(a1)
  template sqlite3_result_text*(a1: ptr sqlite3_context; a2: cstring; a3: cint; a4: proc (a1: pointer) {.sqlitedecl.}) = sqlite3_api.result_text(a1, a2, a3, a4)
  template sqlite3_result_text16*(a1: ptr sqlite3_context; a2: pointer; a3: cint; a4: proc (a1: pointer) {.sqlitedecl.}) = sqlite3_api.result_text16(a1, a2, a3, a4)
  template sqlite3_result_text16be*(a1: ptr sqlite3_context; a2: pointer; a3: cint; a4: proc (a1: pointer) {.sqlitedecl.}) = sqlite3_api.result_text16be(a1, a2, a3, a4)
  template sqlite3_result_text16le*(a1: ptr sqlite3_context; a2: pointer; a3: cint; a4: proc (a1: pointer) {.sqlitedecl.}) = sqlite3_api.result_text16le(a1, a2, a3, a4)
  template sqlite3_result_value*(a1: ptr sqlite3_context; a2: ptr sqlite3_value) = sqlite3_api.result_value(a1, a2)
  template sqlite3_rollback_hook*(a1: ptr sqlite3; a2: proc (a1: pointer) {.sqlitedecl.}; a3: pointer): pointer = sqlite3_api.rollback_hook(a1, a2, a3)
  template sqlite3_set_authorizer*(a1: ptr sqlite3; a2: proc (a1: pointer; a2: cint; a3: cstring; a4: cstring; a5: cstring; a6: cstring): cint {.sqlitedecl.}; a3: pointer): cint = sqlite3_api.set_authorizer(a1, a2, a3)
  template sqlite3_set_auxdata*(a1: ptr sqlite3_context; a2: cint; a3: pointer; a4: proc (a1: pointer) {.sqlitedecl.}) = sqlite3_api.set_auxdata(a1, a2, a3, a4)
  template sqlite3_xsnprintf*(a1: cint; a2: cstring; a3: cstring): cstring = sqlite3_api.xsnprintf(a1, a2, a3)
  template sqlite3_step*(a1: ptr sqlite3_stmt): cint = sqlite3_api.step(a1)
  template sqlite3_table_column_metadata*(a1: ptr sqlite3; a2: cstring; a3: cstring; a4: cstring; a5: ptr cstring; a6: ptr cstring; a7: ptr cint; a8: ptr cint; a9: ptr cint): cint = sqlite3_api.table_column_metadata(a1, a2, a3, a4, a5, a6, a7, a8, a9)
  template sqlite3_thread_cleanup*() = sqlite3_api.thread_cleanup()
  template sqlite3_total_changes*(a1: ptr sqlite3): cint = sqlite3_api.total_changes(a1)
  template sqlite3_trace*(a1: ptr sqlite3; xTrace: proc (a1: pointer; a2: cstring) {.sqlitedecl.}; a3: pointer): pointer = sqlite3_api.trace(a1, xTrace, a3)
  template sqlite3_transfer_bindings*(a1: ptr sqlite3_stmt; a2: ptr sqlite3_stmt): cint = sqlite3_api.transfer_bindings(a1, a2)
  template sqlite3_update_hook*(a1: ptr sqlite3; a2: proc (a1: pointer; a2: cint; a3: cstring; a4: cstring; a5: int64) {.sqlitedecl.}; a3: pointer): pointer = sqlite3_api.update_hook(a1, a2, a3)
  template sqlite3_user_data*(a1: ptr sqlite3_context): pointer = sqlite3_api.user_data(a1)
  template sqlite3_value_blob*(a1: ptr sqlite3_value): pointer = sqlite3_api.value_blob(a1)
  template sqlite3_value_bytes*(a1: ptr sqlite3_value): cint = sqlite3_api.value_bytes(a1)
  template sqlite3_value_bytes16*(a1: ptr sqlite3_value): cint = sqlite3_api.value_bytes16(a1)
  template sqlite3_value_double*(a1: ptr sqlite3_value): cdouble = sqlite3_api.value_double(a1)
  template sqlite3_value_int*(a1: ptr sqlite3_value): cint = sqlite3_api.value_int(a1)
  template sqlite3_value_int64*(a1: ptr sqlite3_value): int64 = sqlite3_api.value_int64(a1)
  template sqlite3_value_numeric_type*(a1: ptr sqlite3_value): cint = sqlite3_api.value_numeric_type(a1)
  template sqlite3_value_text*(a1: ptr sqlite3_value): cstring = sqlite3_api.value_text(a1)
  template sqlite3_value_text16*(a1: ptr sqlite3_value): pointer = sqlite3_api.value_text16(a1)
  template sqlite3_value_text16be*(a1: ptr sqlite3_value): pointer = sqlite3_api.value_text16be(a1)
  template sqlite3_value_text16le*(a1: ptr sqlite3_value): pointer = sqlite3_api.value_text16le(a1)
  template sqlite3_value_type*(a1: ptr sqlite3_value): cint = sqlite3_api.value_type(a1)
  template sqlite3_vmprintf*(a1: cstring; a2: va_list): cstring = sqlite3_api.vmprintf(a1, a2)
  template sqlite3_overload_function*(a1: ptr sqlite3; zFuncName: cstring; nArg: cint): cint = sqlite3_api.overload_function(a1, zFuncName, nArg)
  template sqlite3_prepare_v2*(a1: ptr sqlite3; a2: cstring; a3: cint; a4: ptr ptr sqlite3_stmt; a5: ptr cstring): cint = sqlite3_api.prepare_v2(a1, a2, a3, a4, a5)
  template sqlite3_prepare16_v2*(a1: ptr sqlite3; a2: pointer; a3: cint; a4: ptr ptr sqlite3_stmt; a5: ptr pointer): cint = sqlite3_api.prepare16_v2(a1, a2, a3, a4, a5)
  template sqlite3_clear_bindings*(a1: ptr sqlite3_stmt): cint = sqlite3_api.clear_bindings(a1)
  template sqlite3_create_module_v2*(a1: ptr sqlite3; a2: cstring; a3: ptr sqlite3_module; a4: pointer; xDestroy: proc (a1: pointer) {.sqlitedecl.}): cint = sqlite3_api.create_module_v2(a1, a2, a3, a4, xDestroy)
  template sqlite3_bind_zeroblob*(a1: ptr sqlite3_stmt; a2: cint; a3: cint): cint = sqlite3_api.bind_zeroblob(a1, a2, a3)
  template sqlite3_blob_bytes*(a1: ptr sqlite3_blob): cint = sqlite3_api.blob_bytes(a1)
  template sqlite3_blob_close*(a1: ptr sqlite3_blob): cint = sqlite3_api.blob_close(a1)
  template sqlite3_blob_open*(a1: ptr sqlite3; a2: cstring; a3: cstring; a4: cstring; a5: int64; a6: cint; a7: ptr ptr sqlite3_blob): cint = sqlite3_api.blob_open(a1, a2, a3, a4, a5, a6, a7)
  template sqlite3_blob_read*(a1: ptr sqlite3_blob; a2: pointer; a3: cint; a4: cint): cint = sqlite3_api.blob_read(a1, a2, a3, a4)
  template sqlite3_blob_write*(a1: ptr sqlite3_blob; a2: pointer; a3: cint; a4: cint): cint = sqlite3_api.blob_write(a1, a2, a3, a4)
  template sqlite3_create_collation_v2*(a1: ptr sqlite3; a2: cstring; a3: cint; a4: pointer; a5: proc (a1: pointer; a2: cint; a3: pointer; a4: cint; a5: pointer): cint {.sqlitedecl.}; a6: proc (a1: pointer) {.sqlitedecl.}): cint = sqlite3_api.create_collation_v2(a1, a2, a3, a4, a5, a6)
  template sqlite3_file_control*(a1: ptr sqlite3; a2: cstring; a3: cint; a4: pointer): cint = sqlite3_api.file_control(a1, a2, a3, a4)
  template sqlite3_memory_highwater*(a1: cint): int64 = sqlite3_api.memory_highwater(a1)
  template sqlite3_memory_used*(): int64 = sqlite3_api.memory_used()
  template sqlite3_mutex_alloc*(a1: cint): ptr sqlite3_mutex = sqlite3_api.mutex_alloc(a1)
  template sqlite3_mutex_enter*(a1: ptr sqlite3_mutex) = sqlite3_api.mutex_enter(a1)
  template sqlite3_mutex_free*(a1: ptr sqlite3_mutex) = sqlite3_api.mutex_free(a1)
  template sqlite3_mutex_leave*(a1: ptr sqlite3_mutex) = sqlite3_api.mutex_leave(a1)
  template sqlite3_mutex_try*(a1: ptr sqlite3_mutex): cint = sqlite3_api.mutex_try(a1)
  template sqlite3_open_v2*(a1: cstring; a2: ptr ptr sqlite3; a3: cint; a4: cstring): cint = sqlite3_api.open_v2(a1, a2, a3, a4)
  template sqlite3_release_memory*(a1: cint): cint = sqlite3_api.release_memory(a1)
  template sqlite3_result_error_nomem*(a1: ptr sqlite3_context) = sqlite3_api.result_error_nomem(a1)
  template sqlite3_result_error_toobig*(a1: ptr sqlite3_context) = sqlite3_api.result_error_toobig(a1)
  template sqlite3_sleep*(a1: cint): cint = sqlite3_api.sleep(a1)
  template sqlite3_soft_heap_limit*(a1: cint) = sqlite3_api.soft_heap_limit(a1)
  template sqlite3_vfs_find*(a1: cstring): ptr sqlite3_vfs = sqlite3_api.vfs_find(a1)
  template sqlite3_vfs_register*(a1: ptr sqlite3_vfs; a2: cint): cint = sqlite3_api.vfs_register(a1, a2)
  template sqlite3_vfs_unregister*(a1: ptr sqlite3_vfs): cint = sqlite3_api.vfs_unregister(a1)
  template sqlite3_xthreadsafe*(): cint = sqlite3_api.xthreadsafe()
  template sqlite3_result_zeroblob*(a1: ptr sqlite3_context; a2: cint) = sqlite3_api.result_zeroblob(a1, a2)
  template sqlite3_result_error_code*(a1: ptr sqlite3_context; a2: cint) = sqlite3_api.result_error_code(a1, a2)
  template sqlite3_test_control*(a1: cint): cint = sqlite3_api.test_control(a1)
  template sqlite3_randomness*(a1: cint; a2: pointer) = sqlite3_api.randomness(a1, a2)
  template sqlite3_context_db_handle*(a1: ptr sqlite3_context): ptr sqlite3 = sqlite3_api.context_db_handle(a1)
  template sqlite3_extended_result_codes*(a1: ptr sqlite3; a2: cint): cint = sqlite3_api.extended_result_codes(a1, a2)
  template sqlite3_limit*(a1: ptr sqlite3; a2: cint; a3: cint): cint = sqlite3_api.limit(a1, a2, a3)
  template sqlite3_next_stmt*(a1: ptr sqlite3; a2: ptr sqlite3_stmt): ptr sqlite3_stmt = sqlite3_api.next_stmt(a1, a2)
  template sqlite3_sql*(a1: ptr sqlite3_stmt): cstring = sqlite3_api.sql(a1)
  template sqlite3_status*(a1: cint; a2: ptr cint; a3: ptr cint; a4: cint): cint = sqlite3_api.status(a1, a2, a3, a4)
  template sqlite3_backup_finish*(a1: ptr sqlite3_backup): cint = sqlite3_api.backup_finish(a1)
  template sqlite3_backup_init*(a1: ptr sqlite3; a2: cstring; a3: ptr sqlite3; a4: cstring): ptr sqlite3_backup = sqlite3_api.backup_init(a1, a2, a3, a4)
  template sqlite3_backup_pagecount*(a1: ptr sqlite3_backup): cint = sqlite3_api.backup_pagecount(a1)
  template sqlite3_backup_remaining*(a1: ptr sqlite3_backup): cint = sqlite3_api.backup_remaining(a1)
  template sqlite3_backup_step*(a1: ptr sqlite3_backup; a2: cint): cint = sqlite3_api.backup_step(a1, a2)
  template sqlite3_compileoption_get*(a1: cint): cstring = sqlite3_api.compileoption_get(a1)
  template sqlite3_compileoption_used*(a1: cstring): cint = sqlite3_api.compileoption_used(a1)
  template sqlite3_create_function_v2*(a1: ptr sqlite3; a2: cstring; a3: cint; a4: cint; a5: pointer; xFunc: proc (a1: ptr sqlite3_context; a2: cint; a3: ptr ptr sqlite3_value) {.sqlitedecl.}; xStep: proc (a1: ptr sqlite3_context; a2: cint; a3: ptr ptr sqlite3_value) {.sqlitedecl.}; xFinal: proc (a1: ptr sqlite3_context) {.sqlitedecl.}; xDestroy: proc (a1: pointer) {.sqlitedecl.}): cint = sqlite3_api.create_function_v2(a1, a2, a3, a4, a5, xFunc, xStep, xFinal, xDestroy)
  template sqlite3_db_config*(a1: ptr sqlite3; a2: cint): cint = sqlite3_api.db_config(a1, a2)
  template sqlite3_db_mutex*(a1: ptr sqlite3): ptr sqlite3_mutex = sqlite3_api.db_mutex(a1)
  template sqlite3_db_status*(a1: ptr sqlite3; a2: cint; a3: ptr cint; a4: ptr cint; a5: cint): cint = sqlite3_api.db_status(a1, a2, a3, a4, a5)
  template sqlite3_extended_errcode*(a1: ptr sqlite3): cint = sqlite3_api.extended_errcode(a1)
  template sqlite3_log*(a1: cint; a2: cstring) = sqlite3_api.log(a1, a2)
  template sqlite3_soft_heap_limit64*(a1: int64): int64 = sqlite3_api.soft_heap_limit64(a1)
  template sqlite3_sourceid*(): cstring = sqlite3_api.sourceid()
  template sqlite3_stmt_status*(a1: ptr sqlite3_stmt; a2: cint; a3: cint): cint = sqlite3_api.stmt_status(a1, a2, a3)
  template sqlite3_strnicmp*(a1: cstring; a2: cstring; a3: cint): cint = sqlite3_api.strnicmp(a1, a2, a3)
  template sqlite3_unlock_notify*(a1: ptr sqlite3; xUnlockNotify: proc (a1: pointer; a2: ptr sqlite3) {.sqlitedecl.}; a3: pointer) = sqlite3_api.unlock_notify(a1, xUnlockNotify, a3)
  template sqlite3_wal_autocheckpoint*(a1: ptr sqlite3; a2: cint): cint = sqlite3_api.wal_autocheckpoint(a1, a2)
  template sqlite3_wal_checkpoint*(a1: ptr sqlite3; a2: cstring): cint = sqlite3_api.wal_checkpoint(a1, a2)
  template sqlite3_wal_hook*(a1: ptr sqlite3; xWal: proc (a1: pointer; a2: ptr sqlite3; a3: cstring; a4: cint) {.sqlitedecl.}; a2: pointer): pointer = sqlite3_api.wal_hook(a1, xWal, a2)
  template sqlite3_blob_reopen*(a1: ptr sqlite3_blob; a2: int64): cint = sqlite3_api.blob_reopen(a1, a2)
  template sqlite3_vtab_config*(a1: ptr sqlite3; op: cint): cint = sqlite3_api.vtab_config(a1, op)
  template sqlite3_vtab_on_conflict*(a1: ptr sqlite3): cint = sqlite3_api.vtab_on_conflict(a1) 
  template sqlite3_close_v2*(a1: ptr sqlite3): cint = sqlite3_api.close_v2(a1)
  template sqlite3_db_filename*(a1: ptr sqlite3; a2: cstring): cstring = sqlite3_api.db_filename(a1, a2)
  template sqlite3_db_readonly*(a1: ptr sqlite3; a2: cstring): cint = sqlite3_api.db_readonly(a1, a2)
  template sqlite3_db_release_memory*(a1: ptr sqlite3): cint = sqlite3_api.db_release_memory(a1)
  template sqlite3_errstr*(a1: cint): cstring = sqlite3_api.errstr(a1)
  template sqlite3_stmt_busy*(a1: ptr sqlite3_stmt): cint = sqlite3_api.stmt_busy(a1)
  template sqlite3_stmt_readonly*(a1: ptr sqlite3_stmt): cint = sqlite3_api.stmt_readonly(a1)
  template sqlite3_stricmp*(a1: cstring; a2: cstring): cint = sqlite3_api.stricmp(a1, a2)
  template sqlite3_uri_boolean*(a1: cstring; a2: cstring; a3: cint): cint = sqlite3_api.uri_boolean(a1, a2, a3)
  template sqlite3_uri_int64*(a1: cstring; a2: cstring; a3: int64): int64 = sqlite3_api.uri_int64(a1, a2, a3)
  template sqlite3_uri_parameter*(a1: cstring; a2: cstring): cstring = sqlite3_api.uri_parameter(a1, a2)
  template sqlite3_xvsnprintf*(a1: cint; a2: cstring; a3: cstring; a4: va_list): cstring = sqlite3_api.xvsnprintf(a1, a2, a3, a4)
  template sqlite3_wal_checkpoint_v2*(a1: ptr sqlite3; a2: cstring; a3: cint; a4: ptr cint; a5: ptr cint): cint = sqlite3_api.wal_checkpoint_v2(a1, a2, a3, a4, a5)
  template sqlite3_auto_extension*(a1: proc () {.sqlitedecl.}): cint = sqlite3_api.auto_extension(a1)
  template sqlite3_bind_blob64*(a1: ptr sqlite3_stmt; a2: cint; a3: pointer; a4: uint64; a5: proc (a1: pointer) {.sqlitedecl.}): cint = sqlite3_api.bind_blob64(a1, a2, a3, a4, a5)
  template sqlite3_bind_text64*(a1: ptr sqlite3_stmt; a2: cint; a3: cstring; a4: uint64; a5: proc (a1: pointer) {.sqlitedecl.}; a6: cuchar): cint = sqlite3_api.bind_text64(a1, a2, a3, a4, a5, a6)
  template sqlite3_cancel_auto_extension*(a1: proc () {.sqlitedecl.}): cint = sqlite3_api.cancel_auto_extension(a1)
  template sqlite3_load_extension*(a1: ptr sqlite3; a2: cstring; a3: cstring; a4: ptr cstring): cint = sqlite3_api.load_extension(a1, a2, a3, a4)
  template sqlite3_malloc64*(a1: uint64): pointer = sqlite3_api.malloc64(a1)
  template sqlite3_msize*(a1: pointer): uint64 = sqlite3_api.msize(a1)
  template sqlite3_realloc64*(a1: pointer; a2: uint64): pointer = sqlite3_api.realloc64(a1, a2)
  template sqlite3_reset_auto_extension*(): void = sqlite3_api.reset_auto_extension()
  template sqlite3_result_blob64*(a1: ptr sqlite3_context; a2: pointer; a3: uint64; a4: proc (a1: pointer) {.sqlitedecl.}): void = sqlite3_api.result_blob64(a1, a2, a3, a4)
  template sqlite3_result_text64*(a1: ptr sqlite3_context; a2: cstring; a3: uint64; a4: proc (a1: pointer) {.sqlitedecl.}; a5: cuchar): void = sqlite3_api.result_text64(a1, a2, a3, a4, a5)
  template sqlite3_strglob*(a1: cstring; a2: cstring): cint = sqlite3_api.strglob(a1, a2)
  template sqlite3_value_dup*(a1: ptr sqlite3_value): ptr sqlite3_value = sqlite3_api.value_dup(a1)
  template sqlite3_value_free*(a1: ptr sqlite3_value): void = sqlite3_api.value_free(a1)
  template sqlite3_result_zeroblob64*(a1: ptr sqlite3_context; a2: uint64): cint = sqlite3_api.result_zeroblob64(a1, a2)
  template sqlite3_bind_zeroblob64*(a1: ptr sqlite3_stmt; a2: cint; a3: uint64): cint = sqlite3_api.bind_zeroblob64(a1, a2, a3)
  template sqlite3_value_subtype*(a1: ptr sqlite3_value): cuint = sqlite3_api.value_subtype(a1)
  template sqlite3_result_subtype*(a1: ptr sqlite3_context; a2: cuint): void = sqlite3_api.result_subtype(a1, a2)
  template sqlite3_status64*(a1: cint; a2: ptr int64; a3: ptr int64; a4: cint): cint = sqlite3_api.status64(a1, a2, a3, a4)
  template sqlite3_strlike*(a1: cstring; a2: cstring; a3: cuint): cint = sqlite3_api.strlike(a1, a2, a3)
  template sqlite3_db_cacheflush*(a1: ptr sqlite3): cint = sqlite3_api.db_cacheflush(a1)
  template sqlite3_system_errno*(a1: ptr sqlite3): cint = sqlite3_api.system_errno(a1)
  template sqlite3_trace_v2*(a1: ptr sqlite3; a2: cuint; a3: proc (a1: cuint; a2: pointer; a3: pointer; a4: pointer): cint {.sqlitedecl.}; a4: pointer): cint = sqlite3_api.trace_v2(a1, a2, a3, a4)
  template sqlite3_expanded_sql*(a1: ptr sqlite3_stmt): cstring = sqlite3_api.expanded_sql(a1)
  template sqlite3_set_last_insert_rowid*(a1: int64): void = sqlite3_api.set_last_insert_rowid(a1)
  template sqlite3_prepare_v3*(a1: ptr sqlite3; a2: cstring; a3: cint; a4: cuint; a5: ptr ptr sqlite3_stmt; a6: ptr cstring): cint = sqlite3_api.prepare_v3(a1, a2, a3, a4, a5, a6)
  template sqlite3_prepare16_v3*(a1: ptr sqlite3; a2: pointer; a3: cint; a4: cuint; a5: ptr ptr sqlite3_stmt; a6: ptr pointer): cint = sqlite3_api.prepare16_v3(a1, a2, a3, a4, a5, a6)
  template sqlite3_bind_pointer*(a1: ptr sqlite3_stmt; a2: cint; a3: pointer; a4: cstring; a5: proc (a1: pointer) {.sqlitedecl.}): cint = sqlite3_api.bind_pointer(a1, a2, a3, a4, a5)
  template sqlite3_result_pointer*(a1: ptr sqlite3_context; a2: pointer; a3: cstring; a4: proc (a1: pointer) {.sqlitedecl.}): void = sqlite3_api.result_pointer(a1, a2, a3, a4)
  template sqlite3_value_pointer*(a1: ptr sqlite3_value; a2: cstring): pointer = sqlite3_api.value_pointer(a1, a2)
  template sqlite3_vtab_nochange*(a1: ptr sqlite3_context): cint = sqlite3_api.vtab_nochange(a1)
  template sqlite3_value_nochange*(a1: ptr sqlite3_value): cint = sqlite3_api.value_nochange(a1)
  template sqlite3_vtab_collation*(a1: ptr sqlite3_index_info; a2: cint): cstring = sqlite3_api.vtab_collation(a1, a2)
  template sqlite3_keyword_count*(): cint = sqlite3_api.keyword_count()
  template sqlite3_keyword_name*(a1: cint; a2: ptr cstring; a3: ptr cint): cint = sqlite3_api.keyword_name(a1, a2, a3)
  template sqlite3_keyword_check*(a1: cstring; a2: cint): cint = sqlite3_api.keyword_check(a1, a2)
  template sqlite3_str_new*(a1: ptr sqlite3): ptr sqlite3_str = sqlite3_api.str_new(a1)
  template sqlite3_str_finish*(a1: ptr sqlite3_str): cstring = sqlite3_api.str_finish(a1)
  template sqlite3_str_appendf*(a1: ptr sqlite3_str; zFormat: cstring) = sqlite3_api.str_appendf(a1, zFormat)
  template sqlite3_str_vappendf*(a1: ptr sqlite3_str; zFormat: cstring; a3: va_list) = sqlite3_api.str_vappendf(a1, zFormat, a3)
  template sqlite3_str_append*(a1: ptr sqlite3_str; zIn: cstring; N: cint) = sqlite3_api.str_append(a1, zIn, N)
  template sqlite3_str_appendall*(a1: ptr sqlite3_str; zIn: cstring) = sqlite3_api.str_appendall(a1, zIn)
  template sqlite3_str_appendchar*(a1: ptr sqlite3_str; N: cint; C: cchar) = sqlite3_api.str_appendchar(a1, N, C)
  template sqlite3_str_reset*(a1: ptr sqlite3_str) = sqlite3_api.str_reset(a1)
  template sqlite3_str_errcode*(a1: ptr sqlite3_str): cint = sqlite3_api.str_errcode(a1)
  template sqlite3_str_length*(a1: ptr sqlite3_str): cint = sqlite3_api.str_length(a1)
  template sqlite3_str_value*(a1: ptr sqlite3_str): cstring = sqlite3_api.str_value(a1)
  template sqlite3_create_window_function*(a1: ptr sqlite3; a2: cstring; a3: cint; a4: cint; a5: pointer; xStep: proc (a1: ptr sqlite3_context; a2: cint; a3: ptr ptr sqlite3_value) {.sqlitedecl.}; xFinal: proc (a1: ptr sqlite3_context) {.sqlitedecl.}; xValue: proc (a1: ptr sqlite3_context) {.sqlitedecl.}; xInv: proc (a1: ptr sqlite3_context; a2: cint; a3: ptr ptr sqlite3_value) {.sqlitedecl.}; xDestroy: proc (a1: pointer) {.sqlitedecl.}): cint = sqlite3_api.create_window_function(a1, a2, a3, a4, a5, xStep, xFinal, xValue, xInv, xDestroy)
  template sqlite3_normalized_sql*(a1: ptr sqlite3_stmt): cstring = sqlite3_api.normalized_sql(a1)
  template sqlite3_stmt_isexplain*(a1: ptr sqlite3_stmt): cint = sqlite3_api.stmt_isexplain(a1)
  template sqlite3_value_frombind*(a1: ptr sqlite3_value): cint = sqlite3_api.value_frombind(a1)
  template sqlite3_drop_modules*(a1: ptr sqlite3; a2: ptr cstring): cint = sqlite3_api.drop_modules(a1, a2)
  template sqlite3_hard_heap_limit64*(a1: int64): int64 = sqlite3_api.hard_heap_limit64(a1)
  template sqlite3_uri_key*(a1: cstring; a2: cstring): cstring = sqlite3_api.uri_key(a1, a2)
  template sqlite3_filename_database*(a1: cstring): cstring = sqlite3_api.filename_database(a1)
  template sqlite3_filename_journal*(a1: cstring): cstring = sqlite3_api.filename_journal(a1)
  template sqlite3_filename_wal*(a1: cstring): cstring = sqlite3_api.filename_wal(a1)
  template sqlite3_create_filename*(a1: cstring; a2: cstring; a3: cstring; a4: cint; a5: ptr cstring): cstring = sqlite3_api.create_filename(a1, a2, a3, a4, a5)
  template sqlite3_free_filename*(a1: cstring) = sqlite3_api.free_filename(a1)
  template sqlite3_database_file_object*(a1: cstring): ptr sqlite3_file = sqlite3_api.database_file_object(a1)
  template sqlite3_txn_state*(a1: ptr sqlite3; a2: cstring): cint = sqlite3_api.txn_state(a1, a2)
  template sqlite3_changes64*(a1: ptr sqlite3): int64 = sqlite3_api.changes64(a1)
  template sqlite3_total_changes64*(a1: ptr sqlite3): int64 = sqlite3_api.total_changes64(a1)
  template sqlite3_autovacuum_pages*(a1: ptr sqlite3; a2: proc (a1: pointer; a2: cstring; a3: cuint; a4: cuint; a5: cuint): cuint {.sqlitedecl.}): cint = sqlite3_api.autovacuum_pages(a1, a2)
  template sqlite3_error_offset*(a1: ptr sqlite3): cint = sqlite3_api.error_offset(a1)
  template sqlite3_vtab_rhs_value*(a1: ptr sqlite3_index_info; a2: cint; a3: ptr ptr sqlite3_value): cint = sqlite3_api.vtab_rhs_value(a1, a2, a3)
  template sqlite3_vtab_distinct*(a1: ptr sqlite3_index_info): cint = sqlite3_api.vtab_distinct(a1)
  template sqlite3_vtab_in*(a1: ptr sqlite3_index_info; a2: cint): cint = sqlite3_api.vtab_in(a1, a2)
  template sqlite3_vtab_in_first*(a1: ptr sqlite3_value; a2: ptr ptr sqlite3_value): cint = sqlite3_api.vtab_in_first(a1, a2)
  template sqlite3_vtab_in_next*(a1: ptr sqlite3_value; a2: ptr ptr sqlite3_value): cint = sqlite3_api.vtab_in_next(a1, a2)
  template sqlite3_deserialize*(a1: ptr sqlite3; a2: cstring; a3: ptr cuchar; a4: int64; a5: int64; a6: cuint): cint = sqlite3_api.deserialize(a1, a2, a3, a4, a5, a6)
  template sqlite3_serialize*(a1: ptr sqlite3; a2: cstring; a3: ptr int64; a4: cuint): ptr cuchar = sqlite3_api.serialize(a1, a2, a3, a4)
  template sqlite3_db_name*(a1: ptr sqlite3; a2: cint): cstring = sqlite3_api.db_name(a1, a2)
  template sqlite3_value_encoding*(a1: ptr sqlite3_value): cint = sqlite3_api.value_encoding(a1)
  
else:
  export sqlite3_gen

  template SQLITE_EXTENSION_INIT*(v) = discard

  {.compile: "sqlite3_abi/sqlite3.c".}

  proc sqlite3_auto_extension*(xEntryPoint: sqlite3_loadext_entry): cint {.importc, sqlitedecl.}
    ## ```
    ##   * CAPI3REF: Automatically Load Statically Linked Extensions
    ##  *
    ##  * ^This interface causes the xEntryPoint() function to be invoked for
    ##  * each new [database connection] that is created.  The idea here is that
    ##  * xEntryPoint() is the entry point for a statically linked [SQLite extension]
    ##  * that is to be automatically loaded into all new database connections.
    ##  *
    ##  * ^(Even though the function prototype shows that xEntryPoint() takes
    ##  * no arguments and returns void, SQLite invokes xEntryPoint() with three
    ##  * arguments and expects an integer result as if the signature of the
    ##  * entry point where as follows:
    ##  *
    ##  * <blockquote><pre>
    ##  * &nbsp;  int xEntryPoint(
    ##  * &nbsp;    sqlite3db,
    ##  * &nbsp;    const char*pzErrMsg,
    ##  * &nbsp;    const struct sqlite3_api_routinespThunk
    ##  * &nbsp;  );
    ##  * </pre></blockquote>)^
    ##  *
    ##  * If the xEntryPoint routine encounters an error, it should makepzErrMsg
    ##  * point to an appropriate error message (obtained from [sqlite3_mprintf()])
    ##  * and return an appropriate [error code].  ^SQLite ensures thatpzErrMsg
    ##  * is NULL before calling the xEntryPoint().  ^SQLite will invoke
    ##  * [sqlite3_free()] onpzErrMsg after xEntryPoint() returns.  ^If any
    ##  * xEntryPoint() returns an error, the [sqlite3_open()], [sqlite3_open16()],
    ##  * or [sqlite3_open_v2()] call that provoked the xEntryPoint() will fail.
    ##  *
    ##  * ^Calling sqlite3_auto_extension(X) with an entry point X that is already
    ##  * on the list of automatic extensions is a harmless no-op. ^No entry point
    ##  * will be called more than once for each database connection that is opened.
    ##  *
    ##  * See also: [sqlite3_reset_auto_extension()]
    ##  * and [sqlite3_cancel_auto_extension()]
    ## ```


