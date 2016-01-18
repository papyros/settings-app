/*
 * System Settings - Settings app for Papyros
 * Copyright (C) 2015 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.4
import Material 0.2
import Material.ListItems 0.1 as ListItem
import io.papyros.settings 0.1
import Papyros.Core 0.1

ApplicationWindow {
    title: "Settings"

    theme {
        primaryColor: Palette.colors.blueGrey["700"]
        primaryDarkColor: Palette.colors.blueGrey["800"]
    }

    Component.onCompleted: visible = true

    initialPage: Page {
        title: "Settings"

        actions: [
            Action {
                iconName: "action/search"
                name: "Search"
            }
        ]

        Sidebar {
            id: sidebar
            mode: 'left'

            Column {
                anchors {
                    left: parent.left
                    right: parent.right
                }

                Subheader {
                    text: "Personal"
                    textColor: Theme.accentColor
                }

                Repeater {
                    id: personalRepeater
                    model: moduleManager.personalModules

                    delegate: ListItem.Standard {
                        iconSource: edit.iconSource
                        text: edit.name
                        selected: moduleContainer.module == edit
                        onClicked: moduleContainer.module = edit
                        showDivider: index == personalRepeater.count - 1
                        dividerInset: 0
                        visible: developerSettings.developerMode == "true" || !edit.developerOnly
                    }
                }

                Subheader {
                    text: "Hardware"
                    textColor: Theme.accentColor
                }

                Repeater {
                    id: hardwareRepeater
                    model: moduleManager.hardwareModules

                    delegate: ListItem.Standard {
                        iconSource: edit.iconSource
                        text: edit.name
                        selected: moduleContainer.module == edit
                        onClicked: moduleContainer.module = edit
                        showDivider: index == hardwareRepeater.count - 1
                        dividerInset: 0
                        visible: developerSettings.developerMode == "true" || !edit.developerOnly
                    }
                }

                Subheader {
                    text: "System"
                    textColor: Theme.accentColor
                }

                Repeater {
                    id: systemRepeater
                    model: moduleManager.systemModules

                    delegate: ListItem.Standard {
                        iconSource: edit.iconSource
                        text: edit.name
                        selected: moduleContainer.module == edit
                        onClicked: moduleContainer.module = edit
                        visible: developerSettings.developerMode == "true" || !edit.developerOnly
                    }
                }
            }
        }

        ModuleContainer {
            id: moduleContainer

            anchors {
                left: sidebar.right
                right: parent.right
                top: parent.top
                bottom: parent.bottom
            }

            module: personalRepeater.count > 0
                    ? session.selectedModule ? moduleManager.getModule(session.selectedModule)
                                             :  moduleManager.personalModules.get(0)
                    : undefined

            onModuleChanged: {
                if (module)
                    session.selectedModule = module.id
            }
        }
    }

    ModuleManager {
        id: moduleManager
    }

    KQuickConfig {
        id: session

        file: "papyros-settings"
        group: "session"
        defaults: {
            "selectedModule": ""
        }
    }

    KQuickConfig {
        id: developerSettings

        file: "papyros"
        group: "developer"
        defaults: {
            "developerMode": "false"
        }
    }
}
