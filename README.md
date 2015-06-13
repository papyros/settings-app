Papyros Settings
================

The system settings app for Papyros.

### Module Architecture ###

Modules are installed under `/usr/share/papyros-settings/modules` in a directory with the module's reverse-domain name, such as `io.papyros.settings.appearance`. Each module consists of a `metadata.json` file, a `Main.qml` file, and any additional QML resources.

### Dependencies ###

 * Qt 5.4 or higher
 * [Papyros Shell](https://github.com/papyros/papyros-shell)

### Installation ###

Once the necessary dependencies are installed, you can build and install the Settings app as follows:

    mkdir build; cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make && sudo make install

And then run the settings app:

    papyros-settings
