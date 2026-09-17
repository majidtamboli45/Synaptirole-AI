import QtQuick
import "."

Rectangle {
    id: root
    property string skill: ""
    property string status: "matched"   // matched | partial | gap
    property string priority: ""        // HIGH | MEDIUM | LOW | ""

    implicitHeight: 28
    radius: 14
    color: "transparent"
    border.color: _border
    border.width: 1

    property color _color: root.status === "matched" ? "#16a34a"
                            : root.status === "partial" ? "#d97706"
                            : "#dc2626"
    property color _border: root.status === "matched" ? "#bbf7d0"
                            : root.status === "partial" ? "#fde68a"
                            : "#fecaca"

    Row {
        anchors.centerIn: parent
        spacing: 6

        Rectangle {
            width: 8; height: 8; radius: 4
            color: _color
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            text: root.skill
            font.family: Theme.fontName
            font.pixelSize: 12
            font.weight: Font.Medium
            color: root.status === "matched" ? "#166534"
                    : root.status === "partial" ? "#92400e"
                    : "#991b1b"
            anchors.verticalCenter: parent.verticalCenter
        }

        PriorityBadge {
            visible: root.priority !== ""
            priority: root.priority
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}