Papyros Settings
================

[![Join the chat at https://gitter.im/papyros/core-apps](https://badges.gitter.im/papyros/core-apps.svg)](https://gitter.im/papyros/core-apps?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

The system settings app for Papyros. This is mostly a proof-of-concept right now, with very few settings modules. Feel free to contribute new ones or improve the existing ones!

Brought to you by the [Papyros development team](https://github.com/papyros/settings-app/graphs/contributors).

### Module Architecture ###

Modules are installed under `/usr/share/papyros-settings/modules` in a directory with the module's reverse-domain name, such as `io.papyros.settings.appearance`. Each module consists of a `metadata.json` file, a `Main.qml` file, and any additional QML resources.

### Dependencies ###

 * Qt 5.4 or higher
 * [Papyros Shell](https://github.com/papyros/papyros-shell)
 * [libpapyros](https://github.com/papyros/libpapyros)
 * [QtAccountsService](https://github.com/hawaii-desktop/qtaccountsservice)
 * [Extra CMake Modules](https://projects.kde.org/projects/kdesupport/extra-cmake-modules)

### Installation ###

Once the necessary dependencies are installed, you can build and install the Settings app as follows:

    mkdir build; cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make && sudo make install

And then run the settings app:

    papyros-settings

### Licensing

Papyros terminal is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
