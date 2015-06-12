#
# install_settings_module(module metadata srcpath)
#
# Installs a Papyros Settings module.
#
# \param module the module name (something like org.vendor.systempreferences.module)
# \param srcpath the source path to install from
#
macro(install_settings_module module srcpath)
    install(DIRECTORY ${srcpath}/qml/
            DESTINATION ${DATA_INSTALL_DIR}/papyros-settings/modules/${module}
            PATTERN .svn EXCLUDE
            PATTERN CMakeLists.txt EXCLUDE
            PATTERN Messages.sh EXCLUDE
            PATTERN dummydata EXCLUDE)
    install(FILES ${srcpath}/metadata.json
            DESTINATION ${DATA_INSTALL_DIR}/papyros-settings/modules/${module})
endmacro()
