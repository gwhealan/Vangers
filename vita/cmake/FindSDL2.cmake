# Find SDL2

option(USE_VITAGL "Use SDL2 with the vitagl backend" OFF)

set(SDL2_NAME SDL2)
if (USE_VITAGL)
    set(SDL2_NAME ${SDL2_NAME}GL)
endif()

find_path(SDL2_INCLUDE_DIR
    NAME SDL.h
    PATH_SUFFIXES ${SDL2_NAME}
)

find_library(SDL2_LIB ${SDL2_NAME})
find_library(SDL2MAIN_LIB ${SDL2_NAME}main)

if(USE_VITAGL)
    find_package(vitaGL REQUIRED)
endif()

set(SDL2_LIBRARY
    ${SDL2_LIB}
    ${SDL2MAIN_LIB}
    ${VITAGL_LIBRARIES}
    SceAppUtil_stub
    SceAudio_stub
    SceAudioIn_stub
    SceCtrl_stub
    SceMotion_stub
    SceGxm_stub
    SceCommonDialog_stub
    SceIme_stub
    SceDisplay_stub
    SceHid_stub
    SceTouch_stub
)

find_package(PackageHandleStandardArgs QUIET REQUIRED)
find_package_handle_standard_args(SDL2
    REQUIRED_VARS SDL2_INCLUDE_DIR SDL2_LIBRARY
)