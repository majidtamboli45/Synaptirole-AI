import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.LocalStorage 2.0
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
    // SETTINGS PERSISTENCE (QML LocalStorage)
    // ============================================================

    function db() {
        return LocalStorage.openDatabaseSync(
            "SynaptiRole_App",
            "1.0",
            "SynaptiRole settings storage",
            1000000
        )
    }

    function initStorage() {
        try {
            var d = db()
            d.transaction(function(tx) {
                tx.executeSql(
                    "CREATE TABLE IF NOT EXISTS settings(key TEXT PRIMARY KEY, value TEXT)"
                )
            })
        } catch (e) {
            console.warn("Settings storage unavailable:", e)
        }
    }

    function storedValue(key, fallback) {
        var out = fallback
        try {
            var d = db()
            d.readTransaction(function(tx) {
                tx.executeSql(
                    "CREATE TABLE IF NOT EXISTS settings(key TEXT PRIMARY KEY, value TEXT)"
                )
                var res = tx.executeSql(
                    "SELECT value FROM settings WHERE key=?", [key]
                )
                if (res.rows.length > 0)
                    out = res.rows.item(0).value
            })
        } catch (e) {
            console.warn("Settings read failed:", e)
        }
        return out
    }

    function storedBool(key, fallback) {
        var v = storedValue(key, null)
        if (v === null || v === undefined || v === "")
            return fallback
        return String(v) === "true"
    }

    function persistSetting(key, val) {
        try {
            var d = db()
            d.transaction(function(tx) {
                tx.executeSql(
                    "CREATE TABLE IF NOT EXISTS settings(key TEXT PRIMARY KEY, value TEXT)"
                )
                tx.executeSql(
                    "INSERT OR REPLACE INTO settings(key, value) VALUES(?, ?)",
                    [key, String(val)]
                )
            })
        } catch (e) {
            console.warn("Settings write failed:", e)
        }
    }

    function clearSettings() {
        try {
            var d = db()
            d.transaction(function(tx) {
                tx.executeSql(
                    "CREATE TABLE IF NOT EXISTS settings(key TEXT PRIMARY KEY, value TEXT)"
                )
                tx.executeSql("DELETE FROM settings")
            })
        } catch (e) {
            console.warn("Settings clear failed:", e)
        }
    }

    function indexOfValue(model, val) {
        if (model === null || model === undefined)
            return 0
        for (var i = 0; i < model.length; i++) {
            if (String(model[i]) === String(val))
                return i
        }
        return 0
    }

    function doReset() {
        clearSettings()
        notifRecommendations.value = true
        notifFeedback.value = true
        notifWeekly.value = false
        privacyTracking.value = true
        privacyData.value = true
        privacyVisibility.currentIndex = 0
        appearanceTheme.currentIndex = 0
        appearanceLanguage.currentIndex = 0
        appearanceDate.currentIndex = 0
        appearanceTime.currentIndex = 0
        App?.notify("Settings reset to defaults.")
    }

    Component.onCompleted: {
        root.initStorage()
    }

    // ============================================================
    // SWITCH
    // ============================================================

    component SwitchCtl : Switch {
        id: sw

        implicitWidth: 46
        implicitHeight: 26

        indicator: Rectangle {
            implicitWidth: 46
            implicitHeight: 26
            width: 46
            height: 26
            radius: 13

            color: sw.checked
                   ? Theme.primary
                   : "#CBD5E1"

            border.width: sw.checked ? 0 : 1
            border.color: "#B6BFCE"

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
                x: sw.checked
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

        radius: 14

        color: "#FFFFFF"

        border.color: "#E7EAF2"
        border.width: 1

        ColumnLayout {
            id: sectionBody

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top

            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.topMargin: 20

            spacing: 16

            // ----------------------------------------------------
            // SECTION HEADER
            // ----------------------------------------------------

            RowLayout {
                Layout.fillWidth: true
                spacing: 13

                Rectangle {
                    width: 40
                    height: 40
                    radius: 11

                    color: sectionCard.iconBg

                    Layout.alignment: Qt.AlignTop

                    Text {
                        anchors.centerIn: parent

                        text: sectionCard.sectionIcon

                        font.family: Theme.fontName
                        font.pixelSize: 19

                        color: sectionCard.iconColor
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter
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

            // Section header divider
            Rectangle {
                Layout.fillWidth: true

                height: 1

                color: "#EFF1F7"
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

        implicitHeight: 96

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

            anchors.leftMargin: 4
            anchors.rightMargin: 8

            spacing: 14

            Rectangle {
                width: 40
                height: 40

                radius: 11

                color: settingTile.iconBg

                Layout.alignment: Qt.AlignVCenter

                Text {
                    anchors.centerIn: parent

                    text: settingTile.icon

                    font.family: Theme.fontName
                    font.pixelSize: 18

                    color: settingTile.iconColor
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter

                spacing: 3

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

                    lineHeight: 1.2

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

        property string settingKey: ""

        property string iconBg: "#F3E8FF"
        property string iconColor: "#6D28D9"

        property bool showDivider: false

        signal toggled(bool checked)

        Component.onCompleted: {
            if (toggleSetting.settingKey !== "")
                toggleSetting.value = root.storedBool(
                    toggleSetting.settingKey,
                    toggleSetting.value
                )
        }

        Layout.fillWidth: true
        Layout.fillHeight: true

        implicitHeight: 96

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

            anchors.leftMargin: 4
            anchors.rightMargin: 8

            anchors.topMargin: 12
            anchors.bottomMargin: 12

            spacing: 14

            Rectangle {
                width: 40
                height: 40

                radius: 11

                color: toggleSetting.iconBg

                Layout.alignment: Qt.AlignVCenter

                Text {
                    anchors.centerIn: parent

                    text: toggleSetting.icon

                    font.family: Theme.fontName
                    font.pixelSize: 18

                    color: toggleSetting.iconColor
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter

                spacing: 3

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

                    lineHeight: 1.2

                    wrapMode: Text.WordWrap

                    Layout.fillWidth: true
                }
            }

            Row {
                Layout.alignment: Qt.AlignVCenter

                spacing: 8

                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter

                    width: badgeText.implicitWidth + 14
                    height: 22

                    radius: 6

                    color: swCtl.checked ? "#E7F7EE" : "#F3F4F8"

                    Text {
                        id: badgeText

                        anchors.centerIn: parent

                        text: swCtl.checked ? "On" : "Off"

                        font.family: Theme.fontName
                        font.pixelSize: 10
                        font.weight: Font.DemiBold

                        color: swCtl.checked ? "#159447" : "#64748B"
                    }
                }

                SwitchCtl {
                    id: swCtl

                    checked: toggleSetting.value

                    onToggled: {
                        if (toggleSetting.settingKey !== "")
                            root.persistSetting(
                                toggleSetting.settingKey,
                                checked
                            )
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

        property string settingKey: ""

        property bool showDivider: false

        signal pick(int index)

        Component.onCompleted: {
            if (dropdownSetting.settingKey !== "") {
                var stored = root.storedValue(
                    dropdownSetting.settingKey,
                    null
                )
                if (stored !== null && stored !== undefined)
                    combo.currentIndex = root.indexOfValue(
                        combo.model,
                        stored
                    )
            }
        }

        Layout.fillWidth: true
        Layout.fillHeight: true

        implicitHeight: 132

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

            anchors.leftMargin: 4
            anchors.rightMargin: 8

            anchors.topMargin: 14
            anchors.bottomMargin: 12

            spacing: 8

            RowLayout {
                Layout.fillWidth: true
                spacing: 14

                Rectangle {
                    width: 40
                    height: 40

                    radius: 11

                    color: dropdownSetting.iconBg

                    Layout.alignment: Qt.AlignTop

                    Text {
                        anchors.centerIn: parent

                        text: dropdownSetting.icon

                        font.family: Theme.fontName
                        font.pixelSize: 18

                        color: dropdownSetting.iconColor
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter

                    spacing: 3

                    Text {
                        text: dropdownSetting.title

                        font.family: Theme.fontName
                        font.pixelSize: 13
                        font.weight: Font.DemiBold

                        color: Theme.text

                        wrapMode: Text.WordWrap

                        Layout.fillWidth: true
                    }

                    Text {
                        text: dropdownSetting.description

                        font.family: Theme.fontName
                        font.pixelSize: 12

                        color: Theme.muted

                        lineHeight: 1.2

                        wrapMode: Text.WordWrap

                        Layout.fillWidth: true
                    }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.bottomMargin: 4
                spacing: 0

                Item {
                    Layout.fillWidth: true
                }

                AppComboBox {
                    id: combo

                    Layout.preferredWidth: 220
                    Layout.maximumWidth: 220
                    Layout.fillWidth: true

                    implicitHeight: 38

                    onActivated: function(index) {
                        if (dropdownSetting.settingKey !== "") {
                            var val = combo.model[index]
                            if (val !== undefined && val !== null)
                                root.persistSetting(
                                    dropdownSetting.settingKey,
                                    val
                                )
                        }
                        dropdownSetting.pick(index)
                    }
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

        implicitHeight: 96

        Rectangle {
            visible: linkSetting.showDivider

            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            width: 1

            color: "#E5EAF1"
        }

        Rectangle {
            anchors.fill: parent

            radius: 11

            color: linkArea.containsMouse
                   ? "#F7F8FB"
                   : "transparent"

            Behavior on color {
                ColorAnimation {
                    duration: 140
                }
            }
        }

        RowLayout {
            anchors.fill: parent

            anchors.leftMargin: 4
            anchors.rightMargin: 8

            anchors.topMargin: 12
            anchors.bottomMargin: 12

            spacing: 14

            Rectangle {
                width: 40
                height: 40

                radius: 11

                color: linkSetting.iconBg

                Layout.alignment: Qt.AlignVCenter

                Text {
                    anchors.centerIn: parent

                    text: linkSetting.icon

                    font.family: Theme.fontName
                    font.pixelSize: 18

                    color: linkSetting.iconColor
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter

                spacing: 3

                Text {
                    text: linkSetting.title

                    font.family: Theme.fontName
                    font.pixelSize: 13
                    font.weight: Font.DemiBold

                    color: Theme.text

                    wrapMode: Text.WordWrap

                    Layout.fillWidth: true
                }

                Text {
                    text: linkSetting.description

                    font.family: Theme.fontName
                    font.pixelSize: 12

                    color: Theme.muted

                    lineHeight: 1.2

                    wrapMode: Text.WordWrap

                    Layout.fillWidth: true
                }
            }

            Text {
                text: "\u203A"

                font.family: Theme.fontName
                font.pixelSize: 24
                font.weight: Font.DemiBold

                color: linkArea.containsMouse
                       ? Theme.primary
                       : Theme.faint

                Layout.alignment: Qt.AlignVCenter

                Behavior on color {
                    ColorAnimation {
                        duration: 140
                    }
                }
            }
        }

        MouseArea {
            id: linkArea

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

            spacing: 22


            // ====================================================
            // PAGE HEADER
            // ====================================================

            RowLayout {
                Layout.fillWidth: true

                spacing: 16

                Rectangle {
                    Layout.preferredWidth: 46
                    Layout.preferredHeight: 46

                    radius: 13

                    color: "#F3E8FF"

                    Text {
                        anchors.centerIn: parent

                        text: "\u2699\uFE0F"

                        font.family: Theme.fontName
                        font.pixelSize: 22

                        color: "#7C3AED"
                    }
                }

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

                Item {
                    Layout.fillWidth: true
                }

                Button {
                    id: resetBtn

                    Layout.preferredHeight: 34

                    implicitWidth: 132

                    Layout.alignment: Qt.AlignVCenter

                    contentItem: Text {
                        text: resetBtn.text

                        font.family: Theme.fontName
                        font.pixelSize: 11
                        font.weight: Font.DemiBold

                        color: resetBtn.hovered
                               ? Theme.primary
                               : Theme.text

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    background: Rectangle {
                        radius: 9

                        color: resetBtn.hovered ? "#F3F0FF" : "#FFFFFF"

                        border.color: resetBtn.hovered
                                      ? Theme.primary
                                      : "#E7EAF2"
                        border.width: 1
                    }

                    onClicked: {
                        confirmBox.openConfirm(
                            "Reset Settings",
                            "Reset all settings to their default values?",
                            "Reset",
                            function() {
                                root.doReset()
                            }
                        )
                    }
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

                    columnSpacing: 14
                    rowSpacing: 6

                    ToggleSetting {
                        id: notifRecommendations

                        settingKey: "interviewRecommendations"

                        icon: "\u{1F4C5}"

                        title: "Interview Recommendations"

                        description:
                            "Get personalized interview recommendations and tips."

                        value: true

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
                        id: notifFeedback

                        settingKey: "interviewFeedback"

                        icon: "\u{1F4AC}"

                        title: "Interview Feedback"

                        description:
                            "Notify when interview feedback is ready."

                        value: true

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
                        id: notifWeekly

                        settingKey: "weeklySummary"

                        icon: "\u{1F4C8}"

                        title: "Weekly Performance Summary"

                        description:
                            "Receive weekly performance reports."

                        value: false

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

                    columnSpacing: 14
                    rowSpacing: 12


                    DropdownSetting {
                        id: privacyVisibility

                        settingKey: "profileVisibility"

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
                    }


                    ToggleSetting {
                        id: privacyTracking

                        settingKey: "activityTracking"

                        icon: "\u{1F6E1}"

                        title: "Activity Tracking"

                        description:
                            "Allow tracking for better insights."

                        value: true

                        iconBg: "#DCFCE7"
                        iconColor: "#16A34A"

                        onToggled: function(checked) {
                            App?.notify(
                                "Activity Tracking "
                                + (checked ? "enabled" : "disabled")
                            )
                        }
                    }


                    ToggleSetting {
                        id: privacyData

                        settingKey: "dataUsage"

                        icon: "\u{1F4CA}"

                        title: "Data Usage"

                        description:
                            "Allow anonymous usage data."

                        value: true

                        iconBg: "#FFF7ED"
                        iconColor: "#EA580C"

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

                        onActivated: {
                            confirmBox.openConfirm(
                                "Download My Data",
                                "Download all your data and reports?",
                                "Download",
                                function() {
                                    App?.downloadData()
                                }
                            )
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

                    columnSpacing: 14
                    rowSpacing: 12


                    DropdownSetting {
                        id: appearanceTheme

                        settingKey: "theme"

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

                        onPick: function(index) {
                            if (index === 1) {
                                App?.notify(
                                    "Dark theme is coming soon in the demo."
                                )
                            }
                        }
                    }


                    DropdownSetting {
                        id: appearanceLanguage

                        settingKey: "language"

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
                    }


                    DropdownSetting {
                        id: appearanceDate

                        settingKey: "dateFormat"

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
                    }


                    DropdownSetting {
                        id: appearanceTime

                        settingKey: "timeFormat"

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

                    columnSpacing: 14
                    rowSpacing: 6


                    LinkSetting {
                        icon: "\u{1F310}"

                        title: "Help Center"

                        description:
                            "Get help and support."

                        iconBg: "#F3E8FF"
                        iconColor: "#7C3AED"

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

                        onActivated: {
                            App?.notify(
                                "Opening Contact Support."
                            )
                        }
                    }
                }
            }


            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 12
            }


            RowLayout {
                Layout.alignment: Qt.AlignHCenter

                spacing: 6

                Text {
                    text: "SynaptiRole AI"

                    font.family: Theme.fontName
                    font.pixelSize: 11
                    font.weight: Font.DemiBold

                    color: Theme.muted
                }

                Text {
                    text: "\u2022"

                    font.family: Theme.fontName
                    font.pixelSize: 11

                    color: Theme.faint
                }

                Text {
                    text: "Version 1.0.0"

                    font.family: Theme.fontName
                    font.pixelSize: 11

                    color: Theme.faint
                }
            }


            // Bottom spacing
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 10
            }
        }
    }


    // ============================================================
    // CONFIRMATION DIALOG
    // ============================================================

    Dialog {
        id: confirmBox

        modal: true

        anchors.centerIn: parent

        width: 400
        padding: 20

        property string boxTitle: "Confirm"
        property string boxText: ""
        property string confirmLabel: "Confirm"
        property var confirmAction: null

        background: Rectangle {
            radius: 14

            color: "#FFFFFF"

            border.color: "#E7EAF2"
            border.width: 1
        }

        contentItem: ColumnLayout {
            spacing: 16

            RowLayout {
                Layout.fillWidth: true

                spacing: 12

                Rectangle {
                    Layout.preferredWidth: 40
                    Layout.preferredHeight: 40

                    radius: 11

                    color: "#FDF3CC"

                    Text {
                        anchors.centerIn: parent

                        text: "\u26A0\uFE0F"

                        font.pixelSize: 18
                    }
                }

                Text {
                    text: confirmBox.boxTitle

                    font.family: Theme.fontName
                    font.pixelSize: 15
                    font.weight: Font.Bold

                    color: Theme.text
                }
            }

            Text {
                Layout.fillWidth: true

                text: confirmBox.boxText

                font.family: Theme.fontName
                font.pixelSize: 12

                color: Theme.muted

                wrapMode: Text.WordWrap
            }

            RowLayout {
                Layout.fillWidth: true

                Layout.topMargin: 4

                spacing: 10

                Item {
                    Layout.fillWidth: true
                }

                Button {
                    id: cancelBnt

                    text: "Cancel"

                    Layout.preferredHeight: 36

                    implicitWidth: 92

                    contentItem: Text {
                        text: cancelBnt.text

                        font.family: Theme.fontName
                        font.pixelSize: 12
                        font.weight: Font.DemiBold

                        color: Theme.text

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    background: Rectangle {
                        radius: 9

                        color: cancelBnt.hovered ? "#ECEEF4" : "#F3F4F8"
                    }

                    onClicked: confirmBox.close()
                }

                Button {
                    id: confirmBnt

                    text: confirmBox.confirmLabel

                    Layout.preferredHeight: 36

                    implicitWidth: 92

                    contentItem: Text {
                        text: confirmBnt.text

                        font.family: Theme.fontName
                        font.pixelSize: 12
                        font.weight: Font.Bold

                        color: "#FFFFFF"

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    background: Rectangle {
                        radius: 9

                        color: confirmBnt.hovered
                               ? "#6D28D9"
                               : Theme.primary
                    }

                    onClicked: {
                        if (confirmBox.confirmAction)
                            confirmBox.confirmAction()
                        confirmBox.close()
                    }
                }
            }
        }

        onClosed: {
            confirmBox.confirmAction = null
        }

        function openConfirm(titleText, bodyText, labelText, action) {
            confirmBox.boxTitle = titleText
            confirmBox.boxText = bodyText
            confirmBox.confirmLabel = labelText
            confirmBox.confirmAction = action
            confirmBox.open()
        }
    }
}