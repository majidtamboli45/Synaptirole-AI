import QtQuick
import "."

Rectangle {
    id: root
    property string skillName: ""
    property real score: 0
    property bool improving: true
    property color barColor: Theme.primary

    width: parent ? parent.width : 300
    height: 52
    radius: 12
    color: "#fbfbfe"
    border.color: Theme.border

    Row {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 12

        Rectangle {
            width: 34; height: 34; radius: 9
            color: Qt.rgba(root.barColor.r, root.barColor.g, root.barColor.b, 0.14)
            anchors.verticalCenter: parent.verticalCenter
            Text {
                anchors.centerIn: parent
                text: root.skillName.length > 0 ? root.skillName.charAt(0).toUpperCase() : "?"
                font.family: Theme.fontName
                font.pixelSize: 15
                font.weight: Font.Bold
                color: root.barColor
            }
        }

        Column {
            width: parent.width - 34 - 70 - 24
            spacing: 7
            anchors.verticalCenter: parent.verticalCenter
            Text {
                text: root.skillName
                font.family: Theme.fontName
                font.pixelSize: 13
                font.weight: Font.Medium
                color: Theme.text
            }
            Rectangle {
                width: parent.width
                height: 6
                radius: 3
                color: "#edeef5"
                Rectangle {
                    width: parent.width * Math.min(root.score, 100) / 100
                    height: parent.height
                    radius: 3
                    color: root.barColor
                    Behavior on width { NumberAnimation { duration: 500; easing.type: Easing.OutCubic } }
                }
            }
        }

        Column {
            width: 58
            spacing: 2
            anchors.verticalCenter: parent.verticalCenter
            Row {
                spacing: 4
                Text {
                    text: root.score + "%"
                    font.family: Theme.fontName
                    font.pixelSize: 13
                    font.weight: Font.Bold
                    color: Theme.text
                }
                Text {
                    text: root.improving ? "\u2191" : "\u2193"
                    font.pixelSize: 13
                    font.weight: Font.Bold
                    color: root.improving ? "#16a34a" : "#dc2626"
                }
            }
        }
    }
}
