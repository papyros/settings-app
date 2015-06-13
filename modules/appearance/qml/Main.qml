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
import QtQuick 2.2
import Material 0.1
import Material.ListItems 0.1 as ListItem
import Papyros.Desktop 0.1

Item {
    Button {
        id: button

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            bottom: column.top
            margins: Units.dp(16)
        }

        width: backgroundColumn.width + 2 * anchors.margins
        elevation: 1

        onClicked: print(ShellSettings.desktop.backgroundUrl)

        Column {
            id: backgroundColumn
            anchors.centerIn: parent
            spacing: Units.dp(8)
            height: button.height - Units.dp(24)

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                source: ShellSettings.desktop.backgroundUrl
                width: height * sourceSize.width/sourceSize.height
                height: parent.height - parent.spacing - label.height

                Component.onCompleted: print(source)
            }

            Label {
                id: label

                text: "Background"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    Column {
        id: column

        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            margins: Units.dp(16)
        }

        width: Math.min(Units.dp(400), parent.width - anchors.margins * 2)

        ListItem.Standard {
            text: "Transparent app shelf"
            interactive: false

            secondaryItem: Switch {
                anchors.centerIn: parent

                checked: ShellSettings.appShelf.transparentShelf
                onCheckedChanged: {
                    ShellSettings.appShelf.transparentShelf = checked
                    checked = Qt.binding(function() {
                        return ShellSettings.appShelf.transparentShelf
                    })
                }
            }
        }

        ListItem.Standard {
            text: "Accent color"
            tintColor: "transparent"

            onClicked: colorPicker.open()

            secondaryItem: Rectangle {
                anchors.centerIn: parent

                radius: Units.dp(2)
                width: Units.dp(24)
                height: width
                color: Palette.colors[ShellSettings.desktop.accentColor]['500']
                border.color: Palette.colors[ShellSettings.desktop.accentColor]['700']
            }
        }
    }

    Dialog {
        id: colorPicker
        title: "Accent Color"

        property var selectedColor: ShellSettings.desktop.accentColor

        positiveButton.visible: false

        Grid {
            columns: 7
            spacing: Units.dp(8)

            Repeater {
                model: [
                    "red", "pink", "purple", "deepPurple", "indigo",
                    "blue", "lightBlue", "cyan", "teal", "green",
                    "lightGreen", "lime", "yellow", "amber", "orange",
                    "deepOrange", "grey", "blueGrey", "brown", "black",
                    "white"
                ]

                View {
                    width: Units.dp(30)
                    height: width
                    radius: Units.dp(2)
                    backgroundColor: Palette.colors[modelData]["500"]
                    border.color: Palette.colors[modelData]["700"]
                            ? Palette.colors[modelData]["700"] : "#ddd"

                    tintColor: ink.containsMouse ? border.color
                                                 : "transparent"

                    Ink {
                        id: ink
                        anchors.fill: parent

                        onClicked: {
                            ShellSettings.desktop.accentColor = modelData
                            colorPicker.close()
                        }
                    }
                }
            }
        }
    }
}
