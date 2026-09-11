import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import "components"

Item {
    id: root

    property bool resumeDragging: false
    property bool jdDragging: false

    function openPreview(title, text) {
        previewTitle.text = title
        previewTextArea.text = text
        previewPopup.open()
    }

    Connections {
        target: App
        function onResumeParsed() { statusBanner.updateStatus() }
        function onJdParsed() { statusBanner.updateStatus() }
        function onResumeUploaded() { statusBanner.updateStatus() }
        function onJdUploaded() { statusBanner.updateStatus() }
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
                id: statusBanner
                Layout.fillWidth: true
                height: 54
                radius: 12
                color: _isReady() ? Theme.greenSoft : "#fffbeb"
                border.color: _isReady() ? "#bbf7d0" : "#fde68a"

                function _isReady() {
                    return App?.documentsReady ?? false
                }

                function updateStatus() {
                    color = _isReady() ? Theme.greenSoft : "#fffbeb"
                    border.color = _isReady() ? "#bbf7d0" : "#fde68a"
                    statusIcon.text = _isReady() ? "\u2713" : "\u23F3"
                    statusIconBg.color = _isReady() ? Theme.green : "#f59e0b"
                    statusTitle.text = _isReady()
                        ? "Documents uploaded & parsed successfully"
                        : "Upload your Resume and Job Description"
                    statusSubtitle.text = _isReady()
                        ? "Resume is ready \u2022 Job Description is ready \u2022 You can proceed to Mock Interviews"
                        : "Upload both documents to enable personalized mock interviews"
                }

                Row {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 18
                    spacing: 10

                    Rectangle {
                        id: statusIconBg
                        width: 26; height: 26; radius: 13
                        color: "#f59e0b"
                        anchors.verticalCenter: parent.verticalCenter
                        Text {
                            id: statusIcon
                            anchors.centerIn: parent
                            text: "\u23F3"
                            color: "#ffffff"
                            font.pixelSize: 13
                            font.weight: Font.Bold
                        }
                    }

                    Column {
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 0
                        Text {
                            id: statusTitle
                            text: "Upload your Resume and Job Description"
                            font.family: Theme.fontName
                            font.pixelSize: 13
                            font.weight: Font.DemiBold
                            color: statusBanner._isReady() ? "#166534" : "#92400e"
                        }
                        Text {
                            id: statusSubtitle
                            text: "Upload both documents to enable personalized mock interviews"
                            font.family: Theme.fontName
                            font.pixelSize: 11
                            color: statusBanner._isReady() ? "#15803d" : "#a16207"
                        }
                    }
                }

                Component.onCompleted: updateStatus()
            }

            Row {
                spacing: 8

                Repeater {
                    model: [
                        { n: 1, label: "Upload Documents" },
                        { n: 2, label: "Documents Parsed" },
                        { n: 3, label: "Ready for Mock Interviews" }
                    ]
                    delegate: Row {
                        id: stepItem
                        spacing: 8

                        required property int index
                        required property var modelData

                        property int stepNum: modelData.n
                        property string stepLabel: modelData.label
                        property bool stepDone: index === 0
                            ? ((App?.hasResume ?? false) && (App?.hasJd ?? false))
                            : index === 1
                                ? ((App?.resumeStatus === "parsed") && (App?.jdStatus === "parsed"))
                                : (App?.documentsReady ?? false)

                        Rectangle {
                            width: stepRow.implicitWidth + 28
                            height: 38
                            radius: 19
                            color: stepItem.stepDone ? Theme.primarySoft : "#f1f5f9"
                            border.color: stepItem.stepDone ? "#ddd2f7" : Theme.border

                            Row {
                                id: stepRow
                                anchors.centerIn: parent
                                spacing: 8

                                Rectangle {
                                    width: 22; height: 22; radius: 11
                                    color: stepItem.stepDone ? Theme.primary : Theme.faint
                                    anchors.verticalCenter: parent.verticalCenter
                                    Text {
                                        anchors.centerIn: parent
                                        text: stepItem.stepDone ? "\u2713" : String(stepItem.stepNum)
                                        color: "#ffffff"
                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        font.weight: Font.Bold
                                    }
                                }

                                Text {
                                    text: stepItem.stepLabel
                                    font.family: Theme.fontName
                                    font.pixelSize: 12
                                    font.weight: Font.Medium
                                    color: stepItem.stepDone ? Theme.primaryDark : Theme.muted
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                        }

                        Text {
                            visible: stepItem.stepNum < 3
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
                    Layout.preferredHeight: 360

                    DropArea {
                        anchors.fill: parent
                        keys: ["text/uri-list"]
                        onEntered: { root.resumeDragging = true }
                        onExited: { root.resumeDragging = false }
                        onDropped: function(drop) {
                            root.resumeDragging = false
                            if (drop.hasUrls) {
                                var url = drop.urls[0]
                                var name = url.toString().split("/").pop()
                                App?.uploadResume(url.toString(), name)
                            }
                        }
                    }

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: 1
                        radius: 12
                        color: "transparent"
                        border.color: root.resumeDragging ? Theme.primary : "#e2e8f0"
                        border.width: 2
                        z: 10
                        enabled: root.resumeDragging
                        visible: root.resumeDragging
                    }

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
                                        text: {
                                            var name = App?.resumeFileName ?? ""
                                            if (name.endsWith(".pdf")) return "PDF"
                                            if (name.endsWith(".docx") || name.endsWith(".doc")) return "DOC"
                                            return "TXT"
                                        }
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
                                        text: {
                                            var name = App?.resumeFileName ?? ""
                                            if (name) return name
                                            return "No file uploaded yet"
                                        }
                                        font.family: Theme.fontName
                                        font.pixelSize: 12
                                        color: Theme.muted
                                    }
                                    Text {
                                        visible: App?.resumeFileSize !== ""
                                        text: App?.resumeFileSize
                                        font.family: Theme.fontName
                                        font.pixelSize: 10
                                        color: Theme.faint
                                    }
                                }
                            }

                            Item { Layout.fillWidth: true }

                            Rectangle {
                                visible: App?.resumeStatus === "parsed"
                                radius: 12
                                height: 24
                                width: parsedResumeLabel.implicitWidth + 20
                                color: Theme.greenSoft
                                Layout.alignment: Qt.AlignVCenter
                                Text {
                                    id: parsedResumeLabel
                                    anchors.centerIn: parent
                                    text: "\u2713 Parsed"
                                    font.family: Theme.fontName
                                    font.pixelSize: 11
                                    font.weight: Font.DemiBold
                                    color: "#15803d"
                                }
                            }

                            Rectangle {
                                visible: App?.resumeStatus === "error"
                                radius: 12
                                height: 24
                                width: errorResumeLabel.implicitWidth + 20
                                color: "#fef2f2"
                                Layout.alignment: Qt.AlignVCenter
                                Text {
                                    id: errorResumeLabel
                                    anchors.centerIn: parent
                                    text: "\u2717 Error"
                                    font.family: Theme.fontName
                                    font.pixelSize: 11
                                    font.weight: Font.DemiBold
                                    color: "#dc2626"
                                }
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 1
                            color: Theme.border
                        }

                        ColumnLayout {
                            visible: App?.resumeStatus === "uploaded" || App?.resumeStatus === "parsed"
                            spacing: 0

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
                                Layout.topMargin: 8

                                Column {
                                    spacing: 2
                                    Text {
                                        text: "Name"
                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        color: Theme.faint
                                    }
                                    Text {
                                        text: App?.resumeName || "N/A"
                                        font.family: Theme.fontName
                                        font.pixelSize: 13
                                        font.weight: Font.Medium
                                        color: Theme.text
                                    }
                                }

                                Column {
                                    spacing: 2
                                    Text {
                                        text: "Experience"
                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        color: Theme.faint
                                    }
                                    Text {
                                        text: App?.resumeExperience || "N/A"
                                        font.family: Theme.fontName
                                        font.pixelSize: 13
                                        font.weight: Font.Medium
                                        color: Theme.text
                                    }
                                }

                                Column {
                                    Layout.columnSpan: 2
                                    spacing: 2
                                    Text {
                                        text: "Current Role"
                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        color: Theme.faint
                                    }
                                    Text {
                                        text: App?.resumeRole || "N/A"
                                        font.family: Theme.fontName
                                        font.pixelSize: 13
                                        font.weight: Font.Medium
                                        color: Theme.text
                                    }
                                }

                                Column {
                                    Layout.columnSpan: 2
                                    spacing: 2
                                    Text {
                                        text: "Detected Skills"
                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        color: Theme.faint
                                    }
                                    Flow {
                                        spacing: 4
                                        Repeater {
                                            model: (App?.resumeSkills ?? "").split(", ").filter(s => s.length > 0)
                                            delegate: Rectangle {
                                                width: chipLabel.implicitWidth + 14
                                                height: 22
                                                radius: 11
                                                color: Theme.primarySoft
                                                Text {
                                                    id: chipLabel
                                                    anchors.centerIn: parent
                                                    text: modelData
                                                    font.family: Theme.fontName
                                                    font.pixelSize: 10
                                                    font.weight: Font.Medium
                                                    color: Theme.primaryDark
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        ColumnLayout {
                            visible: !(App?.resumeFileName) || App?.resumeStatus === "none"
                            spacing: 12
                            Layout.topMargin: 20

                            Text {
                                text: "\u2B07"
                                font.pixelSize: 28
                                horizontalAlignment: Text.AlignHCenter
                                Layout.fillWidth: true
                                color: Theme.muted
                            }
                            Text {
                                text: "Drag & drop your resume here"
                                font.family: Theme.fontName
                                font.pixelSize: 14
                                font.weight: Font.DemiBold
                                color: Theme.text
                                horizontalAlignment: Text.AlignHCenter
                                Layout.fillWidth: true
                            }
                            Text {
                                text: "or click the button below to browse files"
                                font.family: Theme.fontName
                                font.pixelSize: 12
                                color: Theme.muted
                                horizontalAlignment: Text.AlignHCenter
                                Layout.fillWidth: true
                            }
                            Text {
                                text: "Supports PDF, DOCX, DOC, TXT \u2022 Max 10 MB"
                                font.family: Theme.fontName
                                font.pixelSize: 11
                                color: Theme.faint
                                horizontalAlignment: Text.AlignHCenter
                                Layout.fillWidth: true
                            }
                        }

                        Item { Layout.fillHeight: true }

                        Row {
                            spacing: 10

                            AppButton {
                                text: App?.resumeFileName ? "Preview Resume" : "Upload Resume"
                                iconText: App?.resumeFileName ? "\u{1F441}" : "\u2B07"
                                onClicked: {
                                    if (App?.resumeFileName) {
                                        root.openPreview("Resume - " + (App?.resumeFileName ?? ""), App?.resumeRawText ?? "")
                                    } else {
                                        resumeFileDialog.open()
                                    }
                                }
                            }
                            AppButton {
                                visible: App?.resumeFileName !== ""
                                kind: "secondary"
                                text: "Re-upload"
                                iconText: "\u{1F504}"
                                onClicked: resumeFileDialog.open()
                            }
                            AppButton {
                                visible: App?.resumeFileName !== ""
                                kind: "danger"
                                text: "Remove"
                                iconText: "\u2715"
                                onClicked: App?.clearResume()
                            }
                        }
                    }
                }

                Card {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 360

                    DropArea {
                        anchors.fill: parent
                        keys: ["text/uri-list"]
                        onEntered: { root.jdDragging = true }
                        onExited: { root.jdDragging = false }
                        onDropped: function(drop) {
                            root.jdDragging = false
                            if (drop.hasUrls) {
                                var url = drop.urls[0]
                                var name = url.toString().split("/").pop()
                                App?.uploadJd(url.toString(), name)
                            }
                        }
                    }

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: 1
                        radius: 12
                        color: "transparent"
                        border.color: root.jdDragging ? Theme.primary : "#e2e8f0"
                        border.width: 2
                        z: 10
                        enabled: root.jdDragging
                        visible: root.jdDragging
                    }

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
                                        text: {
                                            var name = App?.jdFileName ?? ""
                                            if (name.endsWith(".pdf")) return "PDF"
                                            if (name.endsWith(".docx") || name.endsWith(".doc")) return "DOC"
                                            return "TXT"
                                        }
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
                                        text: {
                                            var name = App?.jdFileName ?? ""
                                            if (name) return name
                                            return "No file uploaded yet"
                                        }
                                        font.family: Theme.fontName
                                        font.pixelSize: 12
                                        color: Theme.muted
                                    }
                                    Text {
                                        visible: App?.jdFileSize !== ""
                                        text: App?.jdFileSize
                                        font.family: Theme.fontName
                                        font.pixelSize: 10
                                        color: Theme.faint
                                    }
                                }
                            }

                            Item { Layout.fillWidth: true }

                            Rectangle {
                                visible: App?.jdStatus === "parsed"
                                radius: 12
                                height: 24
                                width: parsedJdLabel.implicitWidth + 20
                                color: Theme.greenSoft
                                Layout.alignment: Qt.AlignVCenter
                                Text {
                                    id: parsedJdLabel
                                    anchors.centerIn: parent
                                    text: "\u2713 Parsed"
                                    font.family: Theme.fontName
                                    font.pixelSize: 11
                                    font.weight: Font.DemiBold
                                    color: "#15803d"
                                }
                            }

                            Rectangle {
                                visible: App?.jdStatus === "error"
                                radius: 12
                                height: 24
                                width: errorJdLabel.implicitWidth + 20
                                color: "#fef2f2"
                                Layout.alignment: Qt.AlignVCenter
                                Text {
                                    id: errorJdLabel
                                    anchors.centerIn: parent
                                    text: "\u2717 Error"
                                    font.family: Theme.fontName
                                    font.pixelSize: 11
                                    font.weight: Font.DemiBold
                                    color: "#dc2626"
                                }
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 1
                            color: Theme.border
                        }

                        ColumnLayout {
                            visible: App?.jdStatus === "uploaded" || App?.jdStatus === "parsed"
                            spacing: 0

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
                                Layout.topMargin: 8

                                Column {
                                    spacing: 2
                                    Text {
                                        text: "Job Title"
                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        color: Theme.faint
                                    }
                                    Text {
                                        text: App?.jdTitle || "N/A"
                                        font.family: Theme.fontName
                                        font.pixelSize: 13
                                        font.weight: Font.Medium
                                        color: Theme.text
                                    }
                                }

                                Column {
                                    spacing: 2
                                    Text {
                                        text: "Company"
                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        color: Theme.faint
                                    }
                                    Text {
                                        text: App?.jdCompany || "N/A"
                                        font.family: Theme.fontName
                                        font.pixelSize: 13
                                        font.weight: Font.Medium
                                        color: Theme.text
                                    }
                                }

                                Column {
                                    spacing: 2
                                    Text {
                                        text: "Experience Required"
                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        color: Theme.faint
                                    }
                                    Text {
                                        text: App?.jdExperienceRequired || "N/A"
                                        font.family: Theme.fontName
                                        font.pixelSize: 13
                                        font.weight: Font.Medium
                                        color: Theme.text
                                    }
                                }

                                Column {
                                    spacing: 2
                                    Text {
                                        text: "Employment Type"
                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        color: Theme.faint
                                    }
                                    Text {
                                        text: App?.jdEmploymentType || "N/A"
                                        font.family: Theme.fontName
                                        font.pixelSize: 13
                                        font.weight: Font.Medium
                                        color: Theme.text
                                    }
                                }

                                Column {
                                    Layout.columnSpan: 2
                                    spacing: 2
                                    Text {
                                        text: "Key Skills"
                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        color: Theme.faint
                                    }
                                    Flow {
                                        spacing: 4
                                        Repeater {
                                            model: (App?.jdSkills ?? "").split(", ").filter(s => s.length > 0)
                                            delegate: Rectangle {
                                                width: chipLabel2.implicitWidth + 14
                                                height: 22
                                                radius: 11
                                                color: Theme.blueSoft
                                                Text {
                                                    id: chipLabel2
                                                    anchors.centerIn: parent
                                                    text: modelData
                                                    font.family: Theme.fontName
                                                    font.pixelSize: 10
                                                    font.weight: Font.Medium
                                                    color: "#1d4ed8"
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        ColumnLayout {
                            visible: !(App?.jdFileName) || App?.jdStatus === "none"
                            spacing: 12
                            Layout.topMargin: 20

                            Text {
                                text: "\u2B07"
                                font.pixelSize: 28
                                horizontalAlignment: Text.AlignHCenter
                                Layout.fillWidth: true
                                color: Theme.muted
                            }
                            Text {
                                text: "Drag & drop your job description here"
                                font.family: Theme.fontName
                                font.pixelSize: 14
                                font.weight: Font.DemiBold
                                color: Theme.text
                                horizontalAlignment: Text.AlignHCenter
                                Layout.fillWidth: true
                            }
                            Text {
                                text: "or click the button below to browse files"
                                font.family: Theme.fontName
                                font.pixelSize: 12
                                color: Theme.muted
                                horizontalAlignment: Text.AlignHCenter
                                Layout.fillWidth: true
                            }
                            Text {
                                text: "Supports PDF, DOCX, DOC, TXT \u2022 Max 10 MB"
                                font.family: Theme.fontName
                                font.pixelSize: 11
                                color: Theme.faint
                                horizontalAlignment: Text.AlignHCenter
                                Layout.fillWidth: true
                            }
                        }

                        Item { Layout.fillHeight: true }

                        Row {
                            spacing: 10

                            AppButton {
                                text: App?.jdFileName ? "Preview JD" : "Upload JD"
                                iconText: App?.jdFileName ? "\u{1F441}" : "\u2B07"
                                onClicked: {
                                    if (App?.jdFileName) {
                                        root.openPreview("JD - " + (App?.jdFileName ?? ""), App?.jdRawText ?? "")
                                    } else {
                                        jdFileDialog.open()
                                    }
                                }
                            }
                            AppButton {
                                visible: App?.jdFileName !== ""
                                kind: "secondary"
                                text: "Re-upload"
                                iconText: "\u{1F504}"
                                onClicked: jdFileDialog.open()
                            }
                            AppButton {
                                visible: App?.jdFileName !== ""
                                kind: "danger"
                                text: "Remove"
                                iconText: "\u2715"
                                onClicked: App?.clearJd()
                            }
                        }
                    }
                }
            }

            Card {
                visible: App?.documentsReady ?? false
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

    FileDialog {
        id: resumeFileDialog
        title: "Select Resume File"
        nameFilters: ["PDF files (*.pdf)", "Word documents (*.docx *.doc)", "Text files (*.txt)"]
        onAccepted: {
            var url = selectedFile.toString()
            var name = url.split("/").pop()
            App?.uploadResume(url, name)
        }
    }

    FileDialog {
        id: jdFileDialog
        title: "Select Job Description File"
        nameFilters: ["PDF files (*.pdf)", "Word documents (*.docx *.doc)", "Text files (*.txt)"]
        onAccepted: {
            var url = selectedFile.toString()
            var name = url.split("/").pop()
            App?.uploadJd(url, name)
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
                    id: previewTextArea
                    readOnly: true
                    wrapMode: TextArea.Wrap
                    font.family: "Consolas"
                    font.pixelSize: 12
                    color: Theme.text
                    text: ""
                    background: Rectangle { color: "#fafbfe"; radius: 10; border.color: Theme.border }
                }
            }
        }
    }
}
