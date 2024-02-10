# Find SDL2_net
find_path(SDL2_NET_INCLUDE_DIRS
    NAME SDL_net.h
    PATH_SUFFIXES SDL2
)

find_library(SDL2_NET_LIBRARY SDL2_net)

find_package(PackageHandleStandardArgs QUIET REQUIRED)
find_package_handle_standard_args(SDL2_net
    REQUIRED_FILES SDL2_NET_INCLUDE_DIRS SDL2_NET_LIBRARY
)