import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

Item {
    id: root

    property bool editMode: false
    property var skillList: ["Python", "Machine Learning", "Deep Learning", "NLP", "SQL", "React.js", "TensorFlow"]

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
                        text: "My Profile"
                        font.family: Theme.fontName
                        font.pixelSize: 24
                        font.weight: Font.Bold
                        color: Theme.text
                    }
                    Text {
                        text: "Manage your personal and professional information."
                        font.family: Theme.fontName
                        font.pixelSize: 13
                        color: Theme.muted
                    }
                }

                Item { Layout.fillWidth: true }

                AppButton {
                    visible: !root.editMode
                    text: "Edit Profile"
                    iconText: "\u270F\uFE0F"
                    onClicked: root.editMode = true
                }
                AppButton {
                    visible: root.editMode
                    kind: "secondary"
                    text: "Cancel"
                    onClicked: root.editMode = false
                }
                AppButton {
                    visible: root.editMode
                    text: "Save Changes"
                    onClicked: {
                        root.editMode = false
                        App?.saveProfile()
                    }
                }
            }

            Card {
                Layout.fillWidth: true
                Layout.preferredHeight: 250

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 26
                    spacing: 30

                    Item {
                        width: 120
                        height: 120

                        Rectangle {
                            id: avatar
                            width: 110; height: 110; radius: 55
                            anchors.centerIn: parent
                            gradient: Gradient {
                                GradientStop { position: 0; color: "#8b5cf6" }
                                GradientStop { position: 1; color: "#4f46e5" }
                            }
                            Text {
                                anchors.centerIn: parent
                                text: "AS"
                                font.family: Theme.fontName
                                font.pixelSize: 38
                                font.weight: Font.Bold
                                color: "#ffffff"
                            }
                        }

                        Rectangle {
                            width: 36; height: 36; radius: 18
                            color: root.editMode ? Theme.primary : "#ffffff"
                            border.color: Theme.border
                            border.width: root.editMode ? 0 : 1.4
                            anchors.bottom: parent.bottom
                            anchors.right: parent.right
                            visible: true

                            Text {
                                anchors.centerIn: parent
                                text: "\u{1F4F7}"
                                font.pixelSize: 15
                            }

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                enabled: root.editMode
                                onClicked: App?.notify("Choose a new profile picture.")
                            }
                        }
                    }

                    GridLayout {
                        Layout.fillWidth: true
                        columns: 3
                        columnSpacing: 40
                        rowSpacing: 18

                        component InfoField : Column {
                            property string label: ""
                            property string value: ""

                            spacing: 5
                            Text {
                                text: label
                                font.family: Theme.fontName
                                font.pixelSize: 11
                                color: Theme.faint
                            }
                            Text {
                                text: value
                                font.family: Theme.fontName
                                font.pixelSize: 14
                                font.weight: Font.Medium
                                color: Theme.text
                            }
                        }

                        InfoField { label: "Full Name"; value: (App?.userName ?? "") }
                        InfoField { label: "Email Address"; value: (App?.userEmail ?? "") }
                        InfoField { label: "Phone Number"; value: (App?.userPhone ?? "") }
                        InfoField { label: "Job Role"; value: "AI/ML Engineer" }
                        InfoField { label: "Experience"; value: "2+ Years" }
                        InfoField { label: "Location"; value: (App?.userLocation ?? "") }

                        Column {
                            Layout.columnSpan: 2
                            Layout.fillWidth: true
                            spacing: 5

                            Text {
                                text: "Bio"
                                font.family: Theme.fontName
                                font.pixelSize: 11
                                color: Theme.faint
                            }
                            Text {
                                width: 420
                                text: "Passionate about building AI solutions and solving real-world problems."
                                wrapMode: Text.WordWrap
                                font.family: Theme.fontName
                                font.pixelSize: 14
                                font.weight: Font.Medium
                                color: Theme.text
                                lineHeight: 1.25
                            }
                        }
                    }
                }
            }

            Card {
                Layout.fillWidth: true
                Layout.preferredHeight: 330

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 26
                    spacing: 18

                    Text {
                        text: "Professional Details"
                        font.family: Theme.fontName
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        color: Theme.text
                    }

                    GridLayout {
                        Layout.fillWidth: true
                        columns: 3
                        columnSpacing: 40
                        rowSpacing: 18

                        Repeater {
                            model: [
                                { k: "Highest Education", v: "B.Tech in Artificial Intelligence & Data Science" },
                                { k: "Institute", v: "V.P.K.B.I.E.T, Baramati" },
                                { k: "Years of Experience", v: "2+ Years" },
                                { k: "LinkedIn Profile", v: "linkedin.com/in/arjun-sharma \u{1F310}" },
                                { k: "GitHub Profile", v: "github.com/arjunsharma \u{1F4BB}" }
                            ]
                            delegate: Column {
                                required property var modelData
                                Layout.fillWidth: true
                                spacing: 5

                                Text {
                                    text: modelData.k
                                    font.family: Theme.fontName
                                    font.pixelSize: 11
                                    color: Theme.faint
                                }
                                Text {
                                    width: 260
                                    elide: Text.ElideRight
                                    text: modelData.v
                                    font.family: Theme.fontName
                                    font.pixelSize: 14
                                    font.weight: Font.Medium
                                    color: Theme.text
                                }
                            }
                        }

                        Column {
                            Layout.fillWidth: true
                            spacing: 8

                            Text {
                                text: "Skills"
                                font.family: Theme.fontName
                                font.pixelSize: 11
                                color: Theme.faint
                            }

                            Flow {
                                width: 480
                                spacing: 7

                                Repeater {
                                    model: root.skillList
                                    delegate: Rectangle {
                                        required property string modelData
                                        required property int index
                                        width: skLabel.implicitWidth + (root.editMode ? 34 : 22)
                                        height: 27
                                        radius: 13.5
                                        color: Theme.primarySoft
                                        border.color: "#ddd2f7"

                                        Row {
                                            anchors.centerIn: parent
                                            spacing: 6

                                            Text {
                                                id: skLabel
                                                text: modelData
                                                font.family: Theme.fontName
                                                font.pixelSize: 12
                                                font.weight: Font.Medium
                                                color: Theme.primaryDark
                                                anchors.verticalCenter: parent.verticalCenter
                                            }

                                            Text {
                                                visible: root.editMode
                                                text: "\u2715"
                                                font.pixelSize: 10
                                                font.weight: Font.Bold
                                                color: Theme.muted
                                                anchors.verticalCenter: parent.verticalCenter

                                                MouseArea {
                                                    anchors.fill: parent
                                                    cursorShape: Qt.PointingHandCursor
                                                    onClicked: {
                                                        var list = root.skillList.slice()
                                                        list.splice(index, 1)
                                                        root.skillList = list
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }

                                Rectangle {
                                    visible: root.editMode
                                    width: addLabel.implicitWidth + 24
                                    height: 27
                                    radius: 13.5
                                    color: "#ffffff"
                                    border.color: Theme.primary

                                    Text {
                                        id: addLabel
                                        anchors.centerIn: parent
                                        text: "+ Add Skill"
                                        font.family: Theme.fontName
                                        font.pixelSize: 12
                                        font.weight: Font.DemiBold
                                        color: Theme.primary
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: App?.notify("Type a skill name to add it to your profile.")
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Card {
                Layout.fillWidth: true
                Layout.preferredHeight: 130

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 26
                    spacing: 60

                    Text {
                        text: "Account Details"
                        font.family: Theme.fontName
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        color: Theme.text
                    }

                    Column {
                        spacing: 5
                        Text {
                            text: "Member Since"
                            font.family: Theme.fontName
                            font.pixelSize: 11
                            color: Theme.faint
                        }
                        Text {
                            text: (App?.memberSince ?? "")
                            font.family: Theme.fontName
                            font.pixelSize: 14
                            font.weight: Font.Medium
                            color: Theme.text
                        }
                    }

                    Column {
                        spacing: 5
                        Text {
                            text: "Account Status"
                            font.family: Theme.fontName
                            font.pixelSize: 11
                            color: Theme.faint
                        }
                        Row {
                            spacing: 8
                            Rectangle {
                                width: 9; height: 9; radius: 4.5
                                color: (App?.accountStatus ?? "") === "Active" ? Theme.green : Theme.amber
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Text {
                                text: (App?.accountStatus ?? "")
                                font.family: Theme.fontName
                                font.pixelSize: 14
                                font.weight: Font.DemiBold
                                color: "#15803d"
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }

                    Item { Layout.fillWidth: true }

                    AppButton {
                        kind: "secondary"
                        text: "Open Account Settings"
                        iconText: "\u{1F511}"
                        onClicked: App?.navigate("account")
                    }
                }
            }
        }
    }
}
