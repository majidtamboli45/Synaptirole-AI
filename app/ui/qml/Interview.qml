import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root

    color: "#FFFFFF"

    signal startMockInterview()
    signal openInterviewHistory()
    signal openSettings()

    property color primaryColor: "#5B21F5"
    property color darkText: "#10143A"
    property color secondaryText: "#5D6485"
    property color borderColor: "#E7E8F0"

    ScrollView {
        id: scrollView

        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        clip: true

        ScrollBar.vertical.policy: ScrollBar.AsNeeded

        ColumnLayout {
            id: contentColumn

            width: Math.max(
                900,
                scrollView.availableWidth
            )

            spacing: 18

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 105

                Column {
                    anchors.left: parent.left
                    anchors.leftMargin: 28
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 7

                    Text {
                        text: "Mock Interviews"
                        color: darkText
                        font.pixelSize: 29
                        font.bold: true
                    }

                    Text {
                        text: "Practice real interviews tailored to your role and job description."
                        color: secondaryText
                        font.pixelSize: 14
                    }
                }

                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 28
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 14

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "♧"
                        color: "#59617D"
                        font.pixelSize: 22
                    }

                    Rectangle {
                        width: 42
                        height: 42
                        radius: 21
                        color: primaryColor

                        Text {
                            anchors.centerIn: parent
                            text: "A"
                            color: "white"
                            font.pixelSize: 17
                            font.bold: true
                        }
                    }

                    Column {
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 2

                        Text {
                            text: "Arjun Sharma"
                            color: darkText
                            font.pixelSize: 13
                            font.bold: true
                        }

                        Text {
                            text: "AI/ML Engineer"
                            color: secondaryText
                            font.pixelSize: 11
                        }
                    }

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "⌄"
                        color: darkText
                        font.pixelSize: 16
                    }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.leftMargin: 28
                Layout.rightMargin: 28
                spacing: 16

                StatCard {
                    Layout.fillWidth: true
                    title: "Mock Interviews Taken"
                    value: "12"
                    subtitle: "↑ 20% vs last month"
                    icon: "▷"
                    iconColor: "#20A85A"
                    iconBackground: "#EAF8EF"
                    positive: true
                }

                StatCard {
                    Layout.fillWidth: true
                    title: "Average Score"
                    value: "68 / 100"
                    subtitle: "↑ 8 pts vs last month"
                    icon: "♕"
                    iconColor: "#2563EB"
                    iconBackground: "#EDF4FF"
                    positive: true
                }

                StatCard {
                    Layout.fillWidth: true
                    title: "Best Score"
                    value: "92 / 100"
                    subtitle: "On May 10, 2024"
                    icon: "☆"
                    iconColor: "#7C3AED"
                    iconBackground: "#F3EDFF"
                    positive: true
                }

                StatCard {
                    Layout.fillWidth: true
                    title: "Avg. Duration"
                    value: "41m 32s"
                    subtitle: "↓ 5m vs last month"
                    icon: "◷"
                    iconColor: "#F28C18"
                    iconBackground: "#FFF4E8"
                    positive: false
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.leftMargin: 28
                Layout.rightMargin: 28
                spacing: 18

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 360

                    radius: 10
                    color: "#FFFFFF"
                    border.color: borderColor
                    border.width: 1

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 20
                        spacing: 12

                        Text {
                            text: "Start a New Mock Interview"
                            color: darkText
                            font.pixelSize: 17
                            font.bold: true
                        }

                        Text {
                            text: "We'll generate role-relevant questions based on your Resume and Job Description."
                            color: secondaryText
                            font.pixelSize: 12
                        }

                        RowLayout {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            spacing: 20

                            Rectangle {
                                Layout.preferredWidth: 245
                                Layout.fillHeight: true

                                radius: 9
                                color: "#F4F7FC"

                                Column {
                                    anchors.centerIn: parent
                                    spacing: 16

                                    Rectangle {
                                        anchors.horizontalCenter: parent.horizontalCenter

                                        width: 155
                                        height: 105
                                        radius: 10
                                        color: "#26355D"

                                        Rectangle {
                                            anchors.centerIn: parent

                                            width: 130
                                            height: 80
                                            radius: 5
                                            color: "#EEF3FA"

                                            Column {
                                                anchors.centerIn: parent
                                                spacing: 5

                                                Rectangle {
                                                    anchors.horizontalCenter: parent.horizontalCenter
                                                    width: 35
                                                    height: 35
                                                    radius: 18
                                                    color: "#F2B58B"
                                                }

                                                Rectangle {
                                                    anchors.horizontalCenter: parent.horizontalCenter
                                                    width: 50
                                                    height: 20
                                                    radius: 8
                                                    color: "#3B82F6"
                                                }
                                            }
                                        }

                                        Rectangle {
                                            width: 50
                                            height: 50
                                            radius: 25

                                            anchors.right: parent.right
                                            anchors.bottom: parent.bottom
                                            anchors.margins: -15

                                            color: "#2563EB"

                                            Text {
                                                anchors.centerIn: parent
                                                text: "▶"
                                                color: "white"
                                                font.pixelSize: 19
                                            }
                                        }
                                    }

                                    Text {
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        text: "••• 〰〰〰 •••"
                                        color: "#7EA3EF"
                                        font.pixelSize: 19
                                    }
                                }
                            }

                            ColumnLayout {
                                Layout.fillWidth: true
                                Layout.alignment: Qt.AlignVCenter
                                spacing: 14

                                FeatureRow {
                                    icon: "♩"
                                    title: "AI Interviewer"
                                    description: "Conversational AI asks questions via voice and text."
                                    color: "#7C3AED"
                                }

                                FeatureRow {
                                    icon: "▣"
                                    title: "Real-time Interaction"
                                    description: "Answer questions using your voice and camera."
                                    color: "#16A34A"
                                }

                                FeatureRow {
                                    icon: "▥"
                                    title: "Smart Evaluation"
                                    description: "Get AI-powered feedback on your performance."
                                    color: "#F97316"
                                }

                                FeatureRow {
                                    icon: "✓"
                                    title: "Detailed Report"
                                    description: "Receive a comprehensive performance report."
                                    color: "#2563EB"
                                }
                            }
                        }

                        Button {
                            Layout.preferredWidth: 255
                            Layout.preferredHeight: 39

                            text: "Start Mock Interview  →"

                            background: Rectangle {
                                radius: 6
                                color: parent.down
                                       ? "#4317C7"
                                       : primaryColor
                            }

                            contentItem: Text {
                                text: parent.text
                                color: "white"
                                font.pixelSize: 12
                                font.bold: true

                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            onClicked: root.startMockInterview()
                        }
                    }
                }

                Rectangle {
                    Layout.preferredWidth: 410
                    Layout.preferredHeight: 360

                    radius: 10
                    color: "#FFFFFF"
                    border.color: borderColor
                    border.width: 1

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 20
                        spacing: 10

                        Text {
                            text: "Interview Settings"
                            color: darkText
                            font.pixelSize: 17
                            font.bold: true
                        }

                        SettingRow {
                            label: "Question Source"
                            value: "AI Generated"
                            icon: "◇"
                        }

                        SettingRow {
                            label: "Difficulty Level"
                            value: "Medium"
                            icon: "⚙"
                        }

                        SettingRow {
                            label: "No. of Questions"
                            value: "10 Questions"
                            icon: "▤"
                        }

                        SettingRow {
                            label: "Duration"
                            value: "40 - 45 Minutes"
                            icon: "◷"
                        }

                        ToggleRow {
                            label: "Include Coding"
                            checked: true
                        }

                        ToggleRow {
                            label: "Include System Design"
                            checked: false
                        }

                        Item {
                            Layout.fillHeight: true
                        }

                        Button {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 40

                            text: "✎   Edit Settings"

                            background: Rectangle {
                                radius: 5
                                color: "white"
                                border.color: "#8DB2F7"
                                border.width: 1
                            }

                            contentItem: Text {
                                text: parent.text
                                color: "#1769E0"
                                font.pixelSize: 12
                                font.bold: true

                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.leftMargin: 28
                Layout.rightMargin: 28
                Layout.bottomMargin: 25

                Layout.preferredHeight: 375

                radius: 10
                color: "#FFFFFF"
                border.color: borderColor
                border.width: 1

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 18
                    spacing: 0

                    RowLayout {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 35

                        Text {
                            text: "Past Mock Interviews"
                            color: darkText
                            font.pixelSize: 17
                            font.bold: true
                        }

                        Item {
                            Layout.fillWidth: true
                        }

                        Text {
                            text: "View All"
                            color: "#1769E0"
                            font.pixelSize: 12
                            font.bold: true
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 1
                        color: "#E9EAF1"
                    }

                    InterviewTableHeader {}

                    PastInterviewRow {
                        title: "AI/ML Engineer Mock Interview"
                        date: "May 16, 2024"
                        time: "10:30 AM"
                        score: "72 / 100"
                        percentile: "2nd"
                        topText: "Top 2%"
                        duration: "42m 15s"
                        scoreColor: "#20A85A"
                    }

                    PastInterviewRow {
                        title: "Python Developer Mock Interview"
                        date: "May 14, 2024"
                        time: "02:15 PM"
                        score: "65 / 100"
                        percentile: "5th"
                        topText: "Top 5%"
                        duration: "38m 10s"
                        scoreColor: "#F28C18"
                    }

                    PastInterviewRow {
                        title: "Data Analyst Mock Interview"
                        date: "May 12, 2024"
                        time: "11:00 AM"
                        score: "58 / 100"
                        percentile: "12th"
                        topText: "Top 12%"
                        duration: "40m 05s"
                        scoreColor: "#EF4444"
                    }

                    PastInterviewRow {
                        title: "System Design Mock Interview"
                        date: "May 10, 2024"
                        time: "04:00 PM"
                        score: "48 / 100"
                        percentile: "40th"
                        topText: "Top 40%"
                        duration: "45m 20s"
                        scoreColor: "#EF4444"
                    }

                    PastInterviewRow {
                        title: "DSA Practice Mock Interview"
                        date: "May 08, 2024"
                        time: "09:30 AM"
                        score: "82 / 100"
                        percentile: "18th"
                        topText: "Top 18%"
                        duration: "35m 30s"
                        scoreColor: "#20A85A"
                    }
                }
            }
        }
    }

    component StatCard: Rectangle {
        property string title: ""
        property string value: ""
        property string subtitle: ""
        property string icon: ""
        property color iconColor: "#2563EB"
        property color iconBackground: "#EDF4FF"
        property bool positive: true

        Layout.preferredHeight: 132

        radius: 10
        color: "#FFFFFF"
        border.color: borderColor
        border.width: 1

        RowLayout {
            anchors.fill: parent
            anchors.margins: 17
            spacing: 14

            Rectangle {
                Layout.preferredWidth: 62
                Layout.preferredHeight: 62

                radius: 10
                color: iconBackground

                Text {
                    anchors.centerIn: parent
                    text: icon
                    color: iconColor
                    font.pixelSize: 29
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 6

                Text {
                    text: title
                    color: darkText
                    font.pixelSize: 11
                    font.bold: true
                }

                Text {
                    text: value
                    color: darkText
                    font.pixelSize: 25
                    font.bold: true
                }

                Text {
                    text: subtitle
                    color: positive ? "#159447" : "#EF4444"
                    font.pixelSize: 10
                }
            }
        }
    }

    component FeatureRow: RowLayout {
        property string icon: ""
        property string title: ""
        property string description: ""
        property color color: "#2563EB"

        Layout.fillWidth: true
        spacing: 11

        Rectangle {
            Layout.preferredWidth: 30
            Layout.preferredHeight: 30

            radius: 7
            color: Qt.lighter(color, 1.7)

            Text {
                anchors.centerIn: parent
                text: icon
                color: parent.parent.color
                font.pixelSize: 15
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 1

            Text {
                text: title
                color: darkText
                font.pixelSize: 11
                font.bold: true
            }

            Text {
                text: description
                color: secondaryText
                font.pixelSize: 9
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
        }
    }

    component SettingRow: RowLayout {
        property string label: ""
        property string value: ""
        property string icon: ""

        Layout.fillWidth: true
        Layout.preferredHeight: 31

        Text {
            text: icon
            color: "#34416B"
            font.pixelSize: 16
            Layout.preferredWidth: 22
        }

        Text {
            text: label
            color: darkText
            font.pixelSize: 11
            Layout.fillWidth: true
        }

        Text {
            text: value
            color: secondaryText
            font.pixelSize: 11
        }
    }

    component ToggleRow: RowLayout {
        property string label: ""
        property bool checked: false

        Layout.fillWidth: true
        Layout.preferredHeight: 31

        Text {
            text: "#"
            color: "#34416B"
            font.pixelSize: 15
            Layout.preferredWidth: 22
        }

        Text {
            text: label
            color: darkText
            font.pixelSize: 11
            Layout.fillWidth: true
        }

        Switch {
            checked: parent.checked

            indicator: Rectangle {
                implicitWidth: 34
                implicitHeight: 18
                radius: 9
                color: parent.checked
                       ? "#2676E8"
                       : "#D8DCE7"

                Rectangle {
                    width: 14
                    height: 14
                    radius: 7

                    anchors.verticalCenter: parent.verticalCenter

                    x: parent.parent.checked
                       ? parent.width - width - 2
                       : 2

                    color: "white"
                }
            }
        }
    }

    component InterviewTableHeader: Item {
        Layout.fillWidth: true
        Layout.preferredHeight: 35

        RowLayout {
            anchors.fill: parent

            Text {
                text: "Interview Title"
                Layout.fillWidth: true
                color: secondaryText
                font.pixelSize: 9
            }

            Text {
                text: "Date & Time"
                Layout.preferredWidth: 145
                color: secondaryText
                font.pixelSize: 9
            }

            Text {
                text: "Score"
                Layout.preferredWidth: 90
                color: secondaryText
                font.pixelSize: 9
            }

            Text {
                text: "Percentile"
                Layout.preferredWidth: 120
                color: secondaryText
                font.pixelSize: 9
            }

            Text {
                text: "Duration"
                Layout.preferredWidth: 105
                color: secondaryText
                font.pixelSize: 9
            }

            Text {
                text: "Status"
                Layout.preferredWidth: 95
                color: secondaryText
                font.pixelSize: 9
            }

            Text {
                text: "Action"
                Layout.preferredWidth: 120
                color: secondaryText
                font.pixelSize: 9
            }
        }
    }

    component PastInterviewRow: Rectangle {
        property string title: ""
        property string date: ""
        property string time: ""
        property string score: ""
        property string percentile: ""
        property string topText: ""
        property string duration: ""
        property color scoreColor: "#20A85A"

        Layout.fillWidth: true
        Layout.preferredHeight: 55

        color: "transparent"

        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width
            height: 1
            color: "#F0F0F4"
        }

        RowLayout {
            anchors.fill: parent

            Text {
                text: title
                Layout.fillWidth: true
                color: darkText
                font.pixelSize: 9
                font.bold: true
            }

            Column {
                Layout.preferredWidth: 145
                spacing: 1

                Text {
                    text: date
                    color: darkText
                    font.pixelSize: 9
                }

                Text {
                    text: time
                    color: secondaryText
                    font.pixelSize: 8
                }
            }

            Rectangle {
                Layout.preferredWidth: 62
                Layout.preferredHeight: 24

                radius: 5
                color: Qt.lighter(scoreColor, 1.7)

                Text {
                    anchors.centerIn: parent
                    text: score
                    color: scoreColor
                    font.pixelSize: 8
                    font.bold: true
                }
            }

            Column {
                Layout.preferredWidth: 120
                spacing: 1

                Text {
                    text: percentile
                    color: darkText
                    font.pixelSize: 9
                    font.bold: true
                }

                Text {
                    text: topText
                    color: primaryColor
                    font.pixelSize: 8
                }
            }

            Text {
                Layout.preferredWidth: 105
                text: "◷  " + duration
                color: darkText
                font.pixelSize: 8
            }

            Rectangle {
                Layout.preferredWidth: 70
                Layout.preferredHeight: 23

                radius: 6
                color: "#E8F8EE"

                Text {
                    anchors.centerIn: parent
                    text: "Completed"
                    color: "#159447"
                    font.pixelSize: 8
                }
            }

            Button {
                Layout.preferredWidth: 92
                Layout.preferredHeight: 29

                text: "View Report"

                background: Rectangle {
                    radius: 5
                    color: "white"
                    border.color: "#6B8BEA"
                    border.width: 1
                }

                contentItem: Text {
                    text: parent.text
                    color: "#2563EB"
                    font.pixelSize: 8

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Text {
                Layout.preferredWidth: 20
                text: "⋮"
                color: darkText
                font.pixelSize: 17
            }
        }
    }
}
