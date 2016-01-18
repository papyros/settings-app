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
import Material.Extras 0.1
import Material.ListItems 0.1 as ListItem

ListItem.Subtitled {
    property alias iconSource: image.source
    property bool isAdminUser

    action: CircleImage {
        id: image
        anchors.centerIn: parent
        width: Units.dp(40)
        height: width

        Rectangle {
            anchors.fill: parent
            color: "transparent"
            radius: width/2
            border.color: Qt.rgba(0,0,0,0.3)
        }
    }

    secondaryItem: Icon {
        name: "action/verified_user"
        anchors.centerIn: parent
        visible: isAdminUser
    }
}
