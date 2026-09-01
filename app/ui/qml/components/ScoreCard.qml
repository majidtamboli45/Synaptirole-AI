import QtQuick
import "."

Rectangle {
    id: root
    property string title: ""
    property string value: ""
    property string compare: ""
    property bool up: true
    property string iconText: ""
    property color iconColor: Theme.primary

    height: 118
    radius: 16
    color: Theme.card
    border.color: Theme.border

    Row {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 14

        Column {
            width: parent.width - 46 - 14
            spacing: 8
            Text {
                text: root.title
                font.family: Theme.fontName
                font.pixelSize: 13
                font.weight: Font.Medium
                color: Theme.muted
            }
            Text {
                text: root.value
                font.family: Theme.fontName
                font.pixelSize: 30
                font.weight: Font.Bold
                color: Theme.text
            }
            Row {
                spacing: 6
                Rectangle {
                    width: 22; height: 18; radius: 9
                    color: root.up ? Theme.greenSoft : Theme.redSoft
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        anchors.centerIn: parent
                        text: root.up ? "\u2191" : "\u2193"
                        color: root.up ? "#15803d" : "#b91c1c"
                        font.pixelSize: 12
                        font.weight: Font.Bold
                    }
                }
                Text {
                    text: root.compare
                    font.family: Theme.fontName
                    font.pixelSize: 12
                    color: Theme.muted
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }

        Rectangle {
            width: 46; height: 46; radius: 13
            color: Qt.rgba(root.iconColor.r, root.iconColor.g, root.iconColor.b, 0.12)
            anchors.verticalCenter: parent.verticalCenter
            Text {
                anchors.centerIn: parent
                text: root.iconText
                font.pixelSize: 21
            }
        }
    }
}
