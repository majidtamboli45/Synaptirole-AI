import QtQuick
import QtQuick.Controls
import "."

ComboBox {
    id: root
    font.family: Theme.fontName
    font.pixelSize: 13

    delegate: ItemDelegate {
        width: root.width
        height: 36
        contentItem: Text {
            text: modelData !== undefined ? modelData : model[root.textRole]
            font.family: Theme.fontName
            font.pixelSize: 13
            color: highlighted ? Theme.primary : Theme.text
            verticalAlignment: Text.AlignVCenter
            leftPadding: 12
        }
        highlighted: root.highlightedIndex === index
        background: Rectangle {
            color: parent.hovered ? Theme.primarySoft : "transparent"
        }
    }

    contentItem: Text {
        leftPadding: 14
        rightPadding: 30
        text: root.displayText
        font: root.font
        color: Theme.text
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }

    indicator: Text {
        rightPadding: 12
        text: "\u25BE"
        color: Theme.muted
        font.pixelSize: 14
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
    }

    background: Rectangle {
        radius: 10
        color: "#ffffff"
        border.width: root.activeFocus ? 1.6 : 1
        border.color: root.activeFocus ? Theme.primary : "#dcdfeb"
    }

    popup: Popup {
        y: root.height + 6
        width: root.width
        padding: 6
        implicitHeight: contentItem.implicitHeight + 12
        background: Rectangle { radius: 10; border.color: Theme.border }
        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: root.popup.visible ? root.delegateModel : null
            currentIndex: root.highlightedIndex
        }
    }
}
