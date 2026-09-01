import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

Item {
    id: root

    readonly property int pageWidth: contentArea.width
    readonly property bool wideScreen: pageWidth >= 1000

    property int selectedSection: 0


    component SwitchCtl : Switch {
        id: sw

        implicitWidth: 46
        implicitHeight: 26

        indicator: Rectangle {
            width: 46
            height: 26
            radius: 13

            color: sw.checked
                   ? Theme.primary
                   : "#CBD5E1"

            Behavior on color {
                ColorAnimation {
                    duration: 150
                }
            }

            Rectangle {
                width: 20
                height: 20
                radius: 10

                y: 3
                x: sw.checked
                   ? parent.width - width - 3
                   : 3

                color: "#FFFFFF"

                Behavior on x {
                    NumberAnimation {
                        duration: 150
                        easing.type: Easing.OutCubic
                    }
                }
            }
        }
    }


    component NavItem : Rectangle {
        id: navItem

        property string icon: ""
        property string title: ""
        property int index: 0

        signal selected()

        Layout.fillWidth: true

        height: 42

        radius: 8

        color: root.selectedSection === index
               ? "#F0EDFF"
               : "transparent"

        Rectangle {
            visible: root.selectedSection === index

            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            width: 3

            radius: 2

            color: Theme.primary
        }

        RowLayout {
            anchors.fill: parent

            anchors.leftMargin: 16
            anchors.rightMargin: 12

            spacing: 14

            Text {
                text: navItem.icon

                font.family: Theme.fontName
                font.pixelSize: 18

                color: root.selectedSection === index
                       ? Theme.primary
                       : Theme.text

                Layout.alignment: Qt.AlignVCenter
            }

            Text {
                text: navItem.title

                font.family: Theme.fontName
                font.pixelSize: 13

                font.weight: root.selectedSection === index
                             ? Font.DemiBold
                             : Font.Medium

                color: root.selectedSection === index
                       ? Theme.primary
                       : Theme.text

                Layout.fillWidth: true

                Layout.alignment: Qt.AlignVCenter
            }
        }

        MouseArea {
            anchors.fill: parent

            cursorShape: Qt.PointingHandCursor

            onClicked: {
                root.selectedSection = navItem.index
                navItem.selected()
            }
        }
    }


    component SectionHeader : ColumnLayout {
        property string title: ""
        property string subtitle: ""

        Layout.fillWidth: true

        spacing: 4

        Text {
            text: parent.title

            font.family: Theme.fontName
            font.pixelSize: 15
            font.weight: Font.Bold

            color: Theme.text

            Layout.fillWidth: true
        }

        Text {
            text: parent.subtitle

            font.family: Theme.fontName
            font.pixelSize: 11

            color: Theme.muted

            Layout.fillWidth: true
        }
    }


    component FormField : ColumnLayout {
        id: formField

        property string label: ""
        property string value: ""

        Layout.fillWidth: true

        spacing: 6

        Text {
            text: formField.label

            font.family: Theme.fontName
            font.pixelSize: 11
            font.weight: Font.DemiBold

            color: Theme.text

            Layout.fillWidth: true
        }

        AppTextField {
            text: formField.value

            Layout.fillWidth: true

            implicitHeight: 36
        }
    }


    component EmailRow : Item {
        id: emailRow

        property string icon: ""
        property string title: ""
        property string subtitle: ""
        property bool enabledValue: true

        Layout.fillWidth: true

        implicitHeight: 40

        RowLayout {
            anchors.fill: parent

            spacing: 14

            Rectangle {
                width: 34
                height: 34

                radius: 8

                color: emailRow.enabledValue
                       ? "#F3E8FF"
                       : "#FFF7ED"

                Text {
                    anchors.centerIn: parent

                    text: emailRow.icon

                    font.pixelSize: 17

                    color: emailRow.enabledValue
                           ? "#7C3AED"
                           : "#EA580C"
                }
            }

            ColumnLayout {
                Layout.fillWidth: true

                spacing: 2

                Text {
                    text: emailRow.title

                    font.family: Theme.fontName
                    font.pixelSize: 12
                    font.weight: Font.DemiBold

                    color: Theme.text

                    Layout.fillWidth: true
                }

                Text {
                    text: emailRow.subtitle

                    font.family: Theme.fontName
                    font.pixelSize: 10

                    color: Theme.muted

                    Layout.fillWidth: true
                }
            }

            SwitchCtl {
                checked: emailRow.enabledValue

                Layout.alignment: Qt.AlignVCenter
            }
        }
    }


    component ActionRow : Rectangle {
        id: actionRow

        property string icon: ""
        property string title: ""
        property string subtitle: ""

        property string buttonText: ""
        property string buttonKind: "secondary"

        signal activated()

        Layout.fillWidth: true

        implicitHeight: 66

        color: "transparent"

        RowLayout {
            anchors.fill: parent

            spacing: 14

            Rectangle {
                width: 34
                height: 34

                radius: 8

                color: "#F3F6FA"

                Text {
                    anchors.centerIn: parent

                    text: actionRow.icon

                    font.pixelSize: 17

                    color: Theme.primary
                }
            }

            ColumnLayout {
                Layout.fillWidth: true

                spacing: 3

                Text {
                    text: actionRow.title

                    font.family: Theme.fontName
                    font.pixelSize: 12
                    font.weight: Font.DemiBold

                    color: Theme.text

                    Layout.fillWidth: true
                }

                Text {
                    text: actionRow.subtitle

                    font.family: Theme.fontName
                    font.pixelSize: 10

                    color: Theme.muted

                    Layout.fillWidth: true
                }
            }

            AppButton {
                kind: actionRow.buttonKind

                text: actionRow.buttonText

                onClicked: actionRow.activated()
            }
        }
    }


    Flickable {
        id: flick

        anchors.fill: parent

        contentWidth: width

        contentHeight: contentArea.height + 56

        clip: true

        boundsBehavior: Flickable.StopAtBounds

        ScrollBar.vertical: ScrollBar {
            policy: ScrollBar.AsNeeded
        }


        ColumnLayout {
            id: contentArea

            width: Math.min(
                1180,
                parent.width - 56
            )

            x: Math.max(
                28,
                (parent.width - width) / 2
            )

            y: 28

            spacing: 18


            RowLayout {
                Layout.fillWidth: true

                spacing: 12

                Text {
                    text: "\u2190"

                    font.family: Theme.fontName
                    font.pixelSize: 30

                    color: Theme.text

                    Layout.alignment: Qt.AlignVCenter

                    MouseArea {
                        anchors.fill: parent

                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            App?.navigate("settings")
                        }
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true

                    spacing: 3

                    Text {
                        text: "Account Settings"

                        font.family: Theme.fontName
                        font.pixelSize: 24
                        font.weight: Font.Bold

                        color: Theme.text

                        Layout.fillWidth: true
                    }

                    Text {
                        text: "Manage your account preferences and security settings."

                        font.family: Theme.fontName
                        font.pixelSize: 12

                        color: Theme.muted

                        Layout.fillWidth: true
                    }
                }
            }


            RowLayout {
                id: settingsLayout

                Layout.fillWidth: true

                Layout.alignment: Qt.AlignTop

                spacing: 24


                Card {
                    id: sideCard

                    Layout.preferredWidth: 235

                    Layout.minimumWidth: 210

                    Layout.fillHeight: true

                    Layout.alignment: Qt.AlignTop

                    implicitHeight: 640

                    radius: 10

                    ColumnLayout {
                        anchors.fill: parent

                        anchors.margins: 10

                        spacing: 4


                        NavItem {
                            icon: "\u{1F464}"

                            title: "Account Information"

                            index: 0

                            onSelected: {
                                flick.contentY =
                                    Math.max(
                                        0,
                                        accountCard.y - 20
                                    )
                            }
                        }


                        NavItem {
                            icon: "\u{2709}"

                            title: "Email Preferences"

                            index: 1

                            onSelected: {
                                flick.contentY =
                                    Math.max(
                                        0,
                                        emailCard.y - 20
                                    )
                            }
                        }


                        NavItem {
                            icon: "\u{1F6E1}"

                            title: "Security"

                            index: 2

                            onSelected: {
                                flick.contentY =
                                    Math.max(
                                        0,
                                        securityCard.y - 20
                                    )
                            }
                        }


                        NavItem {
                            icon: "\u{1F5A5}"

                            title: "Sessions"

                            index: 3

                            onSelected: {
                                flick.contentY =
                                    Math.max(
                                        0,
                                        sessionsCard.y - 20
                                    )
                            }
                        }


                        NavItem {
                            icon: "\u{1F5D1}"

                            title: "Delete Account"

                            index: 4

                            onSelected: {
                                flick.contentY =
                                    Math.max(
                                        0,
                                        deleteCard.y - 20
                                    )
                            }
                        }


                        Item {
                            Layout.fillHeight: true
                        }
                    }
                }


                ColumnLayout {
                    id: rightContent

                    Layout.fillWidth: true

                    Layout.alignment: Qt.AlignTop

                    spacing: 14


                    Card {
                        id: accountCard

                        Layout.fillWidth: true

                        implicitHeight: 320

                        ColumnLayout {
                            anchors.fill: parent

                            anchors.margins: 20

                            spacing: 14


                            SectionHeader {
                                title: "Account Information"

                                subtitle:
                                    "Update your personal details and account information."
                            }


                            GridLayout {
                                Layout.fillWidth: true

                                columns: wideScreen ? 2 : 1

                                columnSpacing: 20

                                rowSpacing: 12


                                FormField {
                                    label: "Full Name"

                                    value:
                                        App?.userName ?? "Arjun Sharma"
                                }


                                FormField {
                                    label: "Email Address"

                                    value:
                                        App?.userEmail
                                        ?? "arjun.sharma@example.com"
                                }


                                FormField {
                                    label: "Phone Number"

                                    value:
                                        App?.userPhone
                                        ?? "+91 98765 43210"
                                }


                                ColumnLayout {
                                    Layout.fillWidth: true

                                    spacing: 6

                                    Text {
                                        text: "Job Role"

                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        font.weight: Font.DemiBold

                                        color: Theme.text
                                    }

                                    AppComboBox {
                                        Layout.fillWidth: true

                                        implicitHeight: 36

                                        model: [
                                            "AI/ML Engineer",
                                            "Software Developer",
                                            "Data Analyst",
                                            "Data Scientist",
                                            "Backend Engineer"
                                        ]
                                    }
                                }


                                ColumnLayout {
                                    Layout.fillWidth: true

                                    spacing: 6

                                    Text {
                                        text: "Experience"

                                        font.family: Theme.fontName
                                        font.pixelSize: 11
                                        font.weight: Font.DemiBold

                                        color: Theme.text
                                    }

                                    AppComboBox {
                                        Layout.fillWidth: true

                                        implicitHeight: 36

                                        model: [
                                            "Fresher",
                                            "1+ Years",
                                            "2+ Years",
                                            "3+ Years",
                                            "5+ Years"
                                        ]
                                    }
                                }


                                FormField {
                                    label: "Location"

                                    value:
                                        App?.userLocation
                                        ?? "Pune, Maharashtra, India"
                                }
                            }


                            Item {
                                Layout.fillHeight: true
                            }


                            RowLayout {
                                Layout.fillWidth: true

                                Item {
                                    Layout.fillWidth: true
                                }

                                AppButton {
                                    text: "Save Changes"

                                    onClicked: {
                                        App?.saveAccount()
                                    }
                                }
                            }
                        }
                    }


                    Card {
                        id: emailCard

                        Layout.fillWidth: true

                        implicitHeight: 260

                        ColumnLayout {
                            anchors.fill: parent

                            anchors.margins: 20

                            spacing: 10


                            SectionHeader {
                                title: "Email Preferences"

                                subtitle:
                                    "Choose what emails you want to receive from us."
                            }


                            EmailRow {
                                icon: "\u{2709}"

                                title: "Product Updates"

                                subtitle:
                                    "Receive emails about new features and product updates."

                                enabledValue: true
                            }


                            EmailRow {
                                icon: "\u{1F4C8}"

                                title: "Weekly Performance Summary"

                                subtitle:
                                    "Get a weekly summary of your interview performance."

                                enabledValue: true
                            }


                            EmailRow {
                                icon: "\u{1F514}"

                                title: "Tips & Recommendations"

                                subtitle:
                                    "Receive tips and personalized recommendations."

                                enabledValue: true
                            }


                            EmailRow {
                                icon: "\u{1F3F7}"

                                title: "Offers & Promotions"

                                subtitle:
                                    "Receive emails about offers, promotions and special events."

                                enabledValue: false
                            }
                        }
                    }


                    Card {
                        id: securityCard

                        Layout.fillWidth: true

                        implicitHeight: 118

                        ColumnLayout {
                            anchors.fill: parent

                            anchors.margins: 20

                            spacing: 10


                            SectionHeader {
                                title: "Security"

                                subtitle:
                                    "Manage your password and account security."
                            }


                            RowLayout {
                                Layout.fillWidth: true

                                ColumnLayout {
                                    Layout.fillWidth: true

                                    spacing: 3

                                    Text {
                                        text: "Password"

                                        font.family: Theme.fontName
                                        font.pixelSize: 12
                                        font.weight: Font.DemiBold

                                        color: Theme.text
                                    }

                                    Text {
                                        text: "Your password is secure"

                                        font.family: Theme.fontName
                                        font.pixelSize: 10
                                        font.weight: Font.DemiBold

                                        color: "#16A34A"
                                    }

                                    Text {
                                        text: "\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022"

                                        font.family: Theme.fontName
                                        font.pixelSize: 13
                                        font.letterSpacing: 2

                                        color: Theme.text
                                    }
                                }


                                AppButton {
                                    kind: "secondary"

                                    text: "Update Password"

                                    iconText: "\u{1F512}"

                                    onClicked: {
                                        pwdDialog.open()
                                    }
                                }
                            }
                        }
                    }


                    Card {
                        id: sessionsCard

                        Layout.fillWidth: true

                        implicitHeight: 82

                        ColumnLayout {
                            anchors.fill: parent

                            anchors.margins: 20

                            spacing: 6


                            RowLayout {
                                Layout.fillWidth: true

                                ColumnLayout {
                                    Layout.fillWidth: true

                                    spacing: 3

                                    Text {
                                        text: "Sessions"

                                        font.family: Theme.fontName
                                        font.pixelSize: 13
                                        font.weight: Font.Bold

                                        color: Theme.text
                                    }

                                    Text {
                                        text: "Manage your active sessions across devices."

                                        font.family: Theme.fontName
                                        font.pixelSize: 10

                                        color: Theme.muted
                                    }
                                }


                                AppButton {
                                    kind: "secondary"

                                    text: "View All Sessions"

                                    iconText: "\u{1F5A5}"

                                    onClicked: {
                                        App?.notify(
                                            "Showing all active sessions."
                                        )
                                    }
                                }
                            }
                        }
                    }


                    Card {
                        id: deleteCard

                        Layout.fillWidth: true

                        implicitHeight: 82

                        ColumnLayout {
                            anchors.fill: parent

                            anchors.margins: 20

                            spacing: 6


                            RowLayout {
                                Layout.fillWidth: true

                                ColumnLayout {
                                    Layout.fillWidth: true

                                    spacing: 3

                                    Text {
                                        text: "Delete Account"

                                        font.family: Theme.fontName
                                        font.pixelSize: 13
                                        font.weight: Font.Bold

                                        color: Theme.text
                                    }

                                    Text {
                                        text:
                                            "Permanently delete your account and all your data."

                                        font.family: Theme.fontName
                                        font.pixelSize: 10

                                        color: Theme.muted
                                    }
                                }


                                AppButton {
                                    kind: "danger"

                                    text: "Delete Account"

                                    iconText: "\u{1F5D1}"

                                    onClicked: {
                                        deleteDialog.open()
                                    }
                                }
                            }
                        }
                    }
                }
            }


            Item {
                Layout.fillWidth: true

                Layout.preferredHeight: 10
            }
        }
    }


    Popup {
        id: pwdDialog

        anchors.centerIn: parent

        width: 420

        modal: true

        dim: true

        padding: 24

        background: Rectangle {
            radius: 14

            color: Theme.card

            border.color: Theme.border
        }

        contentItem: Column {
            spacing: 14


            Text {
                text: "Update Password"

                font.family: Theme.fontName
                font.pixelSize: 18
                font.weight: Font.Bold

                color: Theme.text
            }


            Column {
                width: parent.width

                spacing: 6

                Text {
                    text: "Current Password"

                    font.family: Theme.fontName
                    font.pixelSize: 12
                    font.weight: Font.Medium

                    color: Theme.text
                }

                AppTextField {
                    width: parent.width

                    echoMode: TextInput.Password

                    placeholderText: "Enter current password"
                }
            }


            Column {
                width: parent.width

                spacing: 6

                Text {
                    text: "New Password"

                    font.family: Theme.fontName
                    font.pixelSize: 12
                    font.weight: Font.Medium

                    color: Theme.text
                }

                AppTextField {
                    width: parent.width

                    echoMode: TextInput.Password

                    placeholderText: "Enter new password"
                }
            }


            Column {
                width: parent.width

                spacing: 6

                Text {
                    text: "Confirm New Password"

                    font.family: Theme.fontName
                    font.pixelSize: 12
                    font.weight: Font.Medium

                    color: Theme.text
                }

                AppTextField {
                    width: parent.width

                    echoMode: TextInput.Password

                    placeholderText: "Repeat new password"
                }
            }


            Row {
                anchors.right: parent.right

                spacing: 10

                topPadding: 6


                AppButton {
                    kind: "secondary"

                    text: "Cancel"

                    onClicked: {
                        pwdDialog.close()
                    }
                }


                AppButton {
                    text: "Save Password"

                    onClicked: {
                        pwdDialog.close()

                        App?.updatePassword()
                    }
                }
            }
        }
    }


    Popup {
        id: deleteDialog

        anchors.centerIn: parent

        width: 450

        modal: true

        dim: true

        padding: 26

        background: Rectangle {
            radius: 14

            color: Theme.card

            border.color: "#FECACA"
        }

        contentItem: Column {
            spacing: 14


            Rectangle {
                width: 50
                height: 50

                radius: 25

                color: "#FEF2F2"

                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    anchors.centerIn: parent

                    text: "\u26A0"

                    font.pixelSize: 22

                    color: "#DC2626"
                }
            }


            Text {
                anchors.horizontalCenter: parent.horizontalCenter

                text: "Delete your account?"

                font.family: Theme.fontName
                font.pixelSize: 18
                font.weight: Font.Bold

                color: Theme.text
            }


            Text {
                anchors.horizontalCenter: parent.horizontalCenter

                width: parent.width

                horizontalAlignment: Text.AlignHCenter

                wrapMode: Text.WordWrap

                text:
                    "This will permanently remove your profile, resume data, interview history, scores, reports and preferences. This action cannot be undone."

                font.family: Theme.fontName
                font.pixelSize: 12

                color: Theme.muted

                lineHeight: 1.35
            }


            Row {
                anchors.horizontalCenter: parent.horizontalCenter

                spacing: 12

                topPadding: 6


                AppButton {
                    kind: "secondary"

                    text: "Cancel"

                    onClicked: {
                        deleteDialog.close()
                    }
                }


                AppButton {
                    kind: "danger"

                    text: "Confirm Delete"

                    onClicked: {
                        deleteDialog.close()

                        App?.deleteAccount()
                    }
                }
            }
        }
    }
}
