/*
 * System Settings - Settings app for Papyros
 * Copyright (C) 2016 Michael Spencer <sonrisesoftware@gmail.com>
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
import Papyros.Desktop 0.1

Item {
    default property alias contents: column.children

    property alias showApplyButton: applyButton.visible
    property alias enableApplyButton: applyButton.enabled

    signal apply()

    View {
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            topMargin: Units.dp(32)
        }

        width: Math.min(parent.width - 2 * anchors.topMargin, Units.dp(600))

        elevation: 1
        height: column.implicitHeight

        Column {
            id: column
            anchors.fill: parent
        }
    }

    Button {
        id: applyButton
        anchors {
            margins: Units.dp(32)
            bottom: parent.bottom
            right: parent.right
        }

        elevation: 1
        backgroundColor: Palette.colors["blue"]["500"]
        text: "Apply"
        visible: false

        onClicked: apply()
    }
}
