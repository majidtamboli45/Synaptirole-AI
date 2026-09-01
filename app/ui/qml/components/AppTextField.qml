import QtQuick
import QtQuick.Controls
import "."

TextField {
    id: root
    font.family: Theme.fontName
    font.pixelSize: 14
    color: Theme.text
    selectByMouse: true
    topPadding: 12
    bottomPadding: 12
    leftPadding: 14
    rightPadding: 14
    placeholderTextColor: Theme.faint

    background: Rectangle {
        radius: 10
        color: "#ffffff"
        border.width: root.activeFocus ? 1.6 : 1
        border.color: root.activeFocus ? Theme.primary : "#dcdfeb"
        Behavior on border.color { ColorAnimation { duration: 120 } }
    }
}
