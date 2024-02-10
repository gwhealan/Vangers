# Find VorbisFile

find_path(VORBISFILE_INCLUDE_DIR
    NAME vorbisfile.h
    PATH_SUFFIXES vorbis
)

find_library(VORBISFILE_LIBRARY vorbisfile)

find_package(PackageHandleStandardArgs QUIET REQUIRED)
find_package_handle_standard_args(VorbisFile
    REQUIRED_VARS VORBISFILE_INCLUDE_DIR VORBISFILE_LIBRARY
)