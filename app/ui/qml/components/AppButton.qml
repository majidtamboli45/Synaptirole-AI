import QtQuick
import QtQuick.Controls
import "."

Button {
    id: root
    property string kind: "primary"
    property string iconText: ""

    font.family: Theme.fontName
    font.pixelSize: 14
    font.weight: Font.DemiBold
    leftPadding: 18
    rightPadding: 18
    topPadding: 10
    bottomPadding: 10
    hoverEnabled: true

    contentItem: Row {
        spacing: 8
        leftPadding: 0
        Text {
            visible: root.iconText !== ""
            text: root.iconText
            font.pixelSize: 14
            anchors.verticalCenter: parent.verticalCenter
        }
        Text {
            text: root.text
            font: root.font
            color: {
                if (root.kind === "primary") return "#ffffff"
                if (root.kind === "danger") return Theme.red
                if (root.kind === "link") return Theme.primary
                return Theme.text
            }
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    background: Rectangle {
        radius: 10
        color: {
            if (root.kind === "primary") return root.down ? Theme.primaryDark : (root.hovered ? "#8b5cf6" : Theme.primary)
            if (root.kind === "danger") return root.hovered ? Theme.redSoft : "transparent"
            if (root.kind === "link") return "transparent"
            return root.down ? "#f1f5f9" : (root.hovered ? "#f8fafc" : "#ffffff")
        }
        border.width: root.kind === "secondary" ? 1 : (root.kind === "danger" ? 1.4 : 0)
        border.color: root.kind === "danger" ? Theme.red : Theme.border
        Behavior on color { ColorAnimation { duration: 120 } }
    }
}
