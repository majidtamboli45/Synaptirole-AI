import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

Item {
    id: root
    objectName: "skillAnalysisPage"

    property var analysisData: null
    property int requiredMatchPct: 0
    property int preferredMatchPct: 0
    property int requiredCount: 0
    property int preferredCount: 0
    property string statsJson: "{}"

    function skillData() {
        try {
            return JSON.parse(App.skillAnalysisJson)
        } catch (e) {
            return null
        }
    }

    function refresh() {
        matchedModel.clear()
        partialModel.clear()
        gapModel.clear()
        priorityModel.clear()

        var d = skillData()
        root.analysisData = d

        root.requiredMatchPct = 0
        root.preferredMatchPct = 0
        root.requiredCount = 0
        root.preferredCount = 0
        root.statsJson = "{}"
        if (!d) return

        root.requiredMatchPct = Math.round(d.required_match_pct || 0)
        root.preferredMatchPct = Math.round(d.preferred_match_pct || 0)
        root.requiredCount = d.required_count || 0
        root.preferredCount = d.preferred_count || 0

        var list = d.priority_rankings || []
        for (var i = 0; i < list.length; i++) {
            var r = list[i]
            var entry = {
                skill: r.skill,
                type: r.type,
                status: r.status,
                priority: r.priority || "",
                similarity: r.similarity
            }
            priorityModel.append(entry)
            if (r.status === "matched") matchedModel.append(entry)
            else if (r.status === "partial") partialModel.append(entry)
            else gapModel.append(entry)
        }
        root.statsJson = JSON.stringify(root.stats())
    }

    function constellationNodes() {
        var out = []
        var n = priorityModel.count
        if (n === 0) return out
        var radius = 0.62
        var codeMap = { "matched": 0, "partial": 1, "gap": 2 }
        for (var i = 0; i < n; i++) {
            var e = priorityModel.get(i)
            var angle = -Math.PI / 2 + (i * 2 * Math.PI) / n
            var code = codeMap[e.status]
            if (code === undefined) code = 2
            out.push({
                x: Math.cos(angle) * radius,
                y: Math.sin(angle) * radius,
                name: e.skill || "",
                score: Math.round((e.similarity || 0) * 100),
                status: code
            })
        }
        return out
    }

    function stats() {
        return {
            matched: matchedModel.count,
            partial: partialModel.count,
            gap: gapModel.count,
            priority: priorityModel.count,
            requiredMatchPct: root.requiredMatchPct,
            preferredMatchPct: root.preferredMatchPct,
            requiredCount: root.requiredCount,
            preferredCount: root.preferredCount,
            totalJdSkills: root.analysisData ? root.analysisData.total_jd_skills : 0,
            jobFitPct: root.analysisData ? root.analysisData.job_fit_pct : 0,
            matchedPct: root.analysisData ? root.analysisData.matched_pct : 0
        }
    }

    ListModel { id: matchedModel; objectName: "matchedModel" }
    ListModel { id: partialModel; objectName: "partialModel" }
    ListModel { id: gapModel; objectName: "gapModel" }
    ListModel { id: priorityModel; objectName: "priorityModel" }

    Connections {
        target: App
        function onSkillAnalysisChanged() { refresh() }
    }

    Component.onCompleted: {
        refresh()
        if (App?.documentsReady) App.refreshSkillAnalysis()
    }

    Item {
        id: emptyState
        anchors.fill: parent
        visible: !App.hasAnalysis

        Column {
            anchors.centerIn: parent
            spacing: 14
            width: Math.min(parent.width - 80, 640)

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "\u{1F6A7}"
                font.pixelSize: 44
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: App?.documentsReady === true
                    ? "Analyzing your skills\u2026"
                    : "No skill gap analysis yet"
                font.family: Theme.fontName
                font.pixelSize: 19
                font.weight: Font.Bold
                color: Theme.text
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                text: App?.documentsReady === true
                    ? "Computing the semantic match between your resume and the job description\u2026"
                    : "Upload a resume and job description to view your skill gap analysis."
                font.family: Theme.fontName
                font.pixelSize: 13
                color: Theme.muted
            }

            AppButton {
                anchors.horizontalCenter: parent.horizontalCenter
                visible: App?.documentsReady !== true
                text: "Go to Documents"
                onClicked: App?.navigate("resumejd")
            }
        }
    }

    Flickable {
        anchors.fill: parent
        visible: App.hasAnalysis
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
                        text: "Skill Gap Analysis"
                        font.family: Theme.fontName
                        font.pixelSize: 24
                        font.weight: Font.Bold
                        color: Theme.text
                    }
                }

                Item { Layout.fillWidth: true }

                Row {
                    spacing: 8
                    visible: App.analysisBusy
                    Rectangle {
                        width: 10; height: 10; radius: 5
                        color: Theme.primary
                        anchors.verticalCenter: parent.verticalCenter
                        SequentialAnimation on opacity {
                            loops: Animation.Infinite
                            NumberAnimation { to: 0.2; duration: 500 }
                            NumberAnimation { to: 1; duration: 500 }
                        }
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Refreshing\u2026"
                        font.family: Theme.fontName
                        font.pixelSize: 12
                        color: Theme.muted
                    }
                }

                AppButton {
                    kind: "secondary"
                    text: "Refresh"
                    onClicked: App.refreshSkillAnalysis()
                }

                NotificationBell { badgeCount: App.gapCount }

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
                            spacing: 16

                            ProgressRing {
                                value: root.analysisData ? Number(root.analysisData.job_fit_pct) : 0
                                size: 118
                                ringColor: Theme.primary
                                subLabel: "Job Fit"
                            }

                            ProgressRing {
                                value: root.analysisData ? Number(root.analysisData.matched_pct) : 0
                                size: 118
                                ringColor: Theme.green
                                subLabel: "Skills Matched"
                            }
                        }

                        Column {
                            Layout.fillWidth: true
                            spacing: 6

                            HBarRow {
                                width: parent.width
                                label: "Required skills matched (" + root.requiredCount + ")"
                                value: root.requiredMatchPct
                                barColor: Theme.primary
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 1
                            color: Theme.border
                        }

                        Column {
                            Layout.fillWidth: true
                            spacing: 8

                            Repeater {
                                model: [
                                    { c: "#22c55e", label: "Matched", v: matchedModel.count + " skills" },
                                    { c: "#f59e0b", label: "Partially Matched", v: partialModel.count + " skills" },
                                    { c: "#ef4444", label: "Skill Gaps", v: gapModel.count + " skills" },
                                    { c: Theme.primary, label: "Total JD Skills", v: (root.analysisData ? root.analysisData.total_jd_skills : 0) + " skills" }
                                ]
                                delegate: Row {
                                    width: parent.width
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
                                    Item { width: 1; height: 1; Layout.fillWidth: true }
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
                        }

                        Item { Layout.fillHeight: true }

                        Text {
                            Layout.fillWidth: true
                            text: topRecommendation()
                            wrapMode: Text.WordWrap
                            font.family: Theme.fontName
                            font.pixelSize: 12
                            color: Theme.muted
                        }
                    }
                }

                Card {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 360

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

                        Item {
                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            SkillConstellation {
                                id: skillConstellation
                                anchors.fill: parent
                                nodes: constellationNodes()
                                centerLabel: "Your Skills"
                            }

                            Text {
                                visible: priorityModel.count === 0
                                anchors.centerIn: parent
                                text: (root.analysisData && root.analysisData.total_jd_skills) ? "No rankable skills." : "No skills to rank yet."
                                font.family: Theme.fontName
                                font.pixelSize: 13
                                color: Theme.muted
                            }
                        }

                        Row {
                            spacing: 16
                            Layout.alignment: Qt.AlignHCenter

                            PriorityBadge { priority: "HIGH" }
                            PriorityBadge { priority: "MEDIUM" }
                            PriorityBadge { priority: "LOW" }
                            Text {
                                text: "Priority badges"
                                font.family: Theme.fontName
                                font.pixelSize: 11
                                color: Theme.muted
                                anchors.verticalCenter: parent.verticalCenter
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
                    Layout.fillHeight: true
                    Layout.preferredHeight: 320

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 20
                        spacing: 12

                        Text {
                            text: "Matched Skills (" + matchedModel.count + ")"
                            font.family: Theme.fontName
                            font.pixelSize: 14
                            font.weight: Font.Bold
                            color: Theme.text
                        }

                        Flickable {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            clip: true
                            boundsBehavior: Flickable.StopAtBounds
                            contentHeight: matchedCol.height
                            ScrollBar.vertical: ScrollBar { policy: ScrollBar.AsNeeded }

                            Column {
                                id: matchedCol
                                width: parent.width
                                spacing: 8

                                Repeater {
                                    model: matchedModel
                                    delegate: GapPriorityRow {
                                        width: parent.width
                                        skill: model.skill
                                        type: model.type
                                        status: model.status
                                        priority: model.priority
                                        similarity: model.similarity
                                        barPct: model.similarity * 100
                                    }
                                }

                                Text {
                                    visible: matchedModel.count === 0
                                    width: parent.width
                                    horizontalAlignment: Text.AlignHCenter
                                    text: "None"
                                    font.family: Theme.fontName
                                    font.pixelSize: 13
                                    color: Theme.faint
                                }
                            }
                        }
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 20

                    Card {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredHeight: 320

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 20
                            spacing: 12

                            Text {
                                text: "Partially Matched (" + partialModel.count + ")"
                                font.family: Theme.fontName
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                color: Theme.text
                            }

                            Flickable {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                clip: true
                                boundsBehavior: Flickable.StopAtBounds
                                contentHeight: partialCol.height
                                ScrollBar.vertical: ScrollBar { policy: ScrollBar.AsNeeded }

                                Column {
                                    id: partialCol
                                    width: parent.width
                                    spacing: 8

                                    Repeater {
                                        model: partialModel
                                        delegate: GapPriorityRow {
                                            width: parent.width
                                            skill: model.skill
                                            type: model.type
                                            status: model.status
                                            priority: model.priority
                                            similarity: model.similarity
                                            barPct: model.similarity * 100
                                        }
                                    }

                                    Text {
                                        visible: partialModel.count === 0
                                        width: parent.width
                                        horizontalAlignment: Text.AlignHCenter
                                        text: "None"
                                        font.family: Theme.fontName
                                        font.pixelSize: 13
                                        color: Theme.faint
                                    }
                                }
                            }
                        }
                    }

                    Card {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredHeight: 320

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 20
                            spacing: 12

                            Text {
                                text: "Skill Gaps (" + gapModel.count + ")"
                                font.family: Theme.fontName
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                color: Theme.text
                            }

                            Flickable {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                clip: true
                                boundsBehavior: Flickable.StopAtBounds
                                contentHeight: gapCol.height
                                ScrollBar.vertical: ScrollBar { policy: ScrollBar.AsNeeded }

                                Column {
                                    id: gapCol
                                    width: parent.width
                                    spacing: 8

                                    Repeater {
                                        model: gapModel
                                        delegate: GapPriorityRow {
                                            width: parent.width
                                            skill: model.skill
                                            type: model.type
                                            status: model.status
                                            priority: model.priority
                                            similarity: model.similarity
                                            barPct: model.similarity * 100
                                        }
                                    }

                                    Text {
                                        visible: gapModel.count === 0
                                        width: parent.width
                                        horizontalAlignment: Text.AlignHCenter
                                        text: "None"
                                        font.family: Theme.fontName
                                        font.pixelSize: 13
                                        color: Theme.faint
                                    }
                                }
                            }
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
                        text: "\u{1F50D} Recommended focus: " + focusSummary()
                        font.family: Theme.fontName
                        font.pixelSize: 13
                        font.weight: Font.Medium
                        color: Theme.primaryDark
                        wrapMode: Text.WordWrap
                        anchors.verticalCenter: parent.verticalCenter
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
        }
    }

    function topRecommendation() {
        var d = skillData()
        if (!d || !d.recommendations || d.recommendations.length === 0) return "Your skills closely match the job. Keep it up!"
        return d.recommendations[0]
    }

    function focusSummary() {
        var d = skillData()
        if (!d) return ""
        var high = "", med = "", low = ""
        for (var i = 0; i < d.priority_rankings.length; i++) {
            var r = d.priority_rankings[i]
            if (r.priority === "HIGH") high = (high ? high + ", " : "") + r.skill
            else if (r.priority === "MEDIUM") med = (med ? med + ", " : "") + r.skill
            else if (r.priority === "LOW") low = (low ? low + ", " : "") + r.skill
        }
        var out = []
        if (high) out.push("HIGH: " + high)
        if (med) out.push("MEDIUM: " + med)
        if (low) out.push("LOW: " + low)
        return out.length ? out.join(" \u00B7 ") : "Your skills fully cover the role."
    }
}