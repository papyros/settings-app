file(GLOB_RECURSE SOURCES *.cpp *.h)
file(GLOB_RECURSE QML_SOURCES *.qml)

add_executable(papyros-settings ${SOURCES})
target_link_libraries(papyros-settings
                      Qt5::Quick)

install(TARGETS papyros-settings
        DESTINATION ${CMAKE_INSTALL_BINDIR})

install(FILES ${QML_SOURCES}
        DESTINATION ${CMAKE_INSTALL_DATADIR}/papyros-settings/app)
