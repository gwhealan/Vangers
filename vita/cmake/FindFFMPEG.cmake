# Find FFMPEG

# find_path(AVUTIL_INCLUDE_DIR
# NAME avutil.h
#     PATH_SUFFIXES
#         libavutil
#         ffmpeg
# )

find_path(AVCODEC_INCLUDE_DIR
    NAME avcodec.h
    PATH_SUFFIXES
        libavcodec
        ffmpeg
)

find_path(AVFORMAT_INCLUDE_DIR
    NAME avformat.h
    PATH_SUFFIXES
        libavformat
        ffmpeg
)

set(FFMPEG_INCLUDE_DIRS
    ${AVUTIL_INCLUDE_DIR}
    ${AVCODEC_INCLUDE_DIR}
    ${AVFORMAT_INCLUDE_DIR}
)

# Lib Dependency Tree:
#  pthread
#  | swresample
#  | | lame
#  > > | avutil*
#  >   > > avcodec*
#        > > avformat*


# Resolve Dependencies:
find_library(LAME_LIBRARY mp3lame)
find_library(SWRESAMPLE_LIBRARY swresample)
find_library(PTHREAD_LIBRARY pthread)

set(LIBS_FOUND true)
if (NOT LAME_LIBRARY)
    set(LIBS_FOUND false)
    message(ERROR "FFMPEG: Failed to locate dependency libmp3lame.")
endif()

if (NOT SWRESAMPLE_LIBRARY)
    set(LIBS_FOUND false)
    message(ERROR "FFMPEG: Failed to locate dependency libswresample.")
endif()

if (NOT PTHREAD_LIBRARY)
    set(LIB_FOUND false)
    message(ERROR "FFMPEG: Failed to locate dependency pthread")
endif()

if (LIBS_FOUND)
    # Resolve Libraries:
    find_library(AVUTIL_LIBRARY avutil)
    find_library(AVCODEC_LIBRARY avcodec)
    find_library(AVFORMAT_LIBRARY avformat)

    if (NOT AVUTIL_LIBRARY)
        set(LIBS_FOUND false)
        message(ERROR "FFMPEG: Failed to locate libavutil.")
    endif()
    if (NOT AVCODEC_LIBRARY)
        set(LIBS_FOUND false)
        message(ERROR "FFMPEG: Failed to locate libavcodec.")
    endif()
    if (NOT AVFORMAT_LIBRARY)
        set(LIBS_FOUND false)
        message(ERROR "FFMPEG: Failed to locate libavformat.")
    endif()

    if (LIBS_FOUND)
        set(FFMPEG_LIBRARIES
        # pkg libraries:
            ${AVFORMAT_LIBRARY}
            ${AVCODEC_LIBRARY}
            ${AVUTIL_LIBRARY}
        # pkg dependencies:
            ${SWRESAMPLE_LIBRARY}
            ${LAME_LIBRARY}
            ${PTHREAD_LIBRARY}
        )
    endif()
endif()

message(STATUS "FFMPEG lib(s): ${FFMPEG_LIBRARIES}")

find_package(PackageHandleStandardArgs QUIET REQUIRED)
find_package_handle_standard_args(FFMPEG
    REQUIRED_VARS FFMPEG_INCLUDE_DIRS FFMPEG_LIBRARIES
)