file(GLOB_RECURSE SOURCES *.cpp *.h papyros-settings.qrc)

add_executable(papyros-settings ${SOURCES})
target_link_libraries(papyros-settings
                      Qt5::Core
                      Qt5::Qml
                      Qt5::Quick
                      Papyros::Core)

install(TARGETS papyros-settings
        DESTINATION ${CMAKE_INSTALL_BINDIR})
