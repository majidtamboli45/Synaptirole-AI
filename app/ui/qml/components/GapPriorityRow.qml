import QtQuick
import QtQuick.Layouts
import "."

Rectangle {
    id: root
    property string skill: ""
    property string type: "required"      // required | preferred
    property string status: "gap"         // matched | partial | gap
    property string priority: ""          // HIGH | MEDIUM | LOW | ""
    property real similarity: 0
    property real barPct: root.similarity * 100

    height: 56
    radius: 12
    color: "#fbfbfe"
    border.color: Theme.border

    RowLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 12

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 6

            RowLayout {
                Layout.fillWidth: true
                spacing: 8

                Text {
                    text: root.skill
                    font.family: Theme.fontName
                    font.pixelSize: 13
                    font.weight: Font.Medium
                    color: Theme.text
                    Layout.fillWidth: true
                    Layout.minimumWidth: 48
                    elide: Text.ElideRight
                }

                Rectangle {
                    visible: root.type === "required"
                    width: reqLbl.implicitWidth + 14
                    height: 20
                    radius: 4
                    color: "#ede9fe"
                    Text {
                        id: reqLbl
                        anchors.centerIn: parent
                        text: "Required"
                        font.family: Theme.fontName
                        font.pixelSize: 10
                        font.weight: Font.DemiBold
                        color: "#6d28d9"
                    }
                }

                Rectangle {
                    visible: root.type === "preferred"
                    width: prefLbl.implicitWidth + 14
                    height: 20
                    radius: 4
                    color: Theme.blueSoft
                    Text {
                        id: prefLbl
                        anchors.centerIn: parent
                        text: "Preferred"
                        font.family: Theme.fontName
                        font.pixelSize: 10
                        font.weight: Font.DemiBold
                        color: "#1d4ed8"
                    }
                }

                Text {
                    text: root.status.toUpperCase()
                    font.family: Theme.fontName
                    font.pixelSize: 11
                    font.weight: Font.DemiBold
                    color: root.status === "matched" ? "#16a34a"
                            : root.status === "partial" ? "#d97706"
                            : "#dc2626"
                }

                PriorityBadge {
                    priority: root.priority
                }
            }

            Rectangle {
                Layout.fillWidth: true
                height: 6
                radius: 3
                color: "#edeef5"

                Rectangle {
                    width: parent.width * Math.max(0, Math.min(root.barPct, 100)) / 100
                    height: parent.height
                    radius: 3
                    color: root.status === "matched" ? "#16a34a"
                            : root.status === "partial" ? "#d97706"
                            : "#dc2626"
                    Behavior on width { NumberAnimation { duration: 500; easing.type: Easing.OutCubic } }
                }
            }
        }

        Text {
            text: Math.round(root.similarity * 100) + "%"
            font.family: Theme.fontName
            font.pixelSize: 12
            font.weight: Font.Bold
            color: Theme.muted
        }
    }
}