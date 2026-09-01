import QtQuick
import QtQuick.Controls
import "."

Item {
    id: root
    property int badgeCount: 0
    width: 42
    height: 42

    property var notifications: [
        { title: "Interview Feedback Ready", desc: "Your AI/ML Engineer mock interview report is ready to view.", time: "5 min ago", unread: true },
        { title: "Weekly Performance Summary", desc: "Your score improved 8 pts this week. Keep it up!", time: "2 hours ago", unread: true },
        { title: "New Recommendation", desc: "Practice Data Structures - Arrays & Trees suggested.", time: "Yesterday", unread: false }
    ]

    Rectangle {
        anchors.fill: parent
        radius: 12
        color: bellArea.containsMouse ? "#f1f0fb" : "transparent"

        Text {
            anchors.centerIn: parent
            text: "\u{1F514}"
            font.pixelSize: 17
        }

        Rectangle {
            visible: root.badgeCount > 0
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: 4
            width: 18; height: 18; radius: 9
            color: Theme.red
            border.color: "#ffffff"
            border.width: 1.5
            Text {
                anchors.centerIn: parent
                text: root.badgeCount
                color: "#ffffff"
                font.family: Theme.fontName
                font.pixelSize: 10
                font.weight: Font.Bold
            }
        }
    }

    MouseArea {
        id: bellArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: panel.open()
    }

    Popup {
        id: panel
        y: parent.height + 8
        x: -(width - parent.width)
        width: 360
        padding: 0
        modal: false
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        background: Rectangle {
            radius: 14
            border.color: Theme.border
            color: Theme.card
        }

        contentItem: Column {
            spacing: 0

            Item {
                width: parent.width
                height: 50
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 16
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Notifications"
                    font.family: Theme.fontName
                    font.pixelSize: 15
                    font.weight: Font.Bold
                    color: Theme.text
                }
                Rectangle {
                    anchors.right: parent.right
                    anchors.rightMargin: 16
                    anchors.verticalCenter: parent.verticalCenter
                    radius: 9
                    height: 20
                    width: badgeText.implicitWidth + 16
                    color: Theme.primarySoft
                    Text {
                        id: badgeText
                        anchors.centerIn: parent
                        text: root.badgeCount + " new"
                        color: Theme.primaryDark
                        font.family: Theme.fontName
                        font.pixelSize: 11
                        font.weight: Font.DemiBold
                    }
                }
            }

            Repeater {
                model: root.notifications
                delegate: Item {
                    width: parent.width
                    height: 66
                    Rectangle {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        radius: 10
                        color: index === 1 ? "#f3f0ff" : (index === 0 ? "#f3f0ff" : "transparent")
                    }
                    Row {
                        anchors.fill: parent
                        anchors.margins: 12
                        spacing: 10
                        Rectangle {
                            width: 34; height: 34; radius: 10
                            color: modelData.unread ? Theme.primarySoft : "#f1f5f9"
                            Text {
                                anchors.centerIn: parent
                                text: index === 0 ? "\u{1F4C4}" : (index === 1 ? "\u{1F4C8}" : "\u{1F4A1}")
                                font.pixelSize: 15
                            }
                        }
                        Column {
                            width: parent.width - 44
                            spacing: 2
                            Text {
                                text: modelData.title
                                font.family: Theme.fontName
                                font.pixelSize: 13
                                font.weight: Font.DemiBold
                                color: Theme.text
                                elide: Text.ElideRight
                                width: parent.width
                            }
                            Text {
                                text: modelData.desc
                                font.family: Theme.fontName
                                font.pixelSize: 11
                                color: Theme.muted
                                elide: Text.ElideRight
                                width: parent.width
                            }
                            Text {
                                text: modelData.time
                                font.family: Theme.fontName
                                font.pixelSize: 10
                                color: Theme.faint
                            }
                        }
                    }
                }
            }

            Item { width: 1; height: 10 }
        }
    }
}
