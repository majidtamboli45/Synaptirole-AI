import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

Item {
    id: root

    function openPreview(title) {
        previewTitle.text = title
        previewPopup.open()
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
            spacing: 20

            RowLayout {
                Layout.fillWidth: true

                Column {
                    spacing: 4
                    Text {
                        text: "Resume & Job Description"
                        font.family: Theme.fontName
                        font.pixelSize: 24
                        font.weight: Font.Bold
                        color: Theme.text
                    }
                    Text {
                        text: "Upload and manage your documents for personalized interviews."
                        font.family: Theme.fontName
                        font.pixelSize: 13
                        color: Theme.muted
                    }
                }

                Item { Layout.fillWidth: true }

                NotificationBell { badgeCount: 3 }

                ProfileChip {
                    onViewProfile: App?.navigate("profile")
                    onOpenAccount: App?.navigate("account")
                    onOpenSettings: App?.navigate("settings")
                    onDoLogout: App?.logout()
                }
            }

            Rectangle {
                Layout.fillWidth: true
                height: 54
                radius: 12
                color: Theme.greenSoft
                border.color: "#bbf7d0"

                Row {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 18
                    spacing: 10

                    Rectangle {
                        width: 26; height: 26; radius: 13
                        color: Theme.green
                        Text { anchors.centerIn: parent; text: "\u2713"; color: "#ffffff"; font.pixelSize: 13; font.weight: Font.Bold }
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Column {
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 0
                        Text {
                            text: "Documents uploaded & parsed successfully"
                            font.family: Theme.fontName
                            font.pixelSize: 13
                            font.weight: Font.DemiBold
                            color: "#166534"
                        }
                        Text {
                            text: "Resume is ready \u2022 Job Description is ready \u2022 You can proceed to Mock Interviews"
                            font.family: Theme.fontName
                            font.pixelSize: 11
                            color: "#15803d"
                        }
                    }
                }
            }

            Row {
                spacing: 8

                Repeater {
                    model: [
                        { n: 1, label: "Upload Documents", done: true },
                        { n: 2, label: "Documents Parsed", done: true },
                        { n: 3, label: "Ready for Mock Interviews", done: true }
                    ]
                    delegate: Row {
                        spacing: 8

                        Rectangle {
                            width: stepRow.implicitWidth + 28
                            height: 38
                            radius: 19
                            color: modelData.done ? Theme.primarySoft : "#f1f5f9"
                            border.color: modelData.done ? "#ddd2f7" : Theme.border

                            Row {
                                id: stepRow
                                anchors.centerIn: parent
                                spacing: 8

                                Rectangle {
                                    width: 22; height: 22; radius: 11
                                    color: modelData.done ? Theme.primary : Theme.faint
                                    anchors.verticalCenter: parent.verticalCenter
                                    Text {
                                        anchors.centerIn: parent
                                        text: modelData.done ? "\u2713" : modelData.n
                                        color: "#ffffff"
                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        font.weight: Font.Bold
                                    }
                                }

                                Text {
                                    text: modelData.label
                                    font.family: Theme.fontName
                                    font.pixelSize: 12
                                    font.weight: Font.Medium
                                    color: modelData.done ? Theme.primaryDark : Theme.muted
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                        }

                        Text {
                            visible: modelData.n < 3
                            text: "\u2500\u2500\u2500"
                            color: Theme.border
                            font.pixelSize: 14
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
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
                        anchors.margins: 24
                        spacing: 14

                        RowLayout {
                            Layout.fillWidth: true

                            Row {
                                spacing: 12

                                Rectangle {
                                    width: 46; height: 56; radius: 8
                                    color: Theme.redSoft
                                    border.color: "#fecaca"
                                    Text {
                                        anchors.centerIn: parent
                                        text: "PDF"
                                        font.family: Theme.fontName
                                        font.pixelSize: 12
                                        font.weight: Font.Bold
                                        color: "#dc2626"
                                    }
                                }

                                Column {
                                    anchors.verticalCenter: parent.verticalCenter
                                    spacing: 3

                                    Text {
                                        text: "Resume"
                                        font.family: Theme.fontName
                                        font.pixelSize: 16
                                        font.weight: Font.Bold
                                        color: Theme.text
                                    }
                                    Text {
                                        text: "Arjun_Sharma_Resume.pdf \u2022 Uploaded 21 May 2025 \u2022 245 KB"
                                        font.family: Theme.fontName
                                        font.pixelSize: 12
                                        color: Theme.muted
                                    }
                                }
                            }

                            Item { Layout.fillWidth: true }

                            Rectangle {
                                radius: 12
                                height: 24
                                width: parsedLabel.implicitWidth + 20
                                color: Theme.greenSoft
                                Layout.alignment: Qt.AlignVCenter
                                Text {
                                    id: parsedLabel
                                    anchors.centerIn: parent
                                    text: "\u2713 Parsed"
                                    font.family: Theme.fontName
                                    font.pixelSize: 11
                                    font.weight: Font.DemiBold
                                    color: "#15803d"
                                }
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 1
                            color: Theme.border
                        }

                        Text {
                            text: "Quick Preview"
                            font.family: Theme.fontName
                            font.pixelSize: 13
                            font.weight: Font.DemiBold
                            color: Theme.muted
                        }

                        GridLayout {
                            Layout.fillWidth: true
                            columns: 2
                            columnSpacing: 16
                            rowSpacing: 10

                            Repeater {
                                model: [
                                    { k: "Name", v: "Arjun Sharma" },
                                    { k: "Experience", v: "2+ Years" },
                                    { k: "Current Role", v: "AI/ML Engineer" },
                                    { k: "Current Company", v: "TechNova Solutions" }
                                ]
                                delegate: Column {
                                    Layout.fillWidth: true
                                    spacing: 2
                                    Text {
                                        text: modelData.k
                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        color: Theme.faint
                                    }
                                    Text {
                                        text: modelData.v
                                        font.family: Theme.fontName
                                        font.pixelSize: 13
                                        font.weight: Font.Medium
                                        color: Theme.text
                                    }
                                }
                            }
                        }

                        Item { Layout.fillHeight: true }

                        Row {
                            spacing: 10

                            AppButton {
                                text: "Preview Resume"
                                iconText: "\u{1F441}"
                                onClicked: root.openPreview("Arjun_Sharma_Resume.pdf")
                            }
                            AppButton {
                                kind: "secondary"
                                text: "Re-upload"
                                iconText: "\u{1F504}"
                                onClicked: App?.notify("Choose a new resume file to replace the current one.")
                            }
                        }
                    }
                }

                Card {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 330

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 24
                        spacing: 14

                        RowLayout {
                            Layout.fillWidth: true

                            Row {
                                spacing: 12

                                Rectangle {
                                    width: 46; height: 56; radius: 8
                                    color: Theme.blueSoft
                                    border.color: "#bfdbfe"
                                    Text {
                                        anchors.centerIn: parent
                                        text: "PDF"
                                        font.family: Theme.fontName
                                        font.pixelSize: 12
                                        font.weight: Font.Bold
                                        color: "#2563eb"
                                    }
                                }

                                Column {
                                    anchors.verticalCenter: parent.verticalCenter
                                    spacing: 3

                                    Text {
                                        text: "Job Description"
                                        font.family: Theme.fontName
                                        font.pixelSize: 16
                                        font.weight: Font.Bold
                                        color: Theme.text
                                    }
                                    Text {
                                        text: "AIML_Engineer_JD.pdf \u2022 Uploaded 21 May 2025 \u2022 180 KB"
                                        font.family: Theme.fontName
                                        font.pixelSize: 12
                                        color: Theme.muted
                                    }
                                }
                            }

                            Item { Layout.fillWidth: true }

                            Rectangle {
                                radius: 12
                                height: 24
                                width: parsedLabel2.implicitWidth + 20
                                color: Theme.greenSoft
                                Layout.alignment: Qt.AlignVCenter
                                Text {
                                    id: parsedLabel2
                                    anchors.centerIn: parent
                                    text: "\u2713 Parsed"
                                    font.family: Theme.fontName
                                    font.pixelSize: 11
                                    font.weight: Font.DemiBold
                                    color: "#15803d"
                                }
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 1
                            color: Theme.border
                        }

                        Text {
                            text: "Quick Preview"
                            font.family: Theme.fontName
                            font.pixelSize: 13
                            font.weight: Font.DemiBold
                            color: Theme.muted
                        }

                        GridLayout {
                            columns: 2
                            columnSpacing: 16
                            rowSpacing: 10

                            Repeater {
                                model: [
                                    { k: "Job Title", v: "AI/ML Engineer" },
                                    { k: "Experience Required", v: "2+ Years" },
                                    { k: "Employment Type", v: "Full-Time" },
                                    { k: "Location", v: "Pune / Hybrid" }
                                ]
                                delegate: Column {
                                    spacing: 2
                                    Text {
                                        text: modelData.k
                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        color: Theme.faint
                                    }
                                    Text {
                                        text: modelData.v
                                        font.family: Theme.fontName
                                        font.pixelSize: 13
                                        font.weight: Font.Medium
                                        color: Theme.text
                                    }
                                }
                            }
                        }

                        Flow {
                            spacing: 6
                            clip: true
                            height: 30

                            Repeater {
                                model: ["Python", "Machine Learning", "Deep Learning", "NLP", "SQL", "TensorFlow"]
                                delegate: Rectangle {
                                    width: chipLabel.implicitWidth + 18
                                    height: 24
                                    radius: 12
                                    color: Theme.blueSoft
                                    Text {
                                        id: chipLabel
                                        anchors.centerIn: parent
                                        text: modelData
                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        color: "#1d4ed8"
                                    }
                                }
                            }
                        }

                        Item { Layout.fillHeight: true }

                        Row {
                            spacing: 10

                            AppButton {
                                text: "Preview JD"
                                iconText: "\u{1F441}"
                                onClicked: root.openPreview("AIML_Engineer_JD.pdf")
                            }
                            AppButton {
                                kind: "secondary"
                                text: "Re-upload"
                                iconText: "\u{1F504}"
                                onClicked: App?.notify("Choose a new JD file to replace the current one.")
                            }
                        }
                    }
                }
            }

            Card {
                Layout.fillWidth: true
                Layout.preferredHeight: 190

                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0; color: "#4c1d95" }
                    GradientStop { position: 1; color: "#1e3a8a" }
                }
                border.width: 0

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 28
                    spacing: 24

                    Column {
                        Layout.fillWidth: true
                        spacing: 8

                        Text {
                            text: "Ready to Start Your Mock Interviews?"
                            font.family: Theme.fontName
                            font.pixelSize: 20
                            font.weight: Font.Bold
                            color: "#ffffff"
                        }
                        Text {
                            width: 520
                            text: "The system will generate Resume-based, JD-based, Technical and Experience-based questions tailored to your profile."
                            wrapMode: Text.WordWrap
                            font.family: Theme.fontName
                            font.pixelSize: 13
                            color: "#c7d2fe"
                            lineHeight: 1.25
                        }
                    }

                    Column {
                        spacing: 10
                        Layout.alignment: Qt.AlignVCenter

                        Button {
                            id: proceedBtn
                            width: 280
                            height: 48

                            contentItem: Row {
                                spacing: 10
                                anchors.centerIn: parent
                                Text {
                                    text: "Proceed to Mock Interviews"
                                    font.family: Theme.fontName
                                    font.pixelSize: 14
                                    font.weight: Font.DemiBold
                                    color: "#ffffff"
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Text {
                                    text: "\u2192"
                                    font.pixelSize: 15
                                    font.weight: Font.Bold
                                    color: "#ffffff"
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }

                            background: Rectangle {
                                radius: 12
                                color: proceedArea.containsMouse ? "#a78bfa" : "#7c3aed"
                                Behavior on color { ColorAnimation { duration: 120 } }
                            }

                            MouseArea {
                                id: proceedArea
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: App?.navigate("interview")
                            }
                        }

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "\u23F1 Takes ~30-45 mins"
                            font.family: Theme.fontName
                            font.pixelSize: 12
                            color: "#c7d2fe"
                        }
                    }
                }
            }

            Row {
                spacing: 8
                Layout.alignment: Qt.AlignHCenter

                Text {
                    text: "\u2190 Back to Dashboard"
                    font.family: Theme.fontName
                    font.pixelSize: 13
                    font.weight: Font.Medium
                    color: Theme.primary
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                        onClicked: App?.navigate("dashboard")
                    }
                }
            }
        }
    }

    Popup {
        id: previewPopup
        anchors.centerIn: parent
        width: Math.min(680, root.width - 80)
        height: Math.min(520, root.height - 80)
        modal: true
        dim: true
        padding: 0

        background: Rectangle { radius: 16; color: Theme.card; border.color: Theme.border }

        contentItem: ColumnLayout {
            spacing: 0

            Item {
                Layout.fillWidth: true
                height: 58

                Text {
                    id: previewTitle
                    anchors.left: parent.left
                    anchors.leftMargin: 24
                    anchors.verticalCenter: parent.verticalCenter
                    text: ""
                    font.family: Theme.fontName
                    font.pixelSize: 15
                    font.weight: Font.Bold
                    color: Theme.text
                }

                Rectangle {
                    anchors.right: parent.right
                    anchors.rightMargin: 18
                    anchors.verticalCenter: parent.verticalCenter
                    width: 32; height: 32; radius: 9
                    color: closeArea.containsMouse ? "#f1f5f9" : "transparent"
                    Text { anchors.centerIn: parent; text: "\u2715"; color: Theme.muted; font.pixelSize: 14 }
                    MouseArea {
                        id: closeArea
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: previewPopup.close()
                    }
                }

                Rectangle { anchors.bottom: parent.bottom; width: parent.width; height: 1; color: Theme.border }
            }

            ScrollView {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.margins: 24

                TextArea {
                    readOnly: true
                    wrapMode: TextArea.Wrap
                    text: "ARJUN SHARMA\nAI/ML Engineer \u2022 Pune, Maharashtra \u2022 arjun.sharma@gmail.com\n\nEXPERIENCE\n\nAI/ML Engineer - TechNova Solutions (2024 - Present)\n- Built and deployed ML pipelines processing 2M+ records daily.\n- Developed NLP models for document classification with 94% accuracy.\n- Collaborated with cross-functional teams to productionize models.\n\nMachine Learning Intern - DataSpark Labs (2023 - 2024)\n- Implemented CNN-based image quality checks reducing manual review by 60%.\n- Automated ETL workflows in Python and SQL.\n\nEDUCATION\n\nB.Tech in Artificial Intelligence & Data Science\nV.P.K.B.I.E.T, Baramati (2020 - 2024)\n\nSKILLS\nPython \u2022 Machine Learning \u2022 Deep Learning \u2022 NLP \u2022 SQL \u2022 TensorFlow \u2022 React.js\n\nPROJECTS\n\nSmart Resume Screener - Semantic matching of resumes to job descriptions using SBERT.\nVoice Notes Summarizer - Whisper + LLM based meeting summarization tool.\n\nCERTIFICATIONS\nDeep Learning Specialization - DeepLearning.AI (2024)"
                    font.family: "Consolas"
                    font.pixelSize: 12
                    color: Theme.text
                    background: Rectangle { color: "#fafbfe"; radius: 10; border.color: Theme.border }
                }
            }
        }
    }
}
