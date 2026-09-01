import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

Item {
    id: root

    Flickable {
        anchors.fill: parent
        contentWidth: width
        contentHeight: contentCol.height + 56
        clip: true
        boundsBehavior: Flickable.StopAtBounds

        ScrollBar.vertical: ScrollBar { policy: ScrollBar.AsNeeded }

        ColumnLayout {
            id: contentCol
            width: parent.width - 56
            x: 28
            y: 28
            spacing: 22

            RowLayout {
                Layout.fillWidth: true
                spacing: 14

                Column {
                    spacing: 4
                    Text {
                        text: "Welcome back, Arjun! \u{1F44B}"
                        font.family: Theme.fontName
                        font.pixelSize: 24
                        font.weight: Font.Bold
                        color: Theme.text
                    }
                    Text {
                        text: "Track your interview progress and improve your skills."
                        font.family: Theme.fontName
                        font.pixelSize: 13
                        color: Theme.muted
                    }
                }

                Item { Layout.fillWidth: true }

                DateRange {
                    onRangeChanged: function(range) { App?.notify("Showing data for: " + range) }
                }

                NotificationBell { badgeCount: 3 }

                ProfileChip {
                    onViewProfile: App?.navigate("profile")
                    onOpenAccount: App?.navigate("account")
                    onOpenSettings: App?.navigate("settings")
                    onDoLogout: App?.logout()
                }
            }

            GridLayout {
                Layout.fillWidth: true
                columns: 4
                columnSpacing: 18
                rowSpacing: 18

                ScoreCard {
                    Layout.fillWidth: true
                    title: "Interviews Taken"
                    value: "12"
                    compare: "20% vs last 7 days"
                    up: true
                    iconText: "\u{1F3A4}"
                    iconColor: Theme.primary
                }
                ScoreCard {
                    Layout.fillWidth: true
                    title: "Overall Score"
                    value: "68/100"
                    compare: "8 pts vs last 7 days"
                    up: true
                    iconText: "\u{1F3AF}"
                    iconColor: Theme.blue
                }
                ScoreCard {
                    Layout.fillWidth: true
                    title: "Skills Matched"
                    value: "72%"
                    compare: "10% vs last 7 days"
                    up: true
                    iconText: "\u{1F9E9}"
                    iconColor: Theme.green
                }
                ScoreCard {
                    Layout.fillWidth: true
                    title: "Total Time Practiced"
                    value: "8h 24m"
                    compare: "1h 15m vs last 7 days"
                    up: true
                    iconText: "\u23F1\uFE0F"
                    iconColor: Theme.amber
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 18

                Card {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 330

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 22
                        spacing: 14

                        RowLayout {
                            Layout.fillWidth: true

                            Text {
                                text: "Performance Trend"
                                font.family: Theme.fontName
                                font.pixelSize: 16
                                font.weight: Font.Bold
                                color: Theme.text
                            }
                            Item { Layout.fillWidth: true }
                            AppComboBox {
                                width: 150
                                height: 36
                                model: ["Last 7 Days", "Last 30 Days", "Last 3 Months", "Last 6 Months"]
                            }
                        }

                        LineChart {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            points: [
                                { label: "May 10", value: 45 },
                                { label: "May 11", value: 62 },
                                { label: "May 12", value: 58 },
                                { label: "May 13", value: 55 },
                                { label: "May 14", value: 70 },
                                { label: "May 15", value: 65 },
                                { label: "May 16", value: 68 }
                            ]
                        }
                    }
                }

                Card {
                    Layout.preferredWidth: 320
                    Layout.fillHeight: true

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 22
                        spacing: 10

                        Text {
                            text: "Quick Actions"
                            font.family: Theme.fontName
                            font.pixelSize: 16
                            font.weight: Font.Bold
                            color: Theme.text
                            bottomPadding: 4
                        }

                        Repeater {
                            model: [
                                { icon: "\u{1F4C4}", title: "Upload Resume / JD", desc: "Add or update your documents", page: "resumejd" },
                                { icon: "\u{1F3A4}", title: "Start Mock Interview", desc: "Begin a personalized AI interview", page: "interview" },
                                { icon: "\u{1F4CA}", title: "View Reports", desc: "Analyze scores and feedback", page: "reports" },
                                { icon: "\u{1F527}", title: "Areas of Improvement", desc: "Focus on skills that need work", page: "skills" }
                            ]
                            delegate: Rectangle {
                                id: qaCard
                                required property var modelData
                                Layout.fillWidth: true
                                height: 58
                                radius: 12
                                color: qaArea.containsMouse ? Theme.primarySoft : "#fbfbfe"
                                border.color: qaArea.containsMouse ? "#ddd2f7" : Theme.border

                                Row {
                                    anchors.fill: parent
                                    anchors.margins: 11
                                    spacing: 12

                                    Rectangle {
                                        width: 38; height: 38; radius: 10
                                        color: Qt.rgba(124 / 255, 58 / 255, 237 / 255, 0.12)
                                        Text { anchors.centerIn: parent; text: qaCard.modelData.icon; font.pixelSize: 16 }
                                    }

                                    Column {
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: parent.width - 50
                                        spacing: 1

                                        Text {
                                            text: qaCard.modelData.title
                                            font.family: Theme.fontName
                                            font.pixelSize: 13
                                            font.weight: Font.DemiBold
                                            color: Theme.text
                                        }
                                        Text {
                                            text: qaCard.modelData.desc
                                            font.family: Theme.fontName
                                            font.pixelSize: 11
                                            color: Theme.muted
                                            elide: Text.ElideRight
                                            width: parent.width
                                        }
                                    }

                                    Text {
                                        text: "\u203A"
                                        font.pixelSize: 18
                                        font.weight: Font.Bold
                                        color: Theme.faint
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }

                                MouseArea {
                                    id: qaArea
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: App?.navigate(qaCard.modelData.page)
                                }
                            }
                        }
                    }
                }
            }

            Card {
                Layout.fillWidth: true
                Layout.preferredHeight: 420

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 22
                    spacing: 12

                    RowLayout {
                        Layout.fillWidth: true

                        Column {
                            spacing: 2
                            Text {
                                text: "Recent Interviews"
                                font.family: Theme.fontName
                                font.pixelSize: 16
                                font.weight: Font.Bold
                                color: Theme.text
                            }
                            Text {
                                text: "Your latest mock interview sessions"
                                font.family: Theme.fontName
                                font.pixelSize: 12
                                color: Theme.muted
                            }
                        }

                        Item { Layout.fillWidth: true }

                        AppButton {
                            kind: "secondary"
                            text: "View All"
                            onClicked: App?.notify("Full interview history opens here.")
                        }
                    }

                    Flickable {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        contentWidth: tableHeader.width
                        clip: true
                        boundsBehavior: Flickable.StopAtBounds

                        ScrollBar.horizontal: ScrollBar {}

                        Column {
                            id: tableHeader
                            width: 1120
                            spacing: 0

                            Row {
                                width: parent.width
                                height: 34

                                component HeadCell : Text {
                                    property int w: 100
                                    width: w
                                    height: parent.height
                                    verticalAlignment: Text.AlignVCenter
                                    font.family: Theme.fontName
                                    font.pixelSize: 11
                                    font.weight: Font.DemiBold
                                    font.letterSpacing: 0.6
                                    color: Theme.faint
                                }

                                HeadCell { text: "ROLE"; w: 200 }
                                HeadCell { text: "COMPANY"; w: 180 }
                                HeadCell { text: "DATE"; w: 120 }
                                HeadCell { text: "TIME"; w: 90 }
                                HeadCell { text: "SCORE"; w: 90 }
                                HeadCell { text: "PERCENTILE"; w: 110 }
                                HeadCell { text: "DURATION"; w: 100 }
                                HeadCell { text: "STATUS"; w: 110 }
                                HeadCell { text: ""; w: 120 }
                            }

                            Rectangle { width: parent.width; height: 1; color: Theme.border }

                            ListView {
                                width: parent.width
                                height: 280
                                interactive: false
                                clip: true

                                model: [
                                    { role: "AI/ML Engineer", company: "TechNova Solutions", date: "May 16, 2024", time: "10:30 AM", score: 92, perc: "Top 2%", dur: "45m 32s", status: "Completed" },
                                    { role: "Software Developer", company: "Custom Job Description", date: "May 14, 2024", time: "02:15 PM", score: 78, perc: "Top 18%", dur: "38m 05s", status: "Completed" },
                                    { role: "Data Analyst", company: "InfoTech Analytics", date: "May 12, 2024", time: "11:00 AM", score: 64, perc: "Top 35%", dur: "41m 12s", status: "Completed" },
                                    { role: "AI/ML Engineer", company: "TechNova Solutions", date: "May 11, 2024", time: "04:45 PM", score: 48, perc: "Top 52%", dur: "12m 40s", status: "Interrupted" },
                                    { role: "Software Developer", company: "Cloud Systems Inc", date: "May 10, 2024", time: "09:20 AM", score: 56, perc: "Top 44%", dur: "27m 33s", status: "Completed" }
                                ]

                                delegate: Item {
                                    id: rowDelegate
                                    required property var modelData
                                    required property int index
                                    width: tableHeader.width
                                    height: 54

                                    Rectangle {
                                        anchors.fill: parent
                                        color: rowDelegate.index % 2 === 0 ? "#ffffff" : "#fafbfe"
                                    }

                                    Row {
                                        anchors.fill: parent

                                        component Cell : Text {
                                            property int w: 100
                                            width: w
                                            height: parent.height
                                            verticalAlignment: Text.AlignVCenter
                                            elide: Text.ElideRight
                                            font.family: Theme.fontName
                                            font.pixelSize: 13
                                            color: Theme.text
                                        }

                                        Cell { text: rowDelegate.modelData.role; w: 200; font.weight: Font.Medium }
                                        Cell { text: rowDelegate.modelData.company; w: 180; color: Theme.muted }
                                        Cell { text: rowDelegate.modelData.date; w: 120; color: Theme.muted }
                                        Cell { text: rowDelegate.modelData.time; w: 90; color: Theme.muted }

                                        Text {
                                            width: 90
                                            height: parent.height
                                            verticalAlignment: Text.AlignVCenter
                                            text: rowDelegate.modelData.score + "/100"
                                            font.family: Theme.fontName
                                            font.pixelSize: 13
                                            font.weight: Font.Bold
                                            color: rowDelegate.modelData.score >= 70 ? "#16a34a" : (rowDelegate.modelData.score >= 50 ? "#d97706" : "#dc2626")
                                        }

                                        Cell { text: rowDelegate.modelData.perc; w: 110; color: Theme.muted }
                                    Cell { text: rowDelegate.modelData.dur; w: 100; color: Theme.muted }

                                    Item {
                                        width: 110
                                        height: parent.height

                                        Rectangle {
                                            anchors.centerIn: parent
                                            width: stLabel.implicitWidth + 20
                                            height: 24
                                            radius: 12
                                            color: rowDelegate.modelData.status === "Completed" ? Theme.greenSoft : Theme.amberSoft
                                            Text {
                                                id: stLabel
                                                anchors.centerIn: parent
                                                text: rowDelegate.modelData.status
                                                font.family: Theme.fontName
                                                font.pixelSize: 11
                                                font.weight: Font.DemiBold
                                                color: rowDelegate.modelData.status === "Completed" ? "#15803d" : "#b45309"
                                            }
                                        }
                                    }

                                    Item {
                                        width: 120
                                        height: parent.height

                                        Row {
                                            anchors.centerIn: parent
                                            spacing: 8

                                            AppButton {
                                                text: "View Report"
                                                topPadding: 6
                                                bottomPadding: 6
                                                leftPadding: 12
                                                rightPadding: 12
                                                onClicked: App?.navigate("reports")
                                            }

                                            Rectangle {
                                                width: 30; height: 30; radius: 8
                                                color: kebabArea.containsMouse ? "#f1f5f9" : "transparent"
                                                Text { anchors.centerIn: parent; text: "\u22EE"; font.pixelSize: 15; color: Theme.muted }
                                                MouseArea {
                                                    id: kebabArea
                                                    anchors.fill: parent
                                                    hoverEnabled: true
                                                    cursorShape: Qt.PointingHandCursor
                                                    onClicked: rowMenu.popup()
                                                }
                                                Menu {
                                                    id: rowMenu
                                                    MenuItem { text: "View Report"; onTriggered: App?.notify("Opening report...") }
                                                    MenuItem { text: "Rename Interview"; onTriggered: App?.notify("Rename is not available in the demo.") }
                                                    MenuItem { text: "Download Report"; onTriggered: App?.exportReport("PDF") }
                                                    MenuSeparator {}
                                                    MenuItem { text: "Delete Interview"; onTriggered: App?.notify("Delete requires confirmation (demo).") }
                                                }
                                            }
                                        }
                                    }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
