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

Page {
    id: modulePage

    title: module.name

    property var module

    Loader {
        id: loader
        anchors.fill: parent

        source: module.componentUrl
        asynchronous: true
        visible: loader.status == Loader.Ready
    }

    ProgressCircle {
        anchors.centerIn: parent
        visible: loader.status == Loader.Loading
    }

    Column {
        anchors.centerIn: parent
        visible: loader.status == Loader.Error

        spacing: Units.dp(8)

        Icon {
            name: "alert/warning"
            color: Palette.colors['red']['500']
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            text: "Unable to load the %1 settings".arg(module.name)
            style: "subheading"
            color: Theme.light.subTextColor
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
