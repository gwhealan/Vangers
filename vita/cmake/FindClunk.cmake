# Find Clunk

set(CLUNK_DIR ${CMAKE_CURRENT_SOURCE_DIR}/clunk)
set(CLUNK_LIB clunk)

add_subdirectory(${CLUNK_DIR} clunk)

get_filename_component(CLUNK_INCLUDE_DIR ${CLUNK_DIR} DIRECTORY)
set(CLUNK_LIBRARY ${CLUNK_LIB})