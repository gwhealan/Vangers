include("$ENV{VITASDK}/share/vita.cmake" REQUIRED)

set(VITA_NAME "${PROJECT_NAME}")
set(VITA_ID "VANGERS00")
set(VITA_VERSION "00.01")

set(VITA_LIVE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/vita/livearea")

vita_create_self(${PROJECT_NAME}.self src/${PROJECT_NAME})

vita_create_vpk(${PROJECT_NAME}.vpk ${VITA_ID} ${PROJECT_NAME}.self
    VERSION ${VITA_VERSION}
    NAME ${VITA_NAME}
    FILE "${VITA_LIVE_DIR}/icon.png"        sce_sys/icon0.png
    #FILE "${VITA_LIVE_DIR}/pic0.png"        sce_sys/pic0.png
    FILE "${VITA_LIVE_DIR}/bg.png"          sce_sys/livearea/contents/bg.png
    FILE "${VITA_LIVE_DIR}/startup.png"     sce_sys/livearea/contents/startup.png
    FILE "${VITA_LIVE_DIR}/template.xml"    sce_sys/livearea/contents/template.xml
)