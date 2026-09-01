import QtQuick
import "."

Item {
    id: root
    property string label: ""
    property int value: 0
    property color barColor: Theme.primary
    property string suffix: ""

    width: parent ? parent.width : 200
    height: 40

    Column {
        anchors.fill: parent
        spacing: 6
        Item {
            width: parent.width
            height: 16
            Text {
                text: root.label
                font.family: Theme.fontName
                font.pixelSize: 13
                color: Theme.text
            }
            Text {
                anchors.right: parent.right
                text: root.value + "%" + (root.suffix !== "" ? " " + root.suffix : "")
                font.family: Theme.fontName
                font.pixelSize: 12
                font.weight: Font.DemiBold
                color: Theme.muted
            }
        }
        Rectangle {
            width: parent.width
            height: 8
            radius: 4
            color: "#edeef5"
            Rectangle {
                width: parent.width * Math.min(root.value, 100) / 100
                height: parent.height
                radius: 4
                color: root.barColor
                Behavior on width { NumberAnimation { duration: 600; easing.type: Easing.OutCubic } }
            }
        }
    }
}
