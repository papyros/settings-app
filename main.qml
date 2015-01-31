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

            Repeater {
                model: settings

                delegate: Column {
                    anchors {
                        left: parent.left
                        right: parent.right
                    }

                    ListItem.Header {
                        text: title
                    }

                    Flow {
                        spacing: units.dp(16)

                        anchors {
                            left: parent.left
                            right: parent.right
                            margins: units.dp(24)
                        }

                        Repeater {
                            model: modelData.settings

                            delegate: SettingsIcon {
                                iconName: modelData.iconName
                                name: modelData.name
                            }
                        }
                    }
                }
            }
        }
    }

    property var settings: [
        {
            title: "Personal",
            settings: [
                {
                    iconName: "image/image",
                    name: "Appearance"
                }, {
                    iconName: "social/notifications_none",
                    name: "Notifications"
                }, {
                    iconName: "action/account_circle",
                    name: "Online Accounts"
                }, {
                    iconName: "action/search",
                    name: "Search"
                }
            ]
        },
        {
            title: "Hardware",
            settings: [
                {
                    iconName: "device/bluetooth",
                    name: "Bluetooth"
                }, {
                    iconName: "hardware/desktop_windows",
                    name: "Displays"
                }, {
                    iconName: "hardware/keyboard",
                    name: "Keyboard"
                }, {
                    iconName: "hardware/mouse",
                    name: "Mouse"
                }, {
                    iconName: "device/network_wifi",
                    name: "Network"
                }, {
                    iconName: "device/battery_80",
                    name: "Power"
                }, {
                    iconName: "action/print",
                    name: "Printers"
                }, {
                    iconName: "av/volume_up",
                    name: "Sound"
                }
            ]
        },
        {
            title: "System",
            settings: [
                {
                    iconName: "device/access_time",
                    name: "Date & Time"
                }, {
                    iconName: "action/settings",
                    name: "Details"
                }, {
                    iconName: "social/share",
                    name: "Sharing"
                }, {
                    iconName: "action/accessibility",
                    name: "Accessibility"
                }, {
                    iconName: "action/account_child",
                    name: "Users"
                }
            ]
        }
    ]
}
