import QtQuick 2.2
import Material 0.1

Item {
    id: item

    property alias iconName: icon.name
    property alias text: label.text

    signal clicked()

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

    Ink {
        anchors.centerIn: parent
        width: units.dp(120)
        height: width

        onClicked: item.clicked()
        circular: true
    }
}
