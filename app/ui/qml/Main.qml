import QtQuick
import QtQuick.Controls
import "."
import "components"

ApplicationWindow {
    id: window
    width: 1440
    height: 900
    minimumWidth: 1180
    minimumHeight: 760
    visible: true
    title: "SynaptiRole AI — AI-Powered Interview Copilot"
    color: Theme.bg
    font.family: Theme.fontName
    x: (Screen.width - width) / 2
    y: (Screen.height - height) / 2

    StackView {
        id: rootStack
        anchors.fill: parent
        initialItem: loginComp
    }

    Component {
        id: loginComp
        Login {}
    }

    Component {
        id: shellComp
        Shell {}
    }

    Connections {
        target: App
        function onLoginSuccess() {
            rootStack.replace(shellComp)
        }
        function onLogoutRequested() {
            if (App) {
                App.currentPage = "dashboard"
            }
            rootStack.replace(loginComp)
        }
        function onErrorOccurred(title, message) {
            errorDialog.show(title, message, "")
        }
    }

    Rectangle {
        id: toast
        visible: opacity > 0.01
        opacity: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 34
        width: toastText.implicitWidth + 44
        height: 46
        radius: 12
        color: "#0f172a"
        z: 999

        Row {
            anchors.centerIn: parent
            spacing: 10
            Text { text: "\u{2728}"; font.pixelSize: 14; anchors.verticalCenter: parent.verticalCenter }
            Text {
                id: toastText
                text: ""
                color: "#ffffff"
                font.family: Theme.fontName
                font.pixelSize: 13
                font.weight: Font.Medium
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Behavior on opacity { NumberAnimation { duration: 220 } }
    }

    Timer {
        id: toastTimer
        interval: 2600
        onTriggered: toast.opacity = 0
    }

    Connections {
        target: App
        function onToastMessage(message) {
            toastText.text = message
            toast.opacity = 1
            toastTimer.restart()
        }
    }

    ErrorDialog {
        id: errorDialog
        anchors.centerIn: parent
    }
}
