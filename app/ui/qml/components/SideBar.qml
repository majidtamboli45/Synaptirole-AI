import QtQuick
import QtQuick.Controls
import "."

Rectangle {
    id: root
    color: "#ffffff"
    border.color: Theme.border

    signal navigate(string page)

    readonly property var mainItems: [
        { key: "dashboard", label: "Dashboard", icon: "\u{1F3E0}" },
        { key: "resumejd", label: "Resume & JD", icon: "\u{1F4C4}" },
        { key: "interview", label: "Mock Interviews", icon: "\u{1F3A4}" },
        { key: "reports", label: "Reports", icon: "\u{1F4CA}" },
        { key: "settings", label: "Settings", icon: "\u2699\uFE0F" }
    ]

    readonly property var analysisItems: [
        { key: "skills", label: "Skill Analysis", icon: "\u{1F9E9}" },
        { key: "liveanalysis", label: "Live Analysis", icon: "\u{1F4F7}" }
    ]

    function navLabel(key) {
        for (var i = 0; i < mainItems.length; i++)
            if (mainItems[i].key === key) return mainItems[i].label
        for (var j = 0; j < analysisItems.length; j++)
            if (analysisItems[j].key === key) return analysisItems[j].label
        return ""
    }

    component NavItem : Rectangle {
        property var itemData: ({})
        width: root.width - 20
        x: 10
        height: 42
        radius: 11
        color: App?.currentPage === itemData.key ? Theme.primarySoft : (ma.containsMouse ? "#f8f8fd" : "transparent")

        Rectangle {
            visible: App?.currentPage === itemData.key
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: 3.5; height: 20; radius: 2
            color: Theme.primary
        }

        Row {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 12
            spacing: 11

            Text {
                text: itemData.icon !== undefined ? itemData.icon : ""
                font.pixelSize: 15
                anchors.verticalCenter: parent.verticalCenter
                opacity: App?.currentPage === itemData.key ? 1 : 0.85
            }

            Text {
                text: itemData.label !== undefined ? itemData.label : ""
                font.family: Theme.fontName
                font.pixelSize: 13
                font.weight: App?.currentPage === itemData.key ? Font.DemiBold : Font.Medium
                color: App?.currentPage === itemData.key ? Theme.primaryDark : "#475569"
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        MouseArea {
            id: ma
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: root.navigate(itemData.key)
        }
    }

    Rectangle {
        id: brandRow
        width: parent.width
        height: 76

        Row {
            anchors.left: parent.left
            anchors.leftMargin: 22
            anchors.verticalCenter: parent.verticalCenter
            spacing: 10

            Rectangle {
                width: 38; height: 38; radius: 11
                gradient: Gradient {
                    GradientStop { position: 0; color: "#7c3aed" }
                    GradientStop { position: 1; color: "#2563eb" }
                }
                Text {
                    anchors.centerIn: parent
                    text: "\u27A4"
                    color: "#ffffff"
                    font.pixelSize: 16
                    font.weight: Font.Bold
                }
            }

            Column {
                anchors.verticalCenter: parent.verticalCenter

                Text {
                    text: "SynaptiRole"
                    font.family: Theme.fontName
                    font.pixelSize: 17
                    font.weight: Font.Bold
                    color: Theme.text
                }
                Text {
                    text: "AI Interview Copilot"
                    font.family: Theme.fontName
                    font.pixelSize: 10
                    color: Theme.muted
                }
            }
        }
    }

    Rectangle {
        anchors.top: brandRow.bottom
        width: parent.width
        height: 1
        color: Theme.border
    }

    Column {
        id: topNav
        anchors.top: brandRow.bottom
        anchors.topMargin: 14
        width: parent.width
        spacing: 6

        Repeater {
            model: root.mainItems
            delegate: NavItem { itemData: modelData }
        }

        Item { width: 1; height: 10 }

        Rectangle {
            width: parent.width - 36
            x: 18
            height: 1
            color: Theme.border
        }

        Text {
            text: "ANALYSIS"
            anchors.left: parent.left
            anchors.leftMargin: 30
            topPadding: 8
            font.family: Theme.fontName
            font.pixelSize: 10
            font.letterSpacing: 1.2
            font.weight: Font.DemiBold
            color: Theme.faint
        }

        Repeater {
            model: root.analysisItems
            delegate: NavItem { itemData: modelData }
        }
    }

    Rectangle {
        anchors.bottom: profileCard.top
        anchors.bottomMargin: 12
        width: parent.width - 40
        x: 20
        height: 1
        color: Theme.border
    }

    Rectangle {
        id: profileCard
        width: parent.width - 20
        x: 10
        anchors.bottom: logoutBtn.top
        anchors.bottomMargin: 8
        height: 64
        radius: 12
        color: profileArea.containsMouse ? "#f8f8fd" : "#fbfbfe"
        border.color: Theme.border

        Row {
            anchors.fill: parent
            anchors.margins: 11
            spacing: 10

            Rectangle {
                width: 40; height: 40; radius: 20
                gradient: Gradient {
                    GradientStop { position: 0; color: "#8b5cf6" }
                    GradientStop { position: 1; color: "#4f46e5" }
                }
                Text {
                    anchors.centerIn: parent
                    text: "AS"
                    color: "#ffffff"
                    font.family: Theme.fontName
                    font.pixelSize: 14
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
        }

        MouseArea {
            id: profileArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: root.navigate("profile")
        }
    }

    Rectangle {
        id: logoutBtn
        width: parent.width - 20
        x: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 12
        height: 42
        radius: 11
        color: logoutArea.containsMouse ? Theme.redSoft : "transparent"

        Row {
            anchors.centerIn: parent
            spacing: 10

            Text {
                text: "\u{1F6AA}"
                font.pixelSize: 15
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                text: "Logout"
                font.family: Theme.fontName
                font.pixelSize: 13
                font.weight: Font.Medium
                color: logoutArea.containsMouse ? "#b91c1c" : "#475569"
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        MouseArea {
            id: logoutArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: App?.logout()
        }
    }
}
