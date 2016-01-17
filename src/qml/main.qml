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

ApplicationWindow {
    title: "Settings"

    theme {
        primaryColor: Palette.colors.blueGrey["600"]
        primaryDarkColor: Palette.colors.blueGrey["700"]
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

                Repeater {
                    id: moduleRepeater
                    model: moduleManager.modules

                    delegate: ListItem.Standard {
                        iconSource: edit.iconSource
                        text: edit.name
                        selected: moduleContainer.module == edit
                        onClicked: moduleContainer.module = edit
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

            module: moduleRepeater.count > 0 ? moduleManager.modules.get(0) : undefined
        }
    }

    ModuleManager {
        id: moduleManager
    }
}
