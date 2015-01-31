import QtQuick 2.2
import Material 0.1
import Material.ListItems 0.1 as ListItem

ApplicationWindow {
    title: "Settings"

    theme {
        primaryColor: "#546e7a"
    }

    initialPage: Page {
        title: "Settings"

        actions: [
            Action {
                iconName: "action/search"
                name: "Search"
            }
        ]

        Column {
            anchors.fill: parent

            ListItem.Header {
                text: "Personal"
            }

            Flow {
                spacing: units.dp(16)

                anchors {
                    left: parent.left
                    right: parent.right
                    margins: units.dp(24)
                }

                SettingsIcon {
                    iconName: "image/image"
                    name: "Appearance"
                }

                SettingsIcon {
                    iconName: "social/notifications_none"
                    name: "Notifications"
                }

                SettingsIcon {
                    iconName: "action/account_circle"
                    name: "Online Accounts"
                }

                SettingsIcon {
                    iconName: "action/search"
                    name: "Search"
                }
            }

            ListItem.Header {
                text: "Hardware"
            }

            Flow {
                spacing: units.dp(16)

                anchors {
                    left: parent.left
                    right: parent.right
                    margins: units.dp(24)
                }

                SettingsIcon {
                    iconName: "device/bluetooth"
                    name: "Bluetooth"
                }

                SettingsIcon {
                    iconName: "hardware/desktop_windows"
                    name: "Displays"
                }

                SettingsIcon {
                    iconName: "hardware/keyboard"
                    name: "Keyboard"
                }

                SettingsIcon {
                    iconName: "hardware/mouse"
                    name: "Mouse"
                }

                SettingsIcon {
                    iconName: "device/network_wifi"
                    name: "Network"
                }

                SettingsIcon {
                    iconName: "device/battery_80"
                    name: "Power"
                }

                SettingsIcon {
                    iconName: "action/print"
                    name: "Printers"
                }

                SettingsIcon {
                    iconName: "av/volume_up"
                    name: "Sound"
                }
            }

            ListItem.Header {
                text: "System"
            }

            Flow {
                spacing: units.dp(16)

                anchors {
                    left: parent.left
                    right: parent.right
                    margins: units.dp(24)
                }

                SettingsIcon {
                    iconName: "device/access_time"
                    name: "Date & Time"
                }

                SettingsIcon {
                    iconName: "action/settings"
                    name: "Details"
                }

                SettingsIcon {
                    iconName: "social/share"
                    name: "Sharing"
                }

                SettingsIcon {
                    iconName: "action/accessibility"
                    name: "Accessibility"
                }

                SettingsIcon {
                    iconName: "action/account_child"
                    name: "Users"
                }
            }
        }
    }
}
