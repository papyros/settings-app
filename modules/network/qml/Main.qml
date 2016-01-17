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
import Papyros.Network 0.1
import io.papyros.settings 0.1

ModuleView {


    property var icons: {
        "network-wireless-100-locked": "device/signal_wifi_4_bar",
        "network-wireless-80-locked": "device/signal_wifi_3_bar",
        "network-wireless-60-locked": "device/signal_wifi_2_bar",
        "network-wireless-40-locked": "device/signal_wifi_2_bar",
        "network-wireless-20-locked": "device/signal_wifi_1_bar",
        "network-wireless-0-locked": "device/signal_wifi_0_bar",
        "network-wireless-connected-100": "device/signal_wifi_4_bar",
        "network-wireless-connected-80": "device/signal_wifi_3_bar",
        "network-wireless-connected-60": "device/signal_wifi_2_bar",
        "network-wireless-connected-40": "device/signal_wifi_2_bar",
        "network-wireless-connected-20": "device/signal_wifi_1_bar",
        "network-wireless-connected-0": "device/signal_wifi_0_bar",
        "network-wired-activated": "action/settings_ethernet",
        "network-wired": "action/settings_ethernet",
        "network-vpn": "action/lock"
    }

    function statusIcon(type, signal) {
        var strength = parseInt(signal*4/100)
        switch (type) {
            case Enums.UnknownConnectionType:
            case Enums.Adsl:
            case Enums.Bluetooth:
            case Enums.Bond:
            case Enums.Bridge:
            case Enums.Cdma:
            case Enums.Gsm:
                return "device/signal_cellular_" + strength + "_bar"
            case Enums.Infiniband:
            case Enums.OLPCMesh:
            case Enums.Pppoe:
            case Enums.Vlan:
            case Enums.Vpn:
                return "action/lock"
            case Enums.Wimax:
            case Enums.Wired:
                return "action/settings_ethernet"
            case Enums.Wireless:
                // This is the only way i found to check if the item is a theadering device
                if (signal)
                    return "device/signal_wifi_" + strength + "_bar"
                else
                    return "device/wifi_tethering"
        }
    }

    ListItem.Subtitled {
        iconName: "device/signal_wifi_3_bar"
        text: "Wi-Fi"
        subText: enabledConnections.wirelessEnabled ? "Connected" : "Disabled"

        onClicked: wifiSwitch.checked = ! wifiSwitch.checked

        secondaryItem: Switch {
            id: wifiSwitch
            anchors.centerIn: parent
            checked: enabledConnections.wirelessEnabled
            onClicked: {
                handler.enableWireless(checked)
            }
        }
    }

    Subheader {
        text: "Available Networks"
        textColor: Theme.accentColor
        showDivider: true
        visible: enabledConnections.wirelessEnabled
    }

    Repeater {
        id: repeater
        model: appletProxyModel
        delegate: ConnectionListItem {
            showDivider: index < repeater.count - 1
        }
    }

    ConnectionIcon {
        id: connectionIconProvider;
    }

    NetworkStatus {
        id: networkStatus
    }

    EnabledConnections {
        id: enabledConnections;
    }

    NetworkModel {
        id: connectionModel;
    }

    AppletProxyModel {
        id: appletProxyModel;
        sourceModel: connectionModel;
    }

    Handler {
        id: handler;
    }
}
