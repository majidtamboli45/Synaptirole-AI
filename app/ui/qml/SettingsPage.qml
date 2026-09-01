import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

Item {
    id: root

    readonly property int cw: contentCol.width

    readonly property bool desktopWide: cw >= 1000
    readonly property bool desktop: cw >= 760
    readonly property bool tablet: cw >= 520

    readonly property int notificationCols:
        desktopWide ? 3 : (desktop ? 3 : 1)

    readonly property int privacyCols:
        desktopWide ? 4 : (desktop ? 2 : 1)

    readonly property int appearanceCols:
        desktopWide ? 4 : (desktop ? 2 : 1)

    readonly property int supportCols:
        desktop ? 2 : 1


    // ============================================================
    // SWITCH
    // ============================================================

    component SwitchCtl : Switch {
        id: switchControl

        implicitWidth: 46
        implicitHeight: 26

        indicator: Rectangle {
            implicitWidth: 46
            implicitHeight: 26
            width: 46
            height: 26
            radius: 13

            color: switchControl.checked
                   ? Theme.primary
                   : "#CBD5E1"

            Behavior on color {
                ColorAnimation {
                    duration: 160
                }
            }

            Rectangle {
                width: 20
                height: 20
                radius: 10

                y: 3
                x: switchControl.checked
                   ? parent.width - width - 3
                   : 3

                color: "#FFFFFF"

                Behavior on x {
                    NumberAnimation {
                        duration: 160
                        easing.type: Easing.OutCubic
                    }
                }
            }
        }
    }


    // ============================================================
    // SECTION CARD
    // ============================================================

    component SectionCard : Card {
        id: sectionCard

        property string heading: ""
        property string subheading: ""
        property string sectionIcon: ""
        property string iconBg: "#F3E8FF"
        property string iconColor: "#6D28D9"

        default property alias content: sectionBody.data

        Layout.fillWidth: true

        implicitHeight: sectionBody.implicitHeight + 48

        radius: 12

        color: "#FFFFFF"

        border.color: "#E8ECF3"
        border.width: 1

        ColumnLayout {
            id: sectionBody

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top

            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.topMargin: 20

            spacing: 20

            // ----------------------------------------------------
            // SECTION HEADER
            // ----------------------------------------------------

            RowLayout {
                Layout.fillWidth: true
                spacing: 14

                Rectangle {
                    width: 42
                    height: 42
                    radius: 8

                    color: sectionCard.iconBg

                    Layout.alignment: Qt.AlignTop

                    Text {
                        anchors.centerIn: parent

                        text: sectionCard.sectionIcon

                        font.family: Theme.fontName
                        font.pixelSize: 21

                        color: sectionCard.iconColor
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 3

                    Text {
                        text: sectionCard.heading

                        font.family: Theme.fontName
                        font.pixelSize: 16
                        font.weight: Font.Bold

                        color: Theme.text

                        Layout.fillWidth: true
                    }

                    Text {
                        text: sectionCard.subheading

                        font.family: Theme.fontName
                        font.pixelSize: 12

                        color: Theme.muted

                        wrapMode: Text.WordWrap

                        Layout.fillWidth: true
                    }
                }
            }
        }
    }


    // ============================================================
    // SETTING TILE
    // ============================================================

    component SettingTile : Item {
        id: settingTile

        property string icon: ""
        property string title: ""
        property string description: ""

        property string iconBg: "#F3E8FF"
        property string iconColor: "#6D28D9"

        property bool showDivider: false

        Layout.fillWidth: true
        Layout.fillHeight: true

        implicitHeight: 105

        Rectangle {
            visible: settingTile.showDivider

            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            width: 1

            color: "#E5EAF1"
        }

        RowLayout {
            anchors.fill: parent

            anchors.leftMargin: 8
            anchors.rightMargin: 16

            spacing: 14

            Rectangle {
                width: 42
                height: 42

                radius: 8

                color: settingTile.iconBg

                Layout.alignment: Qt.AlignTop

                Text {
                    anchors.centerIn: parent

                    text: settingTile.icon

                    font.family: Theme.fontName
                    font.pixelSize: 20

                    color: settingTile.iconColor
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop

                spacing: 4

                Text {
                    text: settingTile.title

                    font.family: Theme.fontName
                    font.pixelSize: 13
                    font.weight: Font.DemiBold

                    color: Theme.text

                    wrapMode: Text.WordWrap

                    Layout.fillWidth: true
                }

                Text {
                    text: settingTile.description

                    font.family: Theme.fontName
                    font.pixelSize: 12

                    color: Theme.muted

                    lineHeight: 1.25

                    wrapMode: Text.WordWrap

                    Layout.fillWidth: true
                }
            }
        }
    }


    // ============================================================
    // TOGGLE SETTING
    // ============================================================

    component ToggleSetting : Item {
        id: toggleSetting

        property string icon: ""
        property string title: ""
        property string description: ""

        property bool value: true

        property string iconBg: "#F3E8FF"
        property string iconColor: "#6D28D9"

        property bool showDivider: false

        signal toggled(bool checked)

        Layout.fillWidth: true
        Layout.fillHeight: true

        implicitHeight: 112

        Rectangle {
            visible: toggleSetting.showDivider

            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            width: 1

            color: "#E5EAF1"
        }

        RowLayout {
            anchors.fill: parent

            anchors.leftMargin: 8
            anchors.rightMargin: 12

            spacing: 14

            Rectangle {
                width: 42
                height: 42

                radius: 8

                color: toggleSetting.iconBg

                Layout.alignment: Qt.AlignTop

                Text {
                    anchors.centerIn: parent

                    text: toggleSetting.icon

                    font.family: Theme.fontName
                    font.pixelSize: 20

                    color: toggleSetting.iconColor
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true

                spacing: 4

                Text {
                    text: toggleSetting.title

                    font.family: Theme.fontName
                    font.pixelSize: 13
                    font.weight: Font.DemiBold

                    color: Theme.text

                    wrapMode: Text.WordWrap

                    Layout.fillWidth: true
                }

                Text {
                    text: toggleSetting.description

                    font.family: Theme.fontName
                    font.pixelSize: 12

                    color: Theme.muted

                    lineHeight: 1.25

                    wrapMode: Text.WordWrap

                    Layout.fillWidth: true

                    Layout.maximumHeight: 48
                }

                Item {
                    Layout.fillHeight: true
                }

                SwitchCtl {
                    checked: toggleSetting.value

                    Layout.alignment: Qt.AlignRight

                    onToggled: {
                        toggleSetting.toggled(checked)
                    }
                }
            }
        }
    }


    // ============================================================
    // DROPDOWN SETTING
    // ============================================================

    component DropdownSetting : Item {
        id: dropdownSetting

        property string icon: ""
        property string title: ""
        property string description: ""

        property string iconBg: "#EFF6FF"
        property string iconColor: "#2563EB"

        property alias model: combo.model
        property alias currentIndex: combo.currentIndex

        property bool showDivider: false

        signal pick(int index)

        Layout.fillWidth: true
        Layout.fillHeight: true

        implicitHeight: 112

        Rectangle {
            visible: dropdownSetting.showDivider

            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            width: 1

            color: "#E5EAF1"
        }

        ColumnLayout {
            anchors.fill: parent

            anchors.leftMargin: 8
            anchors.rightMargin: 12

            spacing: 7

            RowLayout {
                Layout.fillWidth: true
                spacing: 14

                Rectangle {
                    width: 42
                    height: 42

                    radius: 8

                    color: dropdownSetting.iconBg

                    Layout.alignment: Qt.AlignTop

                    Text {
                        anchors.centerIn: parent

                        text: dropdownSetting.icon

                        font.family: Theme.fontName
                        font.pixelSize: 20

                        color: dropdownSetting.iconColor
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 3

                    Text {
                        text: dropdownSetting.title

                        font.family: Theme.fontName
                        font.pixelSize: 13
                        font.weight: Font.DemiBold

                        color: Theme.text

                        Layout.fillWidth: true
                    }

                    Text {
                        text: dropdownSetting.description

                        font.family: Theme.fontName
                        font.pixelSize: 12

                        color: Theme.muted

                        wrapMode: Text.WordWrap

                        Layout.fillWidth: true
                    }
                }
            }

            AppComboBox {
                id: combo

                Layout.fillWidth: true
                Layout.maximumWidth: 230

                implicitHeight: 38

                onActivated: function(index) {
                    dropdownSetting.pick(index)
                }
            }
        }
    }


    // ============================================================
    // LINK SETTING
    // ============================================================

    component LinkSetting : Item {
        id: linkSetting

        property string icon: ""
        property string title: ""
        property string description: ""

        property string iconBg: "#F3E8FF"
        property string iconColor: "#6D28D9"

        property bool showDivider: false

        signal activated()

        Layout.fillWidth: true
        Layout.fillHeight: true

        implicitHeight: 100

        Rectangle {
            visible: linkSetting.showDivider

            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            width: 1

            color: "#E5EAF1"
        }

        RowLayout {
            anchors.fill: parent

            anchors.leftMargin: 8
            anchors.rightMargin: 8

            spacing: 14

            Rectangle {
                width: 42
                height: 42

                radius: 8

                color: linkSetting.iconBg

                Layout.alignment: Qt.AlignTop

                Text {
                    anchors.centerIn: parent

                    text: linkSetting.icon

                    font.family: Theme.fontName
                    font.pixelSize: 20

                    color: linkSetting.iconColor
                }
            }

            ColumnLayout {
                Layout.fillWidth: true

                spacing: 4

                Text {
                    text: linkSetting.title

                    font.family: Theme.fontName
                    font.pixelSize: 13
                    font.weight: Font.DemiBold

                    color: Theme.text

                    Layout.fillWidth: true
                }

                Text {
                    text: linkSetting.description

                    font.family: Theme.fontName
                    font.pixelSize: 12

                    color: Theme.muted

                    wrapMode: Text.WordWrap

                    Layout.fillWidth: true
                }
            }

            Text {
                text: "\u203A"

                font.family: Theme.fontName
                font.pixelSize: 26
                font.weight: Font.DemiBold

                color: Theme.text

                Layout.alignment: Qt.AlignVCenter
            }
        }

        MouseArea {
            anchors.fill: parent

            cursorShape: Qt.PointingHandCursor

            hoverEnabled: true

            onClicked: linkSetting.activated()
        }
    }


    // ============================================================
    // MAIN SCROLL AREA
    // ============================================================

    Flickable {
        id: flick

        anchors.fill: parent

        contentWidth: width
        contentHeight: contentCol.height + 56

        clip: true

        boundsBehavior: Flickable.StopAtBounds

        ScrollBar.vertical: ScrollBar {
            policy: ScrollBar.AsNeeded
        }


        ColumnLayout {
            id: contentCol

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


            // ====================================================
            // PAGE HEADER
            // ====================================================

            ColumnLayout {
                Layout.fillWidth: true

                spacing: 4

                Text {
                    text: "Settings"

                    font.family: Theme.fontName
                    font.pixelSize: 28
                    font.weight: Font.Bold

                    color: Theme.text
                }

                Text {
                    text: "Manage your preferences and system settings."

                    font.family: Theme.fontName
                    font.pixelSize: 13

                    color: Theme.muted
                }
            }


            // ====================================================
            // NOTIFICATION SETTINGS
            // ====================================================

            SectionCard {
                heading: "Notification Settings"
                subheading: "Choose what you want to be notified about."

                sectionIcon: "\u{1F514}"
                iconBg: "#F3E8FF"
                iconColor: "#6D28D9"

                GridLayout {
                    Layout.fillWidth: true

                    columns: root.notificationCols

                    columnSpacing: 0
                    rowSpacing: 12

                    ToggleSetting {
                        icon: "\u{1F4C5}"

                        title: "Interview Recommendations"

                        description:
                            "Get personalized interview recommendations and tips."

                        value: true

                        showDivider: root.notificationCols > 1

                        iconBg: "#F3E8FF"
                        iconColor: "#7C3AED"

                        onToggled: function(checked) {
                            App?.notify(
                                "Interview Recommendations "
                                + (checked ? "enabled" : "disabled")
                            )
                        }
                    }

                    ToggleSetting {
                        icon: "\u{1F4AC}"

                        title: "Interview Feedback"

                        description:
                            "Notify when interview feedback is ready."

                        value: true

                        showDivider: root.notificationCols > 1

                        iconBg: "#DCFCE7"
                        iconColor: "#16A34A"

                        onToggled: function(checked) {
                            App?.notify(
                                "Interview Feedback "
                                + (checked ? "enabled" : "disabled")
                            )
                        }
                    }

                    ToggleSetting {
                        icon: "\u{1F4C8}"

                        title: "Weekly Performance Summary"

                        description:
                            "Receive weekly performance reports."

                        value: false

                        showDivider: false

                        iconBg: "#FFF7ED"
                        iconColor: "#EA580C"

                        onToggled: function(checked) {
                            App?.notify(
                                "Weekly Performance Summary "
                                + (checked ? "enabled" : "disabled")
                            )
                        }
                    }
                }
            }


            // ====================================================
            // PRIVACY SETTINGS
            // ====================================================

            SectionCard {
                heading: "Privacy Settings"
                subheading: "Manage your data and privacy preferences."

                sectionIcon: "\u{1F6E1}"
                iconBg: "#DCFCE7"
                iconColor: "#16A34A"

                GridLayout {
                    Layout.fillWidth: true

                    columns: root.privacyCols

                    columnSpacing: 0
                    rowSpacing: 16


                    DropdownSetting {
                        icon: "\u{1F464}"

                        title: "Profile Visibility"

                        description:
                            "Choose who can see your profile."

                        model: [
                            "Only Me",
                            "Everyone"
                        ]

                        iconBg: "#DBEAFE"
                        iconColor: "#2563EB"

                        showDivider: root.privacyCols > 1
                    }


                    ToggleSetting {
                        icon: "\u{1F6E1}"

                        title: "Activity Tracking"

                        description:
                            "Allow tracking for better insights."

                        value: true

                        iconBg: "#DCFCE7"
                        iconColor: "#16A34A"

                        showDivider: root.privacyCols > 1

                        onToggled: function(checked) {
                            App?.notify(
                                "Activity Tracking "
                                + (checked ? "enabled" : "disabled")
                            )
                        }
                    }


                    ToggleSetting {
                        icon: "\u{1F4CA}"

                        title: "Data Usage"

                        description:
                            "Allow anonymous usage data."

                        value: true

                        iconBg: "#FFF7ED"
                        iconColor: "#EA580C"

                        showDivider: root.privacyCols > 1

                        onToggled: function(checked) {
                            App?.notify(
                                "Anonymous data usage "
                                + (checked ? "enabled" : "disabled")
                            )
                        }
                    }


                    LinkSetting {
                        icon: "\u{2B07}"

                        title: "Download My Data"

                        description:
                            "Download all your data and reports."

                        iconBg: "#F3E8FF"
                        iconColor: "#7C3AED"

                        showDivider: false

                        onActivated: {
                            App?.downloadData()
                        }
                    }
                }
            }


            // ====================================================
            // APPEARANCE
            // ====================================================

            SectionCard {
                heading: "Appearance"
                subheading: "Customize the look and feel of the application."

                sectionIcon: "\u{2600}"
                iconBg: "#DBEAFE"
                iconColor: "#2563EB"

                GridLayout {
                    Layout.fillWidth: true

                    columns: root.appearanceCols

                    columnSpacing: 0
                    rowSpacing: 16


                    DropdownSetting {
                        icon: "\u{2600}"

                        title: "Theme"

                        description:
                            "Choose your preferred theme."

                        model: [
                            "Light",
                            "Dark",
                            "System Default"
                        ]

                        iconBg: "#DBEAFE"
                        iconColor: "#2563EB"

                        showDivider: root.appearanceCols > 1

                        onPick: function(index) {
                            if (index === 1) {
                                App?.notify(
                                    "Dark theme is coming soon in the demo."
                                )
                            }
                        }
                    }


                    DropdownSetting {
                        icon: "\u{1F310}"

                        title: "Language"

                        description:
                            "Select your preferred language."

                        model: [
                            "English",
                            "Hindi",
                            "Marathi",
                            "Spanish",
                            "German",
                            "French"
                        ]

                        iconBg: "#DBEAFE"
                        iconColor: "#2563EB"

                        showDivider: root.appearanceCols > 1
                    }


                    DropdownSetting {
                        icon: "\u{1F4C5}"

                        title: "Date Format"

                        description:
                            "Choose your date format."

                        model: [
                            "DD MMM YYYY",
                            "DD/MM/YYYY",
                            "MM/DD/YYYY",
                            "YYYY-MM-DD"
                        ]

                        iconBg: "#F3E8FF"
                        iconColor: "#7C3AED"

                        showDivider: root.appearanceCols > 1
                    }


                    DropdownSetting {
                        icon: "\u{1F552}"

                        title: "Time Format"

                        description:
                            "Choose your time format."

                        model: [
                            "12 Hour (AM/PM)",
                            "24 Hour"
                        ]

                        iconBg: "#F3E8FF"
                        iconColor: "#7C3AED"

                        showDivider: false
                    }
                }
            }


            // ====================================================
            // ABOUT & SUPPORT
            // ====================================================

            SectionCard {
                heading: "About & Support"
                subheading: "App information and help resources."

                sectionIcon: "\u{2753}"
                iconBg: "#F3E8FF"
                iconColor: "#7C3AED"

                GridLayout {
                    Layout.fillWidth: true

                    columns: root.supportCols

                    columnSpacing: 0
                    rowSpacing: 12


                    LinkSetting {
                        icon: "\u{1F310}"

                        title: "Help Center"

                        description:
                            "Get help and support."

                        iconBg: "#F3E8FF"
                        iconColor: "#7C3AED"

                        showDivider: root.supportCols > 1

                        onActivated: {
                            App?.notify(
                                "Opening Help Center."
                            )
                        }
                    }


                    LinkSetting {
                        icon: "\u{1F3A7}"

                        title: "Contact Support"

                        description:
                            "Reach out to our support team."

                        iconBg: "#DCFCE7"
                        iconColor: "#16A34A"

                        showDivider: false

                        onActivated: {
                            App?.notify(
                                "Opening Contact Support."
                            )
                        }
                    }
                }
            }


            // Bottom spacing
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 10
            }
        }
    }
}
