import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root

    color: "#FFFFFF"

    signal endInterview()
    signal nextQuestion()
    signal previousQuestion()

    property int currentQuestion: 3
    property int totalQuestions: 10

    property string currentQuestionText:
        "Can you explain the difference between classification and regression in machine learning? Provide an example of each."

    property int elapsedSeconds: 754

    property bool microphoneEnabled: true
    property bool cameraEnabled: true
    property bool recording: true

    readonly property color primaryColor: "#5B21F5"
    readonly property color primaryLight: "#F1EAFF"
    readonly property color primaryBorder: "#E3D7FF"

    readonly property color darkText: "#11163A"
    readonly property color secondaryText: "#5F678A"
    readonly property color mutedText: "#8A91AC"

    readonly property color borderColor: "#E4E7F0"
    readonly property color cardColor: "#FFFFFF"
    readonly property color pageColor: "#FFFFFF"

    readonly property color successColor: "#22B573"
    readonly property color successLight: "#E9F8F0"

    readonly property color blueColor: "#2563EB"
    readonly property color blueLight: "#F1F6FF"

    readonly property int contentMargin: 28
    readonly property int columnGap: 28

    Timer {
        interval: 1000
        running: root.recording
        repeat: true

        onTriggered: {
            root.elapsedSeconds++
        }
    }

    function formatTime(seconds) {
        var minutes = Math.floor(seconds / 60)
        var secs = seconds % 60

        return (minutes < 10 ? "0" : "") + minutes +
               ":" +
               (secs < 10 ? "0" : "") + secs
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 92

            color: "#FFFFFF"

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 28
                anchors.rightMargin: 28
                spacing: 14

                Rectangle {
                    Layout.preferredWidth: 48
                    Layout.preferredHeight: 48

                    radius: 12
                    color: root.primaryLight

                    Text {
                        anchors.centerIn: parent
                        text: "▣"

                        color: root.primaryColor
                        font.pixelSize: 23
                        font.bold: true
                    }
                }

                ColumnLayout {
                    spacing: 2

                    Text {
                        text: "Video Interview"

                        color: root.darkText
                        font.pixelSize: 22
                        font.bold: true
                    }

                    Text {
                        text: "AI/ML Engineer Mock Interview"

                        color: root.secondaryText
                        font.pixelSize: 12
                    }
                }

                Item {
                    Layout.fillWidth: true
                }

                Button {
                    Layout.preferredWidth: 148
                    Layout.preferredHeight: 42

                    text: "☎  End Interview"

                    background: Rectangle {
                        radius: 7
                        color: "#FFFFFF"

                        border.color: "#FF8585"
                        border.width: 1
                    }

                    contentItem: Text {
                        text: parent.text

                        color: "#EF4444"
                        font.pixelSize: 11
                        font.bold: true

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    onClicked: root.endInterview()
                }

                Rectangle {
                    Layout.preferredWidth: 118
                    Layout.preferredHeight: 40

                    radius: 20

                    color: "#F5F8FF"
                    border.color: "#D8E3FF"
                    border.width: 1

                    Row {
                        anchors.centerIn: parent
                        spacing: 8

                        Text {
                            text: "◷"

                            color: root.blueColor
                            font.pixelSize: 17
                        }

                        Text {
                            text: root.formatTime(root.elapsedSeconds)

                            color: root.blueColor
                            font.pixelSize: 12
                            font.bold: true
                        }
                    }
                }

                Rectangle {
                    Layout.preferredWidth: 112
                    Layout.preferredHeight: 40

                    radius: 20

                    color: "#FFFFFF"
                    border.color: "#DDE1EB"
                    border.width: 1

                    Row {
                        anchors.centerIn: parent
                        spacing: 8

                        Rectangle {
                            width: 9
                            height: 9
                            radius: 5

                            color: root.successColor
                        }

                        Text {
                            text: "Recording"

                            color: root.secondaryText
                            font.pixelSize: 11
                        }
                    }
                }
            }

            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom

                height: 1
                color: "#E9EBF1"
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Layout.leftMargin: root.contentMargin
            Layout.rightMargin: root.contentMargin
            Layout.topMargin: 24
            Layout.bottomMargin: 20

            spacing: root.columnGap

            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true

                spacing: 18

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 228

                    radius: 10

                    color: "#FCFAFF"
                    border.color: root.primaryBorder
                    border.width: 1

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 24

                        spacing: 15

                        RowLayout {
                            Layout.fillWidth: true

                            Text {
                                text: "✧  AI Interviewer"

                                color: root.primaryColor
                                font.pixelSize: 14
                                font.bold: true
                            }

                            Item {
                                Layout.fillWidth: true
                            }

                            Rectangle {
                                Layout.preferredWidth: 114
                                Layout.preferredHeight: 30

                                radius: 15

                                color: root.primaryLight

                                Text {
                                    anchors.centerIn: parent

                                    text: "Question " +
                                          root.currentQuestion +
                                          " of " +
                                          root.totalQuestions

                                    color: root.primaryColor

                                    font.pixelSize: 10
                                    font.bold: true
                                }
                            }
                        }

                        Text {
                            Layout.fillWidth: true

                            text: root.currentQuestionText

                            color: root.darkText

                            font.pixelSize: 17
                            font.bold: false

                            lineHeight: 1.45
                            wrapMode: Text.WordWrap
                        }

                        Item {
                            Layout.fillHeight: true
                        }

                        Row {
                            spacing: 5

                            Repeater {
                                model: 3

                                delegate: Rectangle {
                                    width: 6
                                    height: 6
                                    radius: 3

                                    color: root.primaryColor
                                }
                            }

                            Text {
                                text: "  AI is asking..."

                                color: root.secondaryText
                                font.pixelSize: 11
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    radius: 10

                    color: "#FFFFFF"
                    border.color: root.borderColor
                    border.width: 1

                    ColumnLayout {
                        anchors.fill: parent

                        anchors.leftMargin: 14
                        anchors.rightMargin: 14
                        anchors.topMargin: 14
                        anchors.bottomMargin: 14

                        spacing: 10

                        RowLayout {
                            Layout.fillWidth: true

                            Text {
                                text: "▣"

                                color: root.primaryColor
                                font.pixelSize: 14
                            }

                            Text {
                                text: "Your Video"

                                color: root.darkText
                                font.pixelSize: 12
                                font.bold: true
                            }

                            Item {
                                Layout.fillWidth: true
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            radius: 9

                            color: "#D4D1D1"

                            clip: true

                            Rectangle {
                                anchors.fill: parent

                                color: "#C9C5C5"

                                Rectangle {
                                    width: parent.width * 0.30
                                    height: parent.height * 0.55

                                    anchors.left: parent.left
                                    anchors.bottom: parent.bottom

                                    color: "#B8B4B4"
                                }

                                Rectangle {
                                    width: parent.width * 0.18
                                    height: parent.height * 0.65

                                    anchors.right: parent.right
                                    anchors.bottom: parent.bottom

                                    color: "#BDB9B9"
                                }

                                Column {
                                    anchors.centerIn: parent

                                    spacing: 5

                                    Rectangle {
                                        width: Math.min(
                                                   parent.parent.width * 0.16,
                                                   120
                                                   )

                                        height: width

                                        radius: width / 2

                                        anchors.horizontalCenter:
                                            parent.horizontalCenter

                                        color: "#D9946E"

                                        Text {
                                            anchors.centerIn: parent

                                            text: "A"

                                            color: "#FFFFFF"

                                            font.pixelSize: 44
                                            font.bold: true
                                        }
                                    }

                                    Rectangle {
                                        width: Math.min(
                                                   parent.parent.width * 0.30,
                                                   230
                                                   )

                                        height: Math.min(
                                                    parent.parent.height * 0.32,
                                                    180
                                                    )

                                        radius: 70

                                        color: "#17243A"
                                    }
                                }
                            }

                            Rectangle {
                                anchors.left: parent.left
                                anchors.top: parent.top

                                anchors.leftMargin: 12
                                anchors.topMargin: 12

                                width: 51
                                height: 23

                                radius: 12

                                color: root.successColor

                                Text {
                                    anchors.centerIn: parent

                                    text: "+ LIVE"

                                    color: "white"

                                    font.pixelSize: 9
                                    font.bold: true
                                }
                            }

                            Rectangle {
                                anchors.right: parent.right
                                anchors.top: parent.top

                                anchors.rightMargin: 12
                                anchors.topMargin: 12

                                width: 39
                                height: 39

                                radius: 7

                                color: "#FFFFFF"

                                Text {
                                    anchors.centerIn: parent

                                    text: "⛶"

                                    color: root.darkText
                                    font.pixelSize: 20
                                }
                            }

                            Rectangle {
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom

                                height: 64

                                color: "#D9000000"

                                RowLayout {
                                    anchors.fill: parent

                                    anchors.leftMargin: 16
                                    anchors.rightMargin: 16

                                    spacing: 20

                                    Column {
                                        spacing: 1

                                        Text {
                                            text: root.microphoneEnabled
                                                  ? "♩"
                                                  : "♩"

                                            color: root.microphoneEnabled
                                                   ? "#20D979"
                                                   : "#EF4444"

                                            font.pixelSize: 21
                                        }

                                        Text {
                                            text: "Mic"

                                            color: "white"
                                            font.pixelSize: 9
                                        }

                                        MouseArea {
                                            anchors.fill: parent

                                            onClicked: {
                                                root.microphoneEnabled =
                                                        !root.microphoneEnabled
                                            }
                                        }
                                    }

                                    Column {
                                        spacing: 1

                                        Text {
                                            text: "▣"

                                            color: root.cameraEnabled
                                                   ? "#20D979"
                                                   : "#EF4444"

                                            font.pixelSize: 21
                                        }

                                        Text {
                                            text: "Camera"

                                            color: "white"
                                            font.pixelSize: 9
                                        }

                                        MouseArea {
                                            anchors.fill: parent

                                            onClicked: {
                                                root.cameraEnabled =
                                                        !root.cameraEnabled
                                            }
                                        }
                                    }

                                    Item {
                                        Layout.fillWidth: true
                                    }

                                    Row {
                                        spacing: 8

                                        Rectangle {
                                            width: 9
                                            height: 9
                                            radius: 5

                                            color: "#FF3B30"
                                        }

                                        Text {
                                            text: "Recording..."

                                            color: "white"

                                            font.pixelSize: 11
                                        }

                                        Text {
                                            text: root.formatTime(
                                                      root.elapsedSeconds
                                                      )

                                            color: "white"

                                            font.pixelSize: 11
                                            font.bold: true
                                        }
                                    }

                                    Item {
                                        width: 25
                                    }

                                    Text {
                                        text: "⚙"

                                        color: "white"

                                        font.pixelSize: 21
                                    }
                                }
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 38

                            radius: 6

                            color: root.blueLight
                            border.color: "#DCE8FF"

                            Text {
                                anchors.left: parent.left
                                anchors.leftMargin: 12

                                anchors.verticalCenter: parent.verticalCenter

                                text:
                                    "ⓘ  Tip: Look at the camera while speaking. Ensure you are in a quiet place with good lighting."

                                color: root.blueColor

                                font.pixelSize: 9

                                elide: Text.ElideRight
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 52

                    radius: 7

                    color: root.blueLight
                    border.color: "#D7E5FF"

                    RowLayout {
                        anchors.fill: parent

                        anchors.leftMargin: 15
                        anchors.rightMargin: 15

                        spacing: 10

                        Text {
                            text: "✓"

                            color: root.blueColor

                            font.pixelSize: 17
                            font.bold: true
                        }

                        Text {
                            Layout.fillWidth: true

                            text:
                                "Your interview is secure and private. Please do not refresh or close the window during the interview."

                            color: root.blueColor

                            font.pixelSize: 9

                            wrapMode: Text.WordWrap
                        }
                    }
                }
            }

            ColumnLayout {
                Layout.preferredWidth: 365
                Layout.minimumWidth: 320
                Layout.maximumWidth: 390

                Layout.fillHeight: true

                spacing: 18

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 230

                    radius: 10

                    color: root.cardColor
                    border.color: root.borderColor
                    border.width: 1

                    ColumnLayout {
                        anchors.fill: parent

                        anchors.margins: 20

                        spacing: 15

                        RowLayout {
                            Layout.fillWidth: true

                            Text {
                                text: "Interview Progress"

                                color: root.darkText

                                font.pixelSize: 14
                                font.bold: true
                            }

                            Item {
                                Layout.fillWidth: true
                            }

                            Text {
                                text: Math.round(
                                          root.currentQuestion /
                                          root.totalQuestions *
                                          100
                                          ) + "%"

                                color: root.darkText

                                font.pixelSize: 13
                                font.bold: true
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true

                            Layout.preferredHeight: 8

                            radius: 4

                            color: "#E7E9F1"

                            Rectangle {
                                width: parent.width *
                                       root.currentQuestion /
                                       root.totalQuestions

                                height: parent.height

                                radius: 4

                                color: root.primaryColor
                            }
                        }

                        Text {
                            text:
                                root.currentQuestion +
                                " of " +
                                root.totalQuestions +
                                " Questions Completed"

                            color: root.secondaryText

                            font.pixelSize: 10
                        }

                        InfoRow {
                            icon: "◷"
                            label: "Duration"
                            value: "40 - 45 Minutes"
                        }

                        InfoRow {
                            icon: "◇"
                            label: "Question Type"
                            value: "AI Generated"
                        }

                        InfoRow {
                            icon: "⚙"
                            label: "Difficulty"
                            value: "Medium"
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 235

                    radius: 10

                    color: root.cardColor
                    border.color: root.borderColor
                    border.width: 1

                    ColumnLayout {
                        anchors.fill: parent

                        anchors.margins: 20

                        spacing: 14

                        Text {
                            text: "Interview Tips"

                            color: root.darkText

                            font.pixelSize: 14
                            font.bold: true
                        }

                        TipRow {
                            icon: "♩"

                            title:
                                "Speak clearly and confidently."

                            description:
                                "Take your time and articulate your thoughts."
                        }

                        TipRow {
                            icon: "⌁"

                            title:
                                "Provide structured answers."

                            description:
                                "Use examples to support your points."
                        }

                        TipRow {
                            icon: "▤"

                            title:
                                "Be honest and authentic."

                            description:
                                "It's okay to take a moment to think."
                        }

                        Item {
                            Layout.fillHeight: true
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 170

                    radius: 10

                    color: root.cardColor
                    border.color: root.borderColor
                    border.width: 1

                    ColumnLayout {
                        anchors.fill: parent

                        anchors.margins: 20

                        spacing: 7

                        Text {
                            text: "Audio & Video Status"

                            color: root.darkText

                            font.pixelSize: 14
                            font.bold: true
                        }

                        Rectangle {
                            Layout.fillWidth: true

                            height: 1

                            color: "#E8E9EF"
                        }

                        StatusRow {
                            icon: "♩"
                            label: "Microphone"
                            good: root.microphoneEnabled
                        }

                        StatusRow {
                            icon: "▣"
                            label: "Camera"
                            good: root.cameraEnabled
                        }

                        StatusRow {
                            icon: "⌁"
                            label: "Internet"
                            good: true
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Layout.minimumHeight: 155

                    radius: 10

                    color: root.cardColor
                    border.color: root.borderColor
                    border.width: 1

                    ColumnLayout {
                        anchors.fill: parent

                        anchors.margins: 20

                        spacing: 14

                        Text {
                            text: "Question Navigation"

                            color: root.darkText

                            font.pixelSize: 14
                            font.bold: true
                        }

                        Flow {
                            Layout.fillWidth: true

                            spacing: 6

                            Repeater {
                                model: root.totalQuestions

                                delegate: Rectangle {
                                    width: 28
                                    height: 28

                                    radius: 14

                                    property int number: index + 1

                                    color:
                                        number < root.currentQuestion
                                        ? root.successColor
                                        : number === root.currentQuestion
                                          ? root.primaryColor
                                          : "#FFFFFF"

                                    border.color:
                                        number > root.currentQuestion
                                        ? "#D5D8E2"
                                        : "transparent"

                                    Text {
                                        anchors.centerIn: parent

                                        text: parent.number

                                        color:
                                            parent.number <=
                                            root.currentQuestion
                                            ? "white"
                                            : root.secondaryText

                                        font.pixelSize: 10
                                        font.bold: true
                                    }

                                    MouseArea {
                                        anchors.fill: parent

                                        onClicked: {
                                            if (number !==
                                                root.currentQuestion) {
                                                root.currentQuestion =
                                                        number
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Item {
                            Layout.fillHeight: true
                        }

                        RowLayout {
                            Layout.fillWidth: true

                            spacing: 12

                            Button {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 42

                                text: "←  Previous"

                                enabled:
                                    root.currentQuestion > 1

                                background: Rectangle {
                                    radius: 7

                                    color:
                                        parent.enabled
                                        ? "#FFFFFF"
                                        : "#F5F5F8"

                                    border.color:
                                        parent.enabled
                                        ? "#D9CFFF"
                                        : "#E7E7EC"
                                }

                                contentItem: Text {
                                    text: parent.text

                                    color:
                                        parent.enabled
                                        ? root.primaryColor
                                        : "#A5A8B7"

                                    font.pixelSize: 10
                                    font.bold: true

                                    horizontalAlignment:
                                        Text.AlignHCenter

                                    verticalAlignment:
                                        Text.AlignVCenter
                                }

                                onClicked:
                                    root.previousQuestion()
                            }

                            Button {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 42

                                text:
                                    root.currentQuestion ===
                                    root.totalQuestions
                                    ? "Finish  ✓"
                                    : "Next  →"

                                background: Rectangle {
                                    radius: 7

                                    color: root.primaryColor
                                }

                                contentItem: Text {
                                    text: parent.text

                                    color: "white"

                                    font.pixelSize: 10
                                    font.bold: true

                                    horizontalAlignment:
                                        Text.AlignHCenter

                                    verticalAlignment:
                                        Text.AlignVCenter
                                }

                                onClicked:
                                    root.nextQuestion()
                            }
                        }
                    }
                }
            }
        }
    }

    component InfoRow: RowLayout {
        property string icon: ""
        property string label: ""
        property string value: ""

        Layout.fillWidth: true

        spacing: 10

        Text {
            text: parent.icon

            color: "#34416B"

            font.pixelSize: 15

            Layout.preferredWidth: 20
        }

        Text {
            text: parent.label

            color: root.secondaryText

            font.pixelSize: 10

            Layout.fillWidth: true
        }

        Text {
            text: parent.value

            color: root.secondaryText

            font.pixelSize: 10
        }
    }

    component TipRow: RowLayout {
        property string icon: ""
        property string title: ""
        property string description: ""

        Layout.fillWidth: true

        spacing: 10

        Rectangle {
            Layout.preferredWidth: 34
            Layout.preferredHeight: 34

            radius: 8

            color: root.primaryLight

            Text {
                anchors.centerIn: parent

                text: parent.parent.icon

                color: root.primaryColor

                font.pixelSize: 16
            }
        }

        ColumnLayout {
            Layout.fillWidth: true

            spacing: 2

            Text {
                text: parent.parent.title

                color: root.darkText

                font.pixelSize: 10
                font.bold: true

                wrapMode: Text.WordWrap

                Layout.fillWidth: true
            }

            Text {
                text: parent.parent.description

                color: root.secondaryText

                font.pixelSize: 9

                wrapMode: Text.WordWrap

                Layout.fillWidth: true
            }
        }
    }

    component StatusRow: RowLayout {
        property string icon: ""
        property string label: ""
        property bool good: true

        Layout.fillWidth: true
        Layout.preferredHeight: 27

        Text {
            text: parent.icon

            color:
                parent.good
                ? "#16A34A"
                : "#EF4444"

            font.pixelSize: 15

            Layout.preferredWidth: 25
        }

        Text {
            text: parent.label

            color: root.secondaryText

            font.pixelSize: 10

            Layout.fillWidth: true
        }

        Rectangle {
            Layout.preferredWidth: 43
            Layout.preferredHeight: 21

            radius: 5

            color:
                parent.good
                ? "#E7F8ED"
                : "#FDECEC"

            Text {
                anchors.centerIn: parent

                text:
                    parent.parent.good
                    ? "Good"
                    : "Off"

                color:
                    parent.parent.good
                    ? "#159447"
                    : "#EF4444"

                font.pixelSize: 9
            }
        }
    }
}
