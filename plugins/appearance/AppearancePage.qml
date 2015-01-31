import QtQuick 2.2
import Material 0.1

Page {
    title: "Appearance"

    Row {
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: units.dp(32)
        }

        spacing: units.dp(32)

        Button {
            width: (parent.width - parent.spacing * 2)/3
            elevation: 1
            text: "Change Background"
        }

        Button {
            width: (parent.width - parent.spacing * 2)/3
            elevation: 1
            text: "Change Layout"
        }

        Button {
            width: (parent.width - parent.spacing * 2)/3
            elevation: 1
            text: "Change Accent Color"
        }
    }
}
