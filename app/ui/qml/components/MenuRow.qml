import QtQuick

Rectangle {
    id: root
    property string icon: ""
    property string label: ""
    signal activated()

    width: parent ? parent.width : 180
    height: 38
    radius: 8
    color: area.containsMouse ? "#f3f0ff" : "transparent"

    Row {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 12
        spacing: 10
        Text {
            text: root.icon
            font.pixelSize: 14
            anchors.verticalCenter: parent.verticalCenter
        }
        Text {
            text: root.label
            font.family: Theme.fontName
            font.pixelSize: 13
            color: Theme.text
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    MouseArea {
        id: area
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: root.activated()
    }
}
