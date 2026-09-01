import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    property bool dialogVisible: false
    property string title: "Error"
    property string message: ""
    property string detail: ""

    width: Math.min(parent ? parent.width : 600, 560)
    height: Math.min(parent ? parent.height : 400, 380)

    Rectangle {
        anchors.fill: parent
        anchors.margins: -20
        color: "#000000"
        opacity: 0.35
        visible: root.dialogVisible
        z: root.z - 1

        MouseArea {
            anchors.fill: parent
            onClicked: root.dialogVisible = false
        }
    }

    Rectangle {
        id: dialog
        width: root.width
        height: root.height
        radius: 16
        color: Theme.card
        border.color: Theme.border
        border.width: 1
        z: 999
        visible: root.dialogVisible

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 24
            spacing: 16

            Row {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter

                Text {
                    text: root.title
                    font.family: Theme.fontName
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    color: Theme.red
                }
            }

            Rectangle {
                Layout.fillWidth: true
                height: 1
                color: Theme.border
            }

            Text {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: root.message
                font.family: Theme.fontName
                font.pixelSize: 14
                color: Theme.text
            }

            Item {
                Layout.fillWidth: true
                height: 8
            }

            Rectangle {
                id: detailContainer
                Layout.fillWidth: true
                Layout.fillHeight: true
                visible: root.detail !== ""
                radius: 8
                color: Theme.bg
                border.color: Theme.border
                border.width: 1

                Flickable {
                    anchors.fill: parent
                    anchors.margins: 12
                    contentWidth: detailText.implicitWidth
                    contentHeight: detailText.implicitHeight
                    clip: true
                    ScrollBar.vertical: ScrollBar { }

                    Text {
                        id: detailText
                        width: parent.width
                        wrapMode: Text.WordWrap
                        text: root.detail
                        font.family: "Consolas, Monospace"
                        font.pixelSize: 11
                        color: Theme.muted
                    }
                }
            }

            Row {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignRight
                spacing: 12

                AppButton {
                    text: "Dismiss"
                    onClicked: root.visible = false
                }
            }
        }
    }

    function show(title, message, detail) {
        root.title = title
        root.message = message
        root.detail = detail
        root.dialogVisible = true
    }

    function hide() {
        root.dialogVisible = false
    }
}