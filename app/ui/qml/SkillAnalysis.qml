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
            spacing: 20

            RowLayout {
                Layout.fillWidth: true

                Column {
                    spacing: 4
                    Text {
                        text: "Skill Analysis"
                        font.family: Theme.fontName
                        font.pixelSize: 24
                        font.weight: Font.Bold
                        color: Theme.text
                    }
                    Text {
                        text: "Semantic matching between your resume skills and job requirements (SBERT)."
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

            RowLayout {
                Layout.fillWidth: true
                spacing: 18

                Card {
                    Layout.preferredWidth: 300
                    Layout.fillHeight: true

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 22
                        spacing: 16

                        Text {
                            text: "Matching Overview"
                            font.family: Theme.fontName
                            font.pixelSize: 15
                            font.weight: Font.Bold
                            color: Theme.text
                        }

                        RowLayout {
                            Layout.alignment: Qt.AlignHCenter
                            spacing: 28

                            ProgressRing {
                                value: 72
                                size: 118
                                ringColor: Theme.green
                                subLabel: "Skills Matched"
                            }

                            ProgressRing {
                                value: 68
                                size: 118
                                ringColor: Theme.primary
                                subLabel: "Resume-JD Fit"
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 1
                            color: Theme.border
                        }

                        Repeater {
                            model: [
                                { c: "#22c55e", label: "Matched", v: "9 skills" },
                                { c: "#f59e0b", label: "Partially Matched", v: "3 skills" },
                                { c: "#ef4444", label: "Missing", v: "4 skills" }
                            ]
                            delegate: Row {
                                spacing: 10
                                Rectangle {
                                    width: 12; height: 12; radius: 6
                                    color: modelData.c
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Text {
                                    text: modelData.label
                                    font.family: Theme.fontName
                                    font.pixelSize: 13
                                    color: Theme.text
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Item { width: 1; height: 1 }
                                Text {
                                    text: modelData.v
                                    font.family: Theme.fontName
                                    font.pixelSize: 13
                                    font.weight: Font.DemiBold
                                    color: Theme.muted
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                        }

                        Item { Layout.fillHeight: true }

                        Text {
                            Layout.fillWidth: true
                            text: "\u{1F4A1} Add Docker & Kubernetes to your profile to reach 85%+ match."
                            wrapMode: Text.WordWrap
                            font.family: Theme.fontName
                            font.pixelSize: 12
                            color: Theme.muted
                        }
                    }
                }

                Card {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 330

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 22
                        spacing: 10

                        Text {
                            text: "Skill Constellation"
                            font.family: Theme.fontName
                            font.pixelSize: 15
                            font.weight: Font.Bold
                            color: Theme.text
                        }

                        SkillConstellation {
                            id: constellation
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            centerLabel: "AI/ML Engineer"
                            nodes: [
                                { name: "Python", status: 0, score: 95, x: -0.62, y: -0.55 },
                                { name: "Machine Learning", status: 0, score: 90, x: 0.05, y: -0.78 },
                                { name: "SQL", status: 0, score: 82, x: 0.68, y: -0.5 },
                                { name: "NLP", status: 1, score: 65, x: 0.8, y: 0.25 },
                                { name: "Deep Learning", status: 0, score: 78, x: 0.45, y: 0.7 },
                                { name: "Docker", status: 2, score: 30, x: -0.3, y: 0.75 },
                                { name: "Kubernetes", status: 2, score: 22, x: -0.78, y: 0.35 },
                                { name: "TensorFlow", status: 1, score: 60, x: -0.85, y: -0.25 },
                                { name: "React.js", status: 0, score: 74, x: -0.25, y: -0.35 }
                            ]
                        }

                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            text: "\u25CF Matched    \u25CF Partial    \u25CF Missing"
                            font.family: Theme.fontName
                            font.pixelSize: 11
                            color: Theme.muted
                        }
                    }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 18

                Repeater {
                    model: [
                        {
                            title: "Matched Skills",
                            tint: "#22c55e",
                            items: [
                                { name: "Python", score: 92, up: true },
                                { name: "Machine Learning", score: 88, up: true },
                                { name: "SQL", score: 84, up: true },
                                { name: "Data Structures", score: 80, up: false }
                            ]
                        },
                        {
                            title: "Partially Matched",
                            tint: "#f59e0b",
                            items: [
                                { name: "Deep Learning", score: 62, up: true },
                                { name: "NLP", score: 55, up: true },
                                { name: "TensorFlow", score: 48, up: false },
                                { name: "System Design", score: 58, up: true }
                            ]
                        },
                        {
                            title: "Missing Skills",
                            tint: "#ef4444",
                            items: [
                                { name: "Docker", score: 18, up: false },
                                { name: "Kubernetes", score: 12, up: false },
                                { name: "AWS Cloud", score: 25, up: false },
                                { name: "MLOps", score: 20, up: true }
                            ]
                        }
                    ]
                    delegate: Card {
                        id: skillGroup
                        required property var modelData
                        Layout.fillWidth: true
                        Layout.preferredHeight: 320

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 20
                            spacing: 12

                            Text {
                                text: skillGroup.modelData.title
                                font.family: Theme.fontName
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                color: Theme.text
                            }

                            Repeater {
                                model: skillGroup.modelData.items
                                delegate: SkillCard {
                                    id: scItem
                                    required property var modelData
                                    skillName: scItem.modelData.name
                                    score: scItem.modelData.score
                                    improving: scItem.modelData.up
                                    barColor: skillGroup.modelData.tint === "#22c55e" ? "#16a34a" : (skillGroup.modelData.tint === "#f59e0b" ? "#d97706" : "#dc2626")
                                }
                            }

                            Item { Layout.fillHeight: true }
                        }
                    }
                }
            }

            Rectangle {
                Layout.fillWidth: true
                height: 64
                radius: 14
                color: Theme.primarySoft
                border.color: "#ddd2f7"

                Row {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    spacing: 12

                    Text { text: "\u{1F9ED}"; font.pixelSize: 20; anchors.verticalCenter: parent.verticalCenter }

                    Text {
                        width: 900
                        text: "Recommendation: Strengthen Deep Learning fundamentals and add containerization (Docker/Kubernetes) skills to close the largest gaps for the AI/ML Engineer role."
                        font.family: Theme.fontName
                        font.pixelSize: 13
                        font.weight: Font.Medium
                        color: Theme.primaryDark
                        wrapMode: Text.WordWrap
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Item { width: 1; height: 1 }

                    AppButton {
                        text: "Start Improvement Plan"
                        anchors.verticalCenter: parent.verticalCenter
                        onClicked: App?.notify("Personalized improvement plan generated.")
                    }
                }
            }
        }
    }
}
