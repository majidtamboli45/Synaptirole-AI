import QtQuick
import QtQuick.Controls
import "."

Item {
    id: root
    width: chipRow.implicitWidth + 24
    height: 46

    signal viewProfile()
    signal openAccount()
    signal openSettings()
    signal doLogout()

    Rectangle {
        anchors.fill: parent
        radius: 12
        color: chipArea.containsMouse ? "#f1f0fb" : "transparent"
    }

    Row {
        id: chipRow
        anchors.centerIn: parent
        spacing: 10

        Rectangle {
            width: 36; height: 36; radius: 18
            gradient: Gradient {
                GradientStop { position: 0; color: "#8b5cf6" }
                GradientStop { position: 1; color: "#4f46e5" }
            }
            Text {
                anchors.centerIn: parent
                text: "AS"
                color: "#ffffff"
                font.family: Theme.fontName
                font.pixelSize: 13
                font.weight: Font.Bold
            }
        }

        Column {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 1

            Text {
                text: (App?.userName ?? "")
                font.family: Theme.fontName
                font.pixelSize: 13
                font.weight: Font.DemiBold
                color: Theme.text
            }
            Text {
                text: (App?.userRole ?? "")
                font.family: Theme.fontName
                font.pixelSize: 11
                color: Theme.muted
            }
        }

        Text {
            text: "\u25BE"
            color: Theme.muted
            font.pixelSize: 13
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    MouseArea {
        id: chipArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: menu.open()
    }

    Popup {
        id: menu
        y: parent.height + 6
        x: -(width - parent.width)
        width: 210
        padding: 8
        background: Rectangle { radius: 12; border.color: Theme.border }

        contentItem: Column {
            spacing: 2

            MenuRow {
                icon: "\u{1F464}"
                label: "View Profile"
                onActivated: { menu.close(); root.viewProfile() }
            }
            MenuRow {
                icon: "\u{1F511}"
                label: "Account Settings"
                onActivated: { menu.close(); root.openAccount() }
            }
            MenuRow {
                icon: "\u2699\uFE0F"
                label: "Settings"
                onActivated: { menu.close(); root.openSettings() }
            }

            Rectangle { height: 1; color: Theme.border; width: parent.width }

            MenuRow {
                icon: "\u{1F6AA}"
                label: "Logout"
                onActivated: { menu.close(); root.doLogout() }
            }
        }
    }
}
