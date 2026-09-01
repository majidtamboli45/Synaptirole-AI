import QtQuick
import QtQuick.Layouts
import "."

Rectangle {
    id: root
    property string title: ""
    property string description: ""

    width: parent ? parent.width : 400
    height: headerCol.implicitHeight

    Column {
        id: headerCol
        anchors.left: parent.left
        anchors.right: parent.right
        spacing: 4
        Text {
            text: root.title
            font.family: Theme.fontName
            font.pixelSize: 24
            font.weight: Font.Bold
            color: Theme.text
        }
        Text {
            visible: root.description !== ""
            text: root.description
            font.family: Theme.fontName
            font.pixelSize: 13
            color: Theme.muted
        }
    }
}
