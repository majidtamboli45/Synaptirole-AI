import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

Rectangle {
    color: Theme.bg

    RowLayout {
        anchors.fill: parent
        spacing: 0

        SideBar {
            Layout.preferredWidth: 244
            Layout.fillHeight: true
            onNavigate: function(page) { App?.navigate(page) }
        }

        StackLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: {
                switch (App?.currentPage) {
                case "dashboard": return 0
                case "resumejd": return 1
                case "skills": return 2
                case "interview": return 3
                case "reports": return 4
                case "profile": return 5
                case "settings": return 6
                case "account": return 7
                case "actualinterview": return 8
                default: return 0
                }
            }

            Dashboard {}
            ResumeJD {}
            SkillAnalysis {}
            Interview {
                onStartMockInterview: App?.navigate("actualinterview")
            }
            PerformanceReport {}
            Profile {}
            SettingsPage {}
            AccountSettings {}
            ActualInterview {
                onEndInterview: App?.navigate("interview")
            }
        }
    }
}
