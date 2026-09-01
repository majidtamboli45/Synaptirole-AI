import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "."

Popup {
    id: root
    property string questionNumber: "Question 3 of 10"
    property string difficulty: "Medium"
    property string questionText: ""
    property bool showProceed: true

    signal proceed()

    anchors.centerIn: parent
    width: 560
    modal: true
    dim: true
    padding: 0

    background: Rectangle {
        radius: 18
        color: Theme.card
        border.color: Theme.border
    }

    enter: Transition {
        NumberAnimation { property: "scale"; from: 0.92; to: 1.0; duration: 180; easing.type: Easing.OutCubic }
        NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 180 }
    }

    contentItem: ColumnLayout {
        spacing: 18

        Rectangle {
            Layout.fillWidth: true
            height: 6
            radius: 3
            Layout.leftMargin: 24
            Layout.rightMargin: 24
            Layout.topMargin: 24
            gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop { position: 0; color: Theme.primary }
                GradientStop { position: 1; color: Theme.blue }
            }
        }

        RowLayout {
            Layout.leftMargin: 28
            Layout.rightMargin: 28
            spacing: 12

            Rectangle {
                width: 44; height: 44; radius: 22
                gradient: Gradient {
                    GradientStop { position: 0; color: "#8b5cf6" }
                    GradientStop { position: 1; color: "#5b21b6" }
                }
                Text {
                    anchors.centerIn: parent
                    text: "\u{1F916}"
                    font.pixelSize: 20
                }
            }

            ColumnLayout {
                spacing: 2
                Text {
                    text: root.questionNumber
                    font.family: Theme.fontName
                    font.pixelSize: 15
                    font.weight: Font.Bold
                    color: Theme.text
                }
                Text {
                    text: "AI Interviewer \u2022 " + root.difficulty
                    font.family: Theme.fontName
                    font.pixelSize: 12
                    color: Theme.muted
                }
            }

            Item { Layout.fillWidth: true }

            Rectangle {
                radius: 9
                height: 26
                width: diffLabel.implicitWidth + 20
                color: Theme.amberSoft
                border.color: "#fde68a"
                Text {
                    id: diffLabel
                    anchors.centerIn: parent
                    text: root.difficulty
                    font.family: Theme.fontName
                    font.pixelSize: 12
                    font.weight: Font.DemiBold
                    color: "#b45309"
                }
            }
        }

        Text {
            Layout.leftMargin: 28
            Layout.rightMargin: 28
            text: root.questionText
            wrapMode: Text.WordWrap
            font.family: Theme.fontName
            font.pixelSize: 19
            font.weight: Font.Medium
            lineHeight: 1.35
            color: Theme.text
        }

        RowLayout {
            Layout.leftMargin: 28
            Layout.rightMargin: 28
            Layout.bottomMargin: 26
            Layout.topMargin: 4
            spacing: 12

            Text {
                text: "\u{1F4A1} Answer clearly with examples from your experience"
                font.family: Theme.fontName
                font.pixelSize: 12
                color: Theme.muted
                Layout.fillWidth: true
                elide: Text.ElideRight
            }

            AppButton {
                text: "Start Answering"
                iconText: "\u{1F3A4}"
                onClicked: {
                    root.close()
                    root.proceed()
                }
            }
        }
    }
}
