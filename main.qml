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
                    text: "Appearance"
                }

                SettingsIcon {
                    iconName: "social/notifications_none"
                    text: "Notifications"
                }

                SettingsIcon {
                    iconName: "action/account_circle"
                    text: "Online Accounts"
                }

                SettingsIcon {
                    iconName: "action/search"
                    text: "Search"
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
                    text: "Bluetooth"
                }

                SettingsIcon {
                    iconName: "hardware/desktop_windows"
                    text: "Displays"
                }

                SettingsIcon {
                    iconName: "hardware/keyboard"
                    text: "Keyboard"
                }

                SettingsIcon {
                    iconName: "hardware/mouse"
                    text: "Mouse"
                }

                SettingsIcon {
                    iconName: "device/network_wifi"
                    text: "Network"
                }

                SettingsIcon {
                    iconName: "device/battery_80"
                    text: "Power"
                }

                SettingsIcon {
                    iconName: "action/print"
                    text: "Printers"
                }

                SettingsIcon {
                    iconName: "av/volume_up"
                    text: "Sound"
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
                    text: "Date & Time"
                }

                SettingsIcon {
                    iconName: "action/settings"
                    text: "Details"
                }

                SettingsIcon {
                    iconName: "social/share"
                    text: "Sharing"
                }

                SettingsIcon {
                    iconName: "action/accessibility"
                    text: "Accessibility"
                }

                SettingsIcon {
                    iconName: "action/account_child"
                    text: "Users"
                }
            }
        }
    }
}
