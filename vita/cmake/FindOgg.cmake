# Find Ogg

find_path(OGG_INCLUDE_DIR
    NAME ogg.h
    PATH_SUFFIXES ogg
)

find_library(OGG_LIBRARY ogg)

find_package(PackageHandleStandardArgs QUIET REQUIRED)
find_package_handle_standard_args(Ogg
    REQUIRED_VARS OGG_INCLUDE_DIR OGG_LIBRARY
)