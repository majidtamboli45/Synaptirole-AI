import QtQuick
import QtQuick.Controls
import "."

Item {
    id: root
    property string label: ""
    property string subtitle: ""
    property alias checked: sw.checked

    signal toggled(bool checked)
    width: parent ? parent.width : 300
    height: Math.max(46, subText.visible ? 56 : 40)

    Column {
        anchors.left: parent.left
        anchors.right: sw.left
        anchors.rightMargin: 16
        anchors.verticalCenter: parent.verticalCenter
        spacing: 3
        Text {
            text: root.label
            font.family: Theme.fontName
            font.pixelSize: 14
            font.weight: Font.Medium
            color: Theme.text
        }
        Text {
            id: subText
            visible: root.subtitle !== ""
            text: root.subtitle
            font.family: Theme.fontName
            font.pixelSize: 12
            color: Theme.muted
            wrapMode: Text.WordWrap
            width: parent.width
        }
    }

    Switch {
        id: sw
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        indicator: Rectangle {
            implicitWidth: 46
            implicitHeight: 26
            radius: 13
            color: sw.checked ? Theme.primary : "#cbd5e1"
            Behavior on color { ColorAnimation { duration: 150 } }

            Rectangle {
                x: sw.checked ? parent.width - width - 3 : 3
                y: 3
                width: 20
                height: 20
                radius: 10
                color: "#ffffff"
                Behavior on x { NumberAnimation { duration: 150; easing.type: Easing.OutCubic } }
            }
        }
        onToggled: root.toggled(checked)
    }
}
