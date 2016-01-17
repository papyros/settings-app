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
import Papyros.Desktop 0.1
import io.papyros.settings 0.1

ModuleView {
    showApplyButton: true
    enableApplyButton: ShellSettings.display.multiplier != scaleSlider.value

    onApply: {
        ShellSettings.display.multiplier = scaleSlider.value
        scaleSlider.value = Qt.binding(function() {
            return ShellSettings.display.multiplier
        })
    }

    ListItem.Subtitled {
        text: "Display scale"
        valueText: scaleSlider.knobLabel
        interactive: false

        content: Slider {
            id: scaleSlider

            width: parent.width
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: Units.dp(-12)

            minimumValue: 0.1
            maximumValue: 5
            numericValueLabel: true
            stepSize: 0.1

            knobLabel: (value * 100).toFixed(0) + "%"
            value: ShellSettings.display.multiplier
        }
    }
}
