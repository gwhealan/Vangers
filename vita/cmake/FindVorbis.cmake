# Find Vorbis

find_path(VORBIS_INCLUDE_DIR
    NAME codec.h vorbisenc.h
    PATH_SUFFIXES vorbis
)

find_library(VORBIS_LIB vorbis)
find_library(VORBISENC_LIB vorbisenc)
find_library(VORBISIDEC_LIB vorbisidec)

set(VORBIS_LIBRARY
    ${VORBIS_LIB}
    ${VORBISENC_LIB}
    ${VORBISIDEC_LIB}
)

find_package(PackageHandleStandardArgs QUIET REQUIRED)
find_package_handle_standard_args(Vorbis
    REQUIRED_VARS VORBIS_INCLUDE_DIR VORBIS_LIBRARY
)