import QtQuick 2.2
import Material 0.1

Button {
    id: item

    property alias iconName: icon.name
    property alias name: label.text

    width: units.dp(100)
    height: units.dp(80)

    Column {
        id: column
        anchors.centerIn: parent
        spacing: units.dp(8)

        Icon {
            id: icon

            anchors.horizontalCenter: parent.horizontalCenter
            size: units.dp(40)
        }

        Label {
            id: label

            anchors.horizontalCenter: parent.horizontalCenter
            //style: "subheading"
        }
    }
}
