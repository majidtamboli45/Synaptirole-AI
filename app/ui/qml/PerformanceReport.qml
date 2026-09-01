import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

Item {
    id: root

    function exportMenu(anchor) {
        exportPopup.popup(anchor)
    }

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

                Column {
                    spacing: 4
                    Text {
                        text: "Reports"
                        font.family: Theme.fontName
                        font.pixelSize: 24
                        font.weight: Font.Bold
                        color: Theme.text
                    }
                    Text {
                        text: "Track your performance, analyze your strengths and identify areas to improve."
                        font.family: Theme.fontName
                        font.pixelSize: 13
                        color: Theme.muted
                    }
                }

                Item { Layout.fillWidth: true }

                DateRange {
                    onRangeChanged: function(range) { App?.notify("Showing report for: " + range) }
                }

                AppButton {
                    text: "Export Report"
                    iconText: "\u2B07\uFE0F"
                    onClicked: App?.exportReport("PDF")
                }

                NotificationBell { badgeCount: 9 }

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
                    Layout.preferredWidth: 420
                    Layout.fillHeight: true

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 22
                        spacing: 10

                        Text {
                            text: "Score Distribution"
                            font.family: Theme.fontName
                            font.pixelSize: 16
                            font.weight: Font.Bold
                            color: Theme.text
                        }

                        DonutChart {
                            id: donut
                            Layout.alignment: Qt.AlignHCenter
                            width: 170
                            height: 170
                            centerTop: "12"
                            centerBottom: "Interviews"
                            segments: [
                                { label: "Excellent (80-100)", value: 2, color: "#16a34a" },
                                { label: "Good (60-79)", value: 6, color: "#7c3aed" },
                                { label: "Average (40-59)", value: 3, color: "#f59e0b" },
                                { label: "Needs Improvement", value: 1, color: "#ef4444" }
                            ]
                        }

                        Repeater {
                            model: [
                                { label: "Excellent (80-100)", v: "2 \u2022 17%", c: "#16a34a" },
                                { label: "Good (60-79)", v: "6 \u2022 50%", c: "#7c3aed" },
                                { label: "Average (40-59)", v: "3 \u2022 25%", c: "#f59e0b" },
                                { label: "Needs Improvement (0-39)", v: "1 \u2022 6%", c: "#ef4444" }
                            ]
                            delegate: RowLayout {
                                required property var modelData
                                Layout.fillWidth: true

                                Rectangle {
                                    width: 11; height: 11; radius: 5.5
                                    color: modelData.c
                                }
                                Text {
                                    text: modelData.label
                                    font.family: Theme.fontName
                                    font.pixelSize: 12
                                    color: "#475569"
                                    Layout.fillWidth: true
                                }
                                Text {
                                    text: modelData.v
                                    font.family: Theme.fontName
                                    font.pixelSize: 12
                                    font.weight: Font.DemiBold
                                    color: Theme.text
                                }
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 40
                            radius: 10
                            color: Theme.greenSoft

                            Text {
                                anchors.centerIn: parent
                                text: "\u{1F4C8} You've improved 8 pts compared to last 7 days"
                                font.family: Theme.fontName
                                font.pixelSize: 12
                                font.weight: Font.Medium
                                color: "#15803d"
                            }
                        }
                    }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 18

                Card {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 300

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 22
                        spacing: 14

                        Text {
                            text: "Average Score by Category"
                            font.family: Theme.fontName
                            font.pixelSize: 16
                            font.weight: Font.Bold
                            color: Theme.text
                        }

                        Repeater {
                            model: [
                                { label: "Technical Skills", value: 72 },
                                { label: "Problem Solving", value: 68 },
                                { label: "Communication", value: 66 },
                                { label: "Confidence", value: 64 },
                                { label: "Behavioral Skills", value: 70 }
                            ]
                            delegate: HBarRow {
                                required property var modelData
                                Layout.fillWidth: true
                                label: modelData.label
                                value: modelData.value
                                barColor: Theme.primary
                            }
                        }

                        Item { Layout.fillHeight: true }

                        Text {
                            text: "Scores are averaged across all interviews in the selected period."
                            font.family: Theme.fontName
                            font.pixelSize: 11
                            color: Theme.faint
                        }
                    }
                }

                Card {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 300

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 22
                        spacing: 10

                        RowLayout {
                            Layout.fillWidth: true

                            Text {
                                text: "Skills Performance"
                                font.family: Theme.fontName
                                font.pixelSize: 16
                                font.weight: Font.Bold
                                color: Theme.text
                            }
                            Item { Layout.fillWidth: true }
                            Text {
                                text: "View All \u203A"
                                font.family: Theme.fontName
                                font.pixelSize: 12
                                font.weight: Font.Medium
                                color: Theme.primary
                                MouseArea {
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    hoverEnabled: true
                                    onClicked: App?.navigate("skills")
                                }
                            }
                        }

                        Repeater {
                            model: [
                                { name: "Python", score: 85, up: true, c: "#2563eb" },
                                { name: "Machine Learning", score: 80, up: true, c: "#7c3aed" },
                                { name: "SQL", score: 78, up: true, c: "#0891b2" },
                                { name: "Data Structures", score: 72, up: true, c: "#16a34a" },
                                { name: "System Design", score: 68, up: true, c: "#d97706" },
                                { name: "Communication", score: 65, up: false, c: "#dc2626" }
                            ]
                            delegate: SkillCard {
                                required property var modelData
                                skillName: modelData.name
                                score: modelData.score
                                improving: modelData.up
                                barColor: modelData.c
                            }
                        }
                    }
                }

                Card {
                    Layout.preferredWidth: 330
                    Layout.fillHeight: true

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 22
                        spacing: 12

                        Text {
                            text: "Recent Interview Summary"
                            font.family: Theme.fontName
                            font.pixelSize: 16
                            font.weight: Font.Bold
                            color: Theme.text
                        }

                        GridLayout {
                            Layout.fillWidth: true
                            columns: 2
                            columnSpacing: 14
                            rowSpacing: 14

                            Repeater {
                                model: [
                                    { k: "Best Score", v: "92/100", c: "#16a34a" },
                                    { k: "Lowest Score", v: "48/100", c: "#dc2626" },
                                    { k: "Average Percentile", v: "Top 23%", c: Theme.primaryDark },
                                    { k: "Completion Rate", v: "100%", c: Theme.primaryDark },
                                    { k: "Completed", v: "12 / 12", c: Theme.primaryDark }
                                ]
                                delegate: Rectangle {
                                    required property var modelData
                                    Layout.fillWidth: true
                                    height: 62
                                    radius: 12
                                    color: "#fbfbfe"
                                    border.color: Theme.border

                                    Column {
                                        anchors.centerIn: parent
                                        spacing: 2
                                        Text {
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            text: modelData.k
                                            font.family: Theme.fontName
                                            font.pixelSize: 11
                                            color: Theme.faint
                                        }
                                        Text {
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            text: modelData.v
                                            font.family: Theme.fontName
                                            font.pixelSize: 15
                                            font.weight: Font.Bold
                                            color: modelData.c
                                        }
                                    }
                                }
                            }
                        }

                        Item { Layout.fillHeight: true }
                    }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 18

                Card {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 250

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 22
                        spacing: 13

                        Text {
                            text: "Top Strengths"
                            font.family: Theme.fontName
                            font.pixelSize: 16
                            font.weight: Font.Bold
                            color: Theme.text
                        }

                        Repeater {
                            model: [
                                { t: "Strong hold on Python", d: "You performed well in Python related questions." },
                                { t: "Good Problem Solving", d: "You solve problems efficiently with optimal approach." },
                                { t: "System Design Basics", d: "You have a good understanding of system design concepts." }
                            ]
                            delegate: Row {
                                required property var modelData
                                spacing: 12
                                layoutDirection: Qt.LeftToRight

                                Rectangle {
                                    width: 30; height: 30; radius: 9
                                    color: Theme.greenSoft
                                    anchors.verticalCenter: parent.verticalCenter
                                    Text { anchors.centerIn: parent; text: "\u2713"; color: "#15803d"; font.weight: Font.Bold; font.pixelSize: 13 }
                                }

                                Column {
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: 320
                                    spacing: 2

                                    Text {
                                        text: modelData.t
                                        font.family: Theme.fontName
                                        font.pixelSize: 13
                                        font.weight: Font.DemiBold
                                        color: Theme.text
                                    }
                                    Text {
                                        text: modelData.d
                                        font.family: Theme.fontName
                                        font.pixelSize: 12
                                        color: Theme.muted
                                        wrapMode: Text.WordWrap
                                        width: parent.width
                                    }
                                }
                            }
                        }
                    }
                }

                Card {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 250

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 22
                        spacing: 13

                        Text {
                            text: "Areas to Improve"
                            font.family: Theme.fontName
                            font.pixelSize: 16
                            font.weight: Font.Bold
                            color: Theme.text
                        }

                        Repeater {
                            model: [
                                { t: "Data Structures", d: "Practice more on Arrays, Linked List and Trees." },
                                { t: "SQL Queries", d: "Focus on complex joins and window functions." },
                                { t: "Communication", d: "Work on giving more structured and detailed answers." }
                            ]
                            delegate: Row {
                                required property var modelData
                                spacing: 12

                                Rectangle {
                                    width: 30; height: 30; radius: 9
                                    color: Theme.amberSoft
                                    anchors.verticalCenter: parent.verticalCenter
                                    Text { anchors.centerIn: parent; text: "\u26A0\uFE0F"; font.pixelSize: 13 }
                                }

                                Column {
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: 320
                                    spacing: 2

                                    Text {
                                        text: modelData.t
                                        font.family: Theme.fontName
                                        font.pixelSize: 13
                                        font.weight: Font.DemiBold
                                        color: Theme.text
                                    }
                                    Text {
                                        text: modelData.d
                                        font.family: Theme.fontName
                                        font.pixelSize: 12
                                        color: Theme.muted
                                        wrapMode: Text.WordWrap
                                        width: parent.width
                                    }
                                }
                            }
                        }
                    }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 18

                Card {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 290

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 22
                        spacing: 12

                        Text {
                            text: "Topic-wise Accuracy"
                            font.family: Theme.fontName
                            font.pixelSize: 16
                            font.weight: Font.Bold
                            color: Theme.text
                        }

                        Repeater {
                            model: [
                                { label: "General", value: 85 },
                                { label: "Data Structures", value: 78 },
                                { label: "SQL", value: 72 },
                                { label: "Algorithms", value: 68 },
                                { label: "OOP Concepts", value: 65 },
                                { label: "System Design", value: 60 },
                                { label: "DBMS", value: 58 },
                                { label: "Operating Systems", value: 58 },
                                { label: "Networking", value: 50 },
                                { label: "Computer Basics", value: 48 }
                            ]
                            delegate: HBarRow {
                                required property var modelData
                                Layout.fillWidth: true
                                height: 34
                                label: modelData.label
                                value: modelData.value
                                barColor: modelData.value >= 70 ? "#16a34a" : (modelData.value >= 55 ? "#f59e0b" : "#ef4444")
                            }
                        }
                    }
                }

                Card {
                    Layout.preferredWidth: 430
                    Layout.fillHeight: true

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 22
                        spacing: 12

                        Text {
                            text: "Score Range Distribution"
                            font.family: Theme.fontName
                            font.pixelSize: 16
                            font.weight: Font.Bold
                            color: Theme.text
                        }
                        Text {
                            text: "Number of tests landing in each score band"
                            font.family: Theme.fontName
                            font.pixelSize: 12
                            color: Theme.muted
                        }

                        BarsChart {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            yMax: 8
                            values: [
                                { label: "0-39%", value: 1, color: "#ef4444" },
                                { label: "40-59%", value: 3, color: "#f59e0b" },
                                { label: "60-79%", value: 6, color: "#7c3aed" },
                                { label: "80-100%", value: 2, color: "#16a34a" }
                            ]
                        }
                    }
                }
            }

            Card {
                Layout.fillWidth: true
                Layout.preferredHeight: 260

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 22
                    spacing: 10

                    Text {
                        text: "Test Comparison"
                        font.family: Theme.fontName
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        color: Theme.text
                    }

                    Flickable {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        contentWidth: cmpHeader.width
                        clip: true
                        boundsBehavior: Flickable.StopAtBounds
                        ScrollBar.horizontal: ScrollBar {}

                        Column {
                            id: cmpHeader
                            width: 900
                            spacing: 0

                            Row {
                                width: parent.width
                                height: 32

                                component CHead : Text {
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

                                CHead { text: "#"; w: 40 }
                                CHead { text: "TEST"; w: 220 }
                                CHead { text: "SCORE"; w: 110 }
                                CHead { text: "VS AVG"; w: 110 }
                                CHead { text: "TIME"; w: 110 }
                                CHead { text: "DATE"; w: 160 }
                            }

                            Rectangle { width: parent.width; height: 1; color: Theme.border }

                            ListView {
                                width: parent.width
                                height: 160
                                interactive: false

                                model: [
                                    { n: 1, test: "Mock Interview 12", score: 92, delta: "+24%", up: true, time: "26 min", date: "16 May 2024" },
                                    { n: 2, test: "Mock Interview 11", score: 78, delta: "+10%", up: true, time: "31 min", date: "15 May 2024" },
                                    { n: 3, test: "Mock Interview 10", score: 70, delta: "+5%", up: true, time: "22 min", date: "14 May 2024" },
                                    { n: 4, test: "Mock Interview 9", score: 56, delta: "-5%", up: false, time: "24 min", date: "13 May 2024" },
                                    { n: 5, test: "Mock Interview 8", score: 48, delta: "-12%", up: false, time: "28 min", date: "11 May 2024" }
                                ]

                                delegate: Item {
                                    id: cmpRow
                                    required property var modelData
                                    required property int index
                                    width: cmpHeader.width
                                    height: 32

                                    Rectangle {
                                        anchors.fill: parent
                                        color: cmpRow.index % 2 === 0 ? "#ffffff" : "#fafbfe"
                                    }

                                    Row {
                                        anchors.fill: parent

                                        component CCell : Text {
                                            property int w: 100
                                            width: w
                                            height: parent.height
                                            verticalAlignment: Text.AlignVCenter
                                            elide: Text.ElideRight
                                            font.family: Theme.fontName
                                            font.pixelSize: 12
                                            color: Theme.text
                                        }

                                        CCell { text: cmpRow.modelData.n; w: 40; color: Theme.muted }
                                        CCell { text: cmpRow.modelData.test; w: 220; font.weight: Font.Medium }
                                        CCell {
                                            w: 110
                                            text: cmpRow.modelData.score + "%"
                                            font.weight: Font.Bold
                                            color: cmpRow.modelData.score >= 70 ? "#16a34a" : (cmpRow.modelData.score >= 50 ? "#d97706" : "#dc2626")
                                        }
                                        CCell {
                                            w: 110
                                            text: (cmpRow.modelData.up ? "\u2191 " : "\u2193 ") + cmpRow.modelData.delta
                                            font.weight: Font.DemiBold
                                            color: cmpRow.modelData.up ? "#16a34a" : "#dc2626"
                                        }
                                        CCell { text: cmpRow.modelData.time; w: 110; color: Theme.muted }
                                        CCell { text: cmpRow.modelData.date; w: 160; color: Theme.muted }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 18

                Card {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 200

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 24
                        spacing: 24

                        ProgressRing {
                            value: 68
                            size: 120
                            ringColor: Theme.primary
                            subLabel: "Overall Score"
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 8

                            Rectangle {
                                height: 26
                                width: fbTag.implicitWidth + 22
                                radius: 13
                                color: Theme.greenSoft
                                border.color: "#bbf7d0"

                                Text {
                                    id: fbTag
                                    anchors.centerIn: parent
                                    text: "\u{1F44F} Good Job!"
                                    font.family: Theme.fontName
                                    font.pixelSize: 12
                                    font.weight: Font.Bold
                                    color: "#15803d"
                                }
                            }

                            Text {
                                Layout.fillWidth: true
                                text: "You are performing well overall. Focus on the suggested areas to reach the next level."
                                wrapMode: Text.WordWrap
                                font.family: Theme.fontName
                                font.pixelSize: 15
                                font.weight: Font.Medium
                                color: Theme.text
                                lineHeight: 1.3
                            }

                            Text {
                                text: "Based on 12 interviews evaluated between May 10 - May 16, 2024"
                                font.family: Theme.fontName
                                font.pixelSize: 11
                                color: Theme.faint
                            }
                        }
                    }
                }

                Card {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 200

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 20
                        spacing: 8

                        Text {
                            text: "Personalised Recommendations"
                            font.family: Theme.fontName
                            font.pixelSize: 15
                            font.weight: Font.Bold
                            color: Theme.text
                        }
                        Text {
                            text: "Based on your performance patterns"
                            topPadding: -6
                            font.family: Theme.fontName
                            font.pixelSize: 11
                            color: Theme.faint
                        }

                        Repeater {
                            model: [
                                { i: "\u{1F3AF}", t: "Focus on Weak Topics", d: "Dedicate focused revision to Data Structures, SQL & Communication." },
                                { i: "\u{1F4C9}", t: "Inconsistent Performance", d: "Your scores vary by \u00B122 pts. Work on consistency across tests." },
                                { i: "\u{1F4AA}", t: "Capitalize on Strengths", d: "Python & Technical Skills are strong. Tackle harder topics next." }
                            ]
                            delegate: Row {
                                required property var modelData
                                spacing: 10
                                topPadding: 4

                                Text {
                                    text: modelData.i
                                    font.pixelSize: 15
                                    anchors.verticalCenter: parent.verticalCenter
                                }

                                Column {
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: 340
                                    spacing: 1
                                    Text {
                                        text: modelData.t
                                        font.family: Theme.fontName
                                        font.pixelSize: 12
                                        font.weight: Font.DemiBold
                                        color: Theme.text
                                    }
                                    Text {
                                        text: modelData.d
                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        color: Theme.muted
                                        elide: Text.ElideRight
                                        width: parent.width
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Text {
                Layout.alignment: Qt.AlignHCenter
                bottomPadding: 10
                text: "\u{1F680} Keep practicing consistently and you will achieve your goals!"
                font.family: Theme.fontName
                font.pixelSize: 14
                font.weight: Font.Medium
                color: Theme.primary
            }
        }
    }
}
