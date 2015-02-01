QT += quick qml
!no_desktop: QT += widgets

SOURCES += src/main.cpp

OTHER_FILES = COPYING \
    README.md

RESOURCES += papyros-settings.qrc

target.path = /usr/bin

desktop.files = papyros-settings.desktop
desktop.path = /usr/share/applications

INSTALLS += target desktop
