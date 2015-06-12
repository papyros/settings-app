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

Button {
    id: item

    property var module

    width: Units.dp(100)
    height: Units.dp(80)

    onClicked: {
        pageStack.push(Qt.resolvedUrl("ModulePage.qml"), {module: module})
    }

    Column {
        id: column
        anchors.centerIn: parent
        spacing: Units.dp(8)

        Icon {
            id: icon

            anchors.horizontalCenter: parent.horizontalCenter
            size: Units.dp(40)
            color: Theme.accentColor
            source: module.iconSource
        }

        Label {
            id: label

            text: module.name
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
