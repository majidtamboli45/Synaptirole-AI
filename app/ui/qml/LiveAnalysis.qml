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
                        text: "Live Analysis"
                        font.family: Theme.fontName
                        font.pixelSize: 24
                        font.weight: Font.Bold
                        color: Theme.text
                    }
                    Text {
                        text: "Real-time multimodal analysis of your audio, video and communication during mock interviews."
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

            Card {
                Layout.fillWidth: true
                Layout.preferredHeight: 150

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 22
                    spacing: 30

                    ProgressRing {
                        value: 88
                        size: 106
                        ringColor: Theme.green
                        label: "88"
                        subLabel: "Session Health"
                    }

                    Rectangle { Layout.preferredWidth: 1; Layout.fillHeight: true; color: Theme.border }

                    GridLayout {
                        Layout.fillWidth: true
                        columns: 3
                        columnSpacing: 40
                        rowSpacing: 12

                        Repeater {
                            model: [
                                { icon: "\u{1F4C8}", k: "Speech Rate", v: "132 wpm", ok: true },
                                { icon: "\u{23F8}\uFE0F", k: "Avg Pause", v: "0.8 sec", ok: true },
                                { icon: "\u{1F3A7}", k: "Volume Level", v: "Optimal", ok: true },
                                { icon: "\u{1F9E0}", k: "Fluency Score", v: "91%", ok: true },
                                { icon: "\u{1F5E3}\uFE0F", k: "Filler Words", v: "3 detected", ok: false },
                                { icon: "\u{23F1}\uFE0F", k: "Response Duration", v: "1m 42s avg", ok: true }
                            ]
                            delegate: Row {
                                spacing: 12
                                layoutDirection: Qt.LeftToRight

                                Rectangle {
                                    width: 42; height: 42; radius: 12
                                    color: modelData.ok ? Theme.greenSoft : Theme.amberSoft
                                    Text { anchors.centerIn: parent; text: modelData.icon; font.pixelSize: 17 }
                                    anchors.verticalCenter: parent.verticalCenter
                                }

                                Column {
                                    anchors.verticalCenter: parent.verticalCenter
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
                                        font.pixelSize: 14
                                        font.weight: Font.Bold
                                        color: modelData.ok ? Theme.text : "#b45309"
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
                    Layout.preferredHeight: 300

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 22
                        spacing: 14

                        RowLayout {
                            Layout.fillWidth: true

                            Column {
                                spacing: 2
                                Text {
                                    text: "Video Behavior Metrics"
                                    font.family: Theme.fontName
                                    font.pixelSize: 15
                                    font.weight: Font.Bold
                                    color: Theme.text
                                }
                                Text {
                                    text: "MediaPipe landmarks \u2022 measured behavioral indicators only"
                                    font.family: Theme.fontName
                                    font.pixelSize: 11
                                    color: Theme.faint
                                }
                            }
                            Item { Layout.fillWidth: true }
                        }

                        Repeater {
                            model: [
                                { label: "Camera-Facing Orientation", value: 94, ok: true },
                                { label: "Head Orientation Stability", value: 89, ok: true },
                                { label: "Posture / Shoulder Alignment", value: 85, ok: true },
                                { label: "Hand Movement Control", value: 76, ok: true },
                                { label: "Movement Stability", value: 90, ok: true },
                                { label: "Eye Contact / Gaze Centered", value: 68, ok: false }
                            ]
                            delegate: HBarRow {
                                required property var modelData
                                Layout.fillWidth: true
                                label: modelData.label
                                value: modelData.value
                                barColor: modelData.ok ? "#16a34a" : "#d97706"
                            }
                        }

                        Item { Layout.fillHeight: true }

                        Text {
                            text: "\u2139 Facial-expression analysis is intentionally excluded from evaluation."
                            font.family: Theme.fontName
                            font.pixelSize: 11
                            color: Theme.faint
                        }
                    }
                }

                Card {
                    Layout.preferredWidth: 380
                    Layout.fillHeight: true

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 22
                        spacing: 14

                        Column {
                            spacing: 2
                            Text {
                                text: "Communication Signals"
                                font.family: Theme.fontName
                                font.pixelSize: 15
                                font.weight: Font.Bold
                                color: Theme.text
                            }
                            Text {
                                text: "Whisper transcript + Librosa acoustic features"
                                font.family: Theme.fontName
                                font.pixelSize: 11
                                color: Theme.faint
                            }
                        }

                        Repeater {
                            model: [
                                { label: "Answer Relevance (RAG verified)", value: 86, ok: true },
                                { label: "Technical Correctness", value: 81, ok: true },
                                { label: "Structure & Clarity", value: 74, ok: true },
                                { label: "Confidence (vocal stability)", value: 79, ok: true },
                                { label: "Keyword Coverage vs JD", value: 63, ok: false }
                            ]
                            delegate: HBarRow {
                                required property var modelData
                                Layout.fillWidth: true
                                label: modelData.label
                                value: modelData.value
                                barColor: modelData.ok ? Theme.primary : "#d97706"
                            }
                        }

                        Item { Layout.fillHeight: true }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 54
                            radius: 12
                            color: "#fbfbfe"
                            border.color: Theme.border

                            Row {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 14
                                spacing: 10

                                Text { text: "\u26A1"; font.pixelSize: 16; anchors.verticalCenter: parent.verticalCenter }

                                Text {
                                    width: 280
                                    text: "Scores finalize after the interview ends. Live values are indicators only."
                                    font.family: Theme.fontName
                                    font.pixelSize: 11
                                    color: Theme.muted
                                    wrapMode: Text.WordWrap
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                        }
                    }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 14

                AppButton {
                    text: "Back to Interview"
                    onClicked: App?.navigate("interview")
                }
                AppButton {
                    kind: "secondary"
                    text: "View Final Report"
                    onClicked: App?.navigate("reports")
                }
                Item { Layout.fillWidth: true }
            }
        }
    }
}
