import QtQuick
import "."

Item {
    id: root
    property string label: ""
    property string subtitle: ""
    property alias model: combo.model
    property alias currentIndex: combo.currentIndex

    width: parent ? parent.width : 300
    height: Math.max(52, subText.visible ? 66 : 52)

    Column {
        anchors.left: parent.left
        anchors.right: combo.right
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

    AppComboBox {
        id: combo
        width: 190
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        height: 40
    }
}
