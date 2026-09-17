import QtQuick
import "."

Rectangle {
    id: root
    property string priority: ""
    property bool showLabel: true

    implicitHeight: 24
    implicitWidth: iconTxt.implicitWidth + (textTxt.visible ? textTxt.implicitWidth + 6 : 0) + 18
    radius: 12

    property color _bg: root.priority === "HIGH" ? Theme.redSoft
                            : root.priority === "MEDIUM" ? Theme.amberSoft
                            : root.priority === "LOW" ? Theme.blueSoft
                            : "#f1f5f9"
    property color _fg: root.priority === "HIGH" ? "#b91c1c"
                            : root.priority === "MEDIUM" ? "#b45309"
                            : root.priority === "LOW" ? "#1d4ed8"
                            : Theme.faint

    color: _bg

    Row {
        anchors.centerIn: parent
        spacing: 6

        Text {
            id: iconTxt
            visible: root.priority !== ""
            text: root.priority === "HIGH" ? "\u26A0"
                : root.priority === "MEDIUM" ? "\u25CE"
                : "\u25CB"
            font.pixelSize: 10
            font.weight: Font.Bold
            color: _fg
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            id: textTxt
            visible: root.showLabel && root.priority !== ""
            text: root.priority
            font.family: Theme.fontName
            font.pixelSize: 11
            font.weight: Font.DemiBold
            color: _fg
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}