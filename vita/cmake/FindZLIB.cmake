# Find ZLIB

find_path(ZLIB_INCLUDE_DIR zlib.h)

find_library(ZLIB_LIBRARIES z zlibstatic)

find_package(PackageHandleStandardArgs QUIET REQUIRED)
find_package_handle_standard_args(ZLIB
    REQUIRED_VARS ZLIB_INCLUDE_DIR ZLIB_LIBRARIES
)