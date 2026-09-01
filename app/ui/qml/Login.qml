import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

Rectangle {
    id: root

    color: "#f5f6ff"

    // =========================================================
    // PROPERTIES
    // =========================================================

    property bool loading: false
    property bool showPassword: false
    property bool signupMode: false
    property bool showConfirmPassword: false
    property bool termsAccepted: false
    property string selectedRole: ""

    property var roleModel: [
        "Software Developer",
        "Data Scientist",
        "Machine Learning Engineer",
        "AI Engineer",
        "Frontend Developer",
        "Backend Developer",
        "DevOps Engineer",
        "Full Stack Developer",
        "Mobile Developer",
        "QA Engineer",
        "Product Manager",
        "Other"
    ]

    // =========================================================
    // PASSWORD VALIDATION
    // =========================================================

    function validatePassword(password) {
        if (password.length < 8)
            return "Password must be at least 8 characters."

        if (!/[A-Z]/.test(password))
            return "Password must contain at least 1 uppercase letter."

        if (!/[0-9]/.test(password))
            return "Password must contain at least 1 number."

        if (!/[!@#$%^&*(),.?":{}|<>]/.test(password))
            return "Password must contain at least 1 special character."

        return ""
    }

    // =========================================================
    // FORM RESET
    // =========================================================

    function resetSignupFields() {
        nameField.text = ""
        confirmPasswordField.text = ""
        emailField.text = ""
        passwordField.text = ""
        roleComboBox.currentIndex = -1

        root.selectedRole = ""
        root.termsAccepted = false
        root.showConfirmPassword = false

        errorLabel.visible = false
        errorLabel.text = ""
    }

    function switchMode() {
        console.log("[AUTH DEBUG] switchMode() called")
        try { console.trace() } catch (e) {}

        root.signupMode = !root.signupMode

        root.loading = false
        root.showPassword = false
        passwordField.text = ""
        confirmPasswordField.text = ""

        errorLabel.visible = false
        errorLabel.text = ""

        if (!root.signupMode) {
            resetSignupFields()
        }

        passwordField.forceActiveFocus()
    }

    // =========================================================
    // LOGIN / SIGNUP
    // =========================================================

    // =========================================================
    // VALIDATION ERROR
    // =========================================================

    function showValidationError(text) {
        errorLabel.text = text
        errorLabel.visible = true
    }

    // =========================================================
    // APP AVAILABILITY CHECK
    // =========================================================

    function appAvailable() {
        if (typeof App === "undefined" || App === null) {
            root.loading = false
            showValidationError(
                "Application controller is not available. Please restart the application."
            )
            console.error("[AUTH] AppController is not available in QML.")
            return false
        }
        return true
    }

    function doLogin() {

        console.log("[AUTH] doLogin() called")

        errorLabel.visible = false
        errorLabel.text = ""

        var email = emailField.text.trim()
        var password = passwordField.text

        // -----------------------------------------------------
        // EMAIL
        // -----------------------------------------------------

        if (email === "") {
            errorLabel.text = "Please enter your email address."
            errorLabel.visible = true
            return
        }

        if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
            errorLabel.text = "Please enter a valid email address."
            errorLabel.visible = true
            return
        }

        // -----------------------------------------------------
        // SIGNUP VALIDATION
        // -----------------------------------------------------

        if (root.signupMode) {

            console.log("[AUTH DEBUG] ENTERED SIGNUP BRANCH")
            console.log("[AUTH DEBUG] signup name =", nameField.text.trim())
            console.log("[AUTH DEBUG] signup role =", root.selectedRole)
            console.log(
                "[AUTH DEBUG] roleComboBox.currentIndex =",
                roleComboBox.currentIndex
            )
            console.log(
                "[AUTH DEBUG] roleComboBox.currentText =",
                roleComboBox.currentText
            )
            console.log(
                "[AUTH DEBUG] termsAccepted =",
                root.termsAccepted
            )

            if (nameField.text.trim() === "") {
                console.log("[AUTH DEBUG] FAIL: name empty")
                errorLabel.text = "Please enter your full name."
                errorLabel.visible = true
                return
            }

            console.log("[AUTH DEBUG] Signup password validation")

            var pwdError = validatePassword(password)

            console.log(
                "[AUTH DEBUG] validatePassword result =",
                JSON.stringify(pwdError)
            )

            if (pwdError !== "") {
                console.log("[AUTH DEBUG] FAIL: password =>", pwdError)
                errorLabel.text = pwdError
                errorLabel.visible = true
                return
            }

            console.log("[AUTH DEBUG] Signup confirm password")

            if (confirmPasswordField.text === "") {
                console.log("[AUTH DEBUG] FAIL: confirm empty")
                errorLabel.text = "Please confirm your password."
                errorLabel.visible = true
                return
            }

            if (password !== confirmPasswordField.text) {
                console.log("[AUTH DEBUG] FAIL: passwords mismatch")
                errorLabel.text = "Passwords do not match."
                errorLabel.visible = true
                return
            }

            console.log("[AUTH DEBUG] Signup role check")

            if (root.selectedRole === "") {
                console.log("[AUTH DEBUG] FAIL: role empty")
                errorLabel.text = "Please select your role."
                errorLabel.visible = true
                return
            }

            console.log("[AUTH DEBUG] Signup terms check")

            if (!root.termsAccepted) {
                console.log("[AUTH DEBUG] FAIL: terms not accepted")
                errorLabel.text =
                        "Please agree to the Terms of Service and Privacy Policy."
                errorLabel.visible = true
                return
            }

            console.log("[AUTH DEBUG] Signup validation passed")
            console.log("[AUTH] Signup validation passed")

        } else {

            // -------------------------------------------------
            // LOGIN VALIDATION
            // -------------------------------------------------

            if (password === "") {
                errorLabel.text = "Please enter your password."
                errorLabel.visible = true
                return
            }
        }

        // -----------------------------------------------------
        // APP AVAILABILITY
        // -----------------------------------------------------

        if (!appAvailable()) {
            return
        }

        // -----------------------------------------------------
        // START LOADING
        // -----------------------------------------------------

        root.loading = true

        // -----------------------------------------------------
        // EXECUTE SIGNUP / LOGIN DIRECTLY
        // -----------------------------------------------------

        if (root.signupMode) {

            console.log("[AUTH] Calling App.signup()")
            console.log(
                "[AUTH DEBUG] Signup password length =",
                passwordField.text.length
            )

            App.signup(
                nameField.text.trim(),
                emailField.text.trim(),
                passwordField.text,
                false,
                root.selectedRole
            )

            root.loading = false

        } else {

            console.log("[AUTH] Calling App.login()")
            console.log(
                "[AUTH DEBUG] Login password length =",
                passwordField.text.length
            )

            App.login(
                emailField.text.trim(),
                passwordField.text,
                rememberCheck.checked
            )

            root.loading = false
        }
    }

    // =========================================================
    // MAIN APPLICATION FRAME
    // =========================================================

    Rectangle {
        id: appFrame

        anchors.fill: parent
        anchors.margins: 20

        radius: 24

        color: "#ffffff"

        border.color: "#dddff0"
        border.width: 1

        clip: true

        // =====================================================
        // LEFT PANEL
        // =====================================================

        Rectangle {
            id: leftPanel

            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            width: parent.width * 0.60

            color: "#f4f3ff"

            clip: true

            // -------------------------------------------------
            // BACKGROUND CIRCLES
            // -------------------------------------------------

            Rectangle {
                width: 520
                height: 520

                radius: width / 2

                x: -270
                y: -260

                color: "#e8e5ff"
                opacity: 0.55
            }

            Rectangle {
                width: 480
                height: 480

                radius: width / 2

                x: leftPanel.width - 180
                y: -190

                color: "#e9e7ff"
                opacity: 0.65
            }

            Rectangle {
                width: 430
                height: 430

                radius: width / 2

                x: leftPanel.width - 150
                y: leftPanel.height - 170

                color: "#e6e3ff"
                opacity: 0.55
            }

            // -------------------------------------------------
            // DOT PATTERN
            // -------------------------------------------------

            Grid {
                x: 28
                y: 28

                columns: 8
                spacing: 11

                Repeater {
                    model: 48

                    Rectangle {
                        width: 3
                        height: 3

                        radius: 2

                        color: "#d0cde8"
                        opacity: 0.55
                    }
                }
            }

            // =================================================
            // LEFT CONTENT
            // =================================================

            Item {
                id: leftContent

                anchors.fill: parent

                anchors.leftMargin: 76
                anchors.rightMargin: 50
                anchors.topMargin: 54
                anchors.bottomMargin: 48

                // =============================================
                // BRAND
                // =============================================

                Row {
                    id: brandRow

                    anchors.left: parent.left
                    anchors.top: parent.top

                    spacing: 14

                    Item {
                        width: 58
                        height: 72

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top

                            text: "♧"

                            font.pixelSize: 40
                            font.weight: Font.Bold

                            color: "#4732cf"
                        }

                        Rectangle {
                            width: 38
                            height: 13

                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: 34

                            radius: 7

                            color: "transparent"

                            border.color: "#4732cf"
                            border.width: 4

                            Rectangle {
                                width: 12
                                height: 4

                                anchors.left: parent.left
                                anchors.verticalCenter: parent.verticalCenter

                                x: -5

                                color: "#4732cf"
                            }

                            Rectangle {
                                width: 12
                                height: 4

                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter

                                x: 5

                                color: "#4732cf"
                            }
                        }

                        Rectangle {
                            width: 10
                            height: 20

                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: 48

                            color: "#6246e8"

                            rotation: 180

                            clip: true

                            Rectangle {
                                width: 20
                                height: 20

                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: parent.top

                                color: "#6246e8"

                                rotation: 45
                            }
                        }
                    }

                    Column {
                        spacing: 2

                        anchors.verticalCenter: brandRow.verticalCenter

                        Row {
                            spacing: 0

                            Text {
                                text: "Synapti"

                                font.family: Theme.fontName
                                font.pixelSize: 29
                                font.weight: Font.Bold

                                color: "#10205c"
                            }

                            Text {
                                text: "Role"

                                font.family: Theme.fontName
                                font.pixelSize: 29
                                font.weight: Font.Bold

                                color: "#6045e8"
                            }
                        }

                        Text {
                            text: "AI-Powered Interview Copilot"

                            font.family: Theme.fontName
                            font.pixelSize: 12

                            color: "#555d78"
                        }
                    }
                }

                // =============================================
                // HERO TEXT
                // =============================================

                Column {
                    id: heroColumn

                    anchors.left: parent.left
                    anchors.top: brandRow.bottom

                    anchors.topMargin: 42

                    width: Math.min(parent.width * 0.66, 500)

                    spacing: 14

                    Text {
                        width: parent.width

                        textFormat: Text.RichText

                        text:
                            "Your AI Copilot for<br>" +
                            "<font color=\"#6045e8\">Smarter Interviews</font>"

                        font.family: Theme.fontName
                        font.pixelSize: 40
                        font.weight: Font.Bold

                        color: "#0c183d"

                        lineHeight: 1.05
                    }

                    Text {
                        width: parent.width

                        text:
                            "Practice smarter. Get real-time feedback.<br>" +
                            "Improve continuously. Land your dream role."

                        font.family: Theme.fontName
                        font.pixelSize: 14

                        color: "#535c77"

                        lineHeight: 1.4
                    }
                }

                // =============================================
                // FEATURES
                // =============================================

                Column {
                    id: features

                    anchors.left: parent.left
                    anchors.top: heroColumn.bottom

                    anchors.topMargin: 26

                    width: Math.min(parent.width * 0.72, 500)

                    spacing: 13

                    Repeater {
                        model: [
                            {
                                title: "AI-Powered Interviews",
                                description:
                                    "Real-time adaptive Q&A tailored to your role.",
                                icon: "▤",
                                iconColor: "#7049e8"
                            },
                            {
                                title: "Multimodal Analysis",
                                description:
                                    "Voice, video & text analysis for holistic evaluation.",
                                icon: "▮",
                                iconColor: "#35b899"
                            },
                            {
                                title: "Detailed Feedback",
                                description:
                                    "Actionable insights to improve your performance.",
                                icon: "↗",
                                iconColor: "#f2a03b"
                            },
                            {
                                title: "Track & Improve",
                                description:
                                    "Monitor progress and close skill gaps.",
                                icon: "◎",
                                iconColor: "#367fe1"
                            }
                        ]

                        delegate: Row {
                            width: features.width
                            height: 54

                            spacing: 14

                            Rectangle {
                                width: 44
                                height: 44

                                anchors.verticalCenter: parent.verticalCenter

                                radius: 11

                                color: modelData.iconColor

                                Text {
                                    anchors.centerIn: parent

                                    text: modelData.icon

                                    font.pixelSize: 20
                                    font.weight: Font.Bold

                                    color: "#ffffff"
                                }
                            }

                            Column {
                                anchors.verticalCenter: parent.verticalCenter

                                spacing: 2

                                width: parent.width - 60

                                Text {
                                    width: parent.width

                                    text: modelData.title

                                    font.family: Theme.fontName
                                    font.pixelSize: 13
                                    font.weight: Font.DemiBold

                                    color: "#18213d"
                                }

                                Text {
                                    width: parent.width

                                    text: modelData.description

                                    font.family: Theme.fontName
                                    font.pixelSize: 11

                                    color: "#68728b"

                                    elide: Text.ElideRight
                                }
                            }
                        }
                    }
                }

                // =============================================
                // ILLUSTRATION
                // =============================================

                Item {
                    id: illustration

                    anchors.right: parent.right
                    anchors.top: heroColumn.bottom

                    anchors.topMargin: 52

                    width: Math.min(parent.width * 0.48, 390)
                    height: 280

                    Rectangle {
                        width: 55
                        height: 55

                        x: 105
                        y: 0

                        radius: 15

                        gradient: Gradient {
                            GradientStop {
                                position: 0
                                color: "#9272ff"
                            }

                            GradientStop {
                                position: 1
                                color: "#6246e8"
                            }
                        }

                        Text {
                            anchors.centerIn: parent

                            text: "•••"

                            font.pixelSize: 19
                            font.weight: Font.Bold

                            color: "#ffffff"
                        }
                    }

                    Rectangle {
                        width: 48
                        height: 48

                        x: 240
                        y: 62

                        radius: 14

                        color: "#3ab99a"

                        Text {
                            anchors.centerIn: parent

                            text: "♩"

                            font.pixelSize: 24
                            font.weight: Font.Bold

                            color: "#ffffff"
                        }
                    }

                    Rectangle {
                        width: 48
                        height: 48

                        x: 295
                        y: 110

                        radius: 14

                        color: "#f2a039"

                        Text {
                            anchors.centerIn: parent

                            text: "■"

                            font.pixelSize: 18

                            color: "#ffffff"
                        }
                    }

                    // Resume card
                    Rectangle {
                        width: 88
                        height: 115

                        x: 5
                        y: 78

                        radius: 10

                        rotation: -7

                        color: "#ffffff"

                        border.color: "#deddeb"
                        border.width: 1

                        Text {
                            anchors.left: parent.left
                            anchors.top: parent.top

                            anchors.leftMargin: 12
                            anchors.topMargin: 12

                            text: "RESUME"

                            font.family: Theme.fontName
                            font.pixelSize: 8
                            font.weight: Font.Bold

                            color: "#4b3bd0"
                        }

                        Rectangle {
                            width: 25
                            height: 25

                            x: 12
                            y: 38

                            radius: 5

                            color: "#e7e5ff"
                        }

                        Repeater {
                            model: 4

                            Rectangle {
                                width: 43
                                height: 4

                                radius: 2

                                x: 34
                                y: 42 + index * 13

                                color: "#d9dbe8"
                            }
                        }
                    }

                    // Laptop
                    Rectangle {
                        id: laptopScreen

                        width: 220
                        height: 137

                        x: 92
                        y: 70

                        radius: 12

                        rotation: -4

                        color: "#122866"

                        border.color: "#8594e3"
                        border.width: 2

                        Rectangle {
                            anchors.fill: parent
                            anchors.margins: 10

                            radius: 7

                            color: "#203a80"

                            Text {
                                anchors.left: parent.left
                                anchors.top: parent.top

                                anchors.leftMargin: 12
                                anchors.topMargin: 11

                                text: "Interview"

                                font.family: Theme.fontName
                                font.pixelSize: 8

                                color: "#bfc9ff"
                            }

                            Rectangle {
                                width: 46
                                height: 46

                                anchors.right: parent.right
                                anchors.top: parent.top

                                anchors.rightMargin: 12
                                anchors.topMargin: 22

                                radius: 23

                                color: "#3155a8"

                                border.color: "#788bea"
                                border.width: 2

                                Text {
                                    anchors.centerIn: parent

                                    text: "75%"

                                    font.family: Theme.fontName
                                    font.pixelSize: 14
                                    font.weight: Font.Bold

                                    color: "#ffffff"
                                }
                            }

                            Rectangle {
                                width: 72
                                height: 4

                                anchors.left: parent.left
                                anchors.bottom: parent.bottom

                                anchors.leftMargin: 12
                                anchors.bottomMargin: 17

                                radius: 2

                                color: "#7560ee"
                            }

                            Rectangle {
                                width: 52
                                height: 4

                                anchors.left: parent.left
                                anchors.bottom: parent.bottom

                                anchors.leftMargin: 12
                                anchors.bottomMargin: 28

                                radius: 2

                                color: "#526eaf"
                            }
                        }
                    }

                    // Laptop base
                    Rectangle {
                        width: 255
                        height: 18

                        x: 70
                        y: 204

                        radius: 9

                        rotation: -4

                        color: "#c6c8e5"

                        Rectangle {
                            width: 68
                            height: 4

                            anchors.centerIn: parent

                            radius: 2

                            color: "#aeb2d5"
                        }
                    }

                    // JD card
                    Rectangle {
                        width: 76
                        height: 105

                        x: 295
                        y: 108

                        radius: 10

                        rotation: 6

                        color: "#ffffff"

                        border.color: "#deddeb"
                        border.width: 1

                        Text {
                            anchors.centerIn: parent

                            text: "JD"

                            font.family: Theme.fontName
                            font.pixelSize: 23
                            font.weight: Font.Bold

                            color: "#4d3dd0"
                        }
                    }

                    // Coffee
                    Rectangle {
                        width: 72
                        height: 58

                        x: 72
                        y: 218

                        radius: 12

                        color: "#ffffff"

                        border.color: "#d8d8e7"
                        border.width: 1

                        Text {
                            anchors.centerIn: parent

                            text: "☕"

                            font.pixelSize: 32
                        }
                    }

                    // Bottom document
                    Rectangle {
                        width: 118
                        height: 67

                        x: 230
                        y: 218

                        radius: 7

                        rotation: -8

                        color: "#ffffff"

                        border.color: "#d7d8e7"
                        border.width: 1

                        Rectangle {
                            width: 78
                            height: 3

                            anchors.centerIn: parent

                            color: "#c9cbe1"
                        }

                        Rectangle {
                            width: 42
                            height: 3

                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top

                            anchors.topMargin: 25

                            color: "#d7d8e8"
                        }

                        Rectangle {
                            width: 7
                            height: 47

                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter

                            anchors.rightMargin: 17

                            radius: 3

                            rotation: 18

                            color: "#2b3975"
                        }
                    }
                }

                // =============================================
                // TRUST CARD
                // =============================================

                Rectangle {
                    id: trustCard

                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom

                    height: 76

                    radius: 16

                    color: "#ffffff"

                    border.color: "#e1e1ed"
                    border.width: 1

                    Row {
                        anchors.fill: parent

                        anchors.leftMargin: 22
                        anchors.rightMargin: 22

                        spacing: 20

                        Row {
                            width: (parent.width - 20) / 2
                            height: parent.height

                            spacing: 12

                            Rectangle {
                                width: 40
                                height: 40

                                anchors.verticalCenter: parent.verticalCenter

                                radius: 11

                                color: "#f0eeff"

                                Text {
                                    anchors.centerIn: parent

                                    text: "✓"

                                    font.pixelSize: 20
                                    font.weight: Font.Bold

                                    color: "#5543d2"
                                }
                            }

                            Column {
                                anchors.verticalCenter: parent.verticalCenter

                                spacing: 3

                                Text {
                                    text: "Your data is secure with us"

                                    font.family: Theme.fontName
                                    font.pixelSize: 11
                                    font.weight: Font.DemiBold

                                    color: "#18213d"
                                }

                                Text {
                                    text: "We use industry-standard encryption"

                                    font.family: Theme.fontName
                                    font.pixelSize: 10

                                    color: "#71798e"
                                }

                                Text {
                                    text: "to protect your information."

                                    font.family: Theme.fontName
                                    font.pixelSize: 10

                                    color: "#71798e"
                                }
                            }
                        }

                        Rectangle {
                            width: 1
                            height: 42

                            anchors.verticalCenter: parent.verticalCenter

                            color: "#e2e2eb"
                        }

                        Row {
                            width: (parent.width - 20) / 2
                            height: parent.height

                            spacing: 12

                            Rectangle {
                                width: 40
                                height: 40

                                anchors.verticalCenter: parent.verticalCenter

                                radius: 11

                                color: "#f0eeff"

                                Text {
                                    anchors.centerIn: parent

                                    text: "♙"

                                    font.pixelSize: 20

                                    color: "#5543d2"
                                }
                            }

                            Column {
                                anchors.verticalCenter: parent.verticalCenter

                                spacing: 3

                                Text {
                                    text: "Trusted by Aspirants"

                                    font.family: Theme.fontName
                                    font.pixelSize: 11
                                    font.weight: Font.DemiBold

                                    color: "#18213d"
                                }

                                Text {
                                    text: "Join thousands of users preparing"

                                    font.family: Theme.fontName
                                    font.pixelSize: 10

                                    color: "#71798e"
                                }

                                Text {
                                    text: "smarter every day."

                                    font.family: Theme.fontName
                                    font.pixelSize: 10

                                    color: "#71798e"
                                }
                            }
                        }
                    }
                }
            }
        }

        // =====================================================
        // RIGHT PANEL
        // =====================================================

        Rectangle {
            id: rightPanel

            anchors.left: leftPanel.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            color: "#f8f9ff"

            clip: true

            // -------------------------------------------------
            // BACKGROUND CIRCLE
            // -------------------------------------------------

            Rectangle {
                width: 320
                height: 320

                radius: 160

                x: parent.width - 100
                y: -100

                color: "#f0efff"
                opacity: 0.75
            }

            // =================================================
            // TOP ACCOUNT SWITCH
            // =================================================

            Row {
                id: topSwitch

                anchors.right: parent.right
                anchors.top: parent.top

                anchors.rightMargin: 42
                anchors.topMargin: 34

                spacing: 6

                z: 20

                Text {
                    text: root.signupMode
                          ? "Already have an account?"
                          : "Don't have an account?"

                    font.family: Theme.fontName
                    font.pixelSize: 12

                    color: "#646b80"
                }

                Text {
                    text: root.signupMode
                          ? "Login"
                          : "Sign up"

                    font.family: Theme.fontName
                    font.pixelSize: 12
                    font.weight: Font.DemiBold

                    color: "#6246e8"

                    MouseArea {
                        anchors.fill: parent

                        anchors.margins: -8

                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            root.switchMode()
                        }
                    }
                }
            }

            // =================================================
            // FORM SCROLL VIEW
            // =================================================

            ScrollView {
                id: formScrollView

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topSwitch.bottom
                anchors.bottom: parent.bottom

                anchors.leftMargin: 24
                anchors.rightMargin: 24
                anchors.topMargin: 18
                anchors.bottomMargin: 18

                clip: true

                ScrollBar.vertical.policy: ScrollBar.AsNeeded
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

                contentWidth: availableWidth

                // =================================================
                // CARD CONTAINER
                // =================================================

                Column {
                    id: cardContainer

                    width: formScrollView.availableWidth

                    spacing: 0

                    // -------------------------------------------------
                    // TOP SPACING
                    // -------------------------------------------------

                    Item {
                        width: 1
                        height: 8
                    }

                    // =================================================
                    // LOGIN CARD
                    // =================================================

                    Rectangle {
                        id: loginCard

                        width: parent.width

                        height: formColumn.implicitHeight + 76

                        radius: 20

                        color: "#ffffff"

                        border.color: "#e2e2eb"
                        border.width: 1

                        // -------------------------------------------------
                        // CARD SHADOW
                        // -------------------------------------------------

                        Rectangle {
                            anchors.fill: parent

                            anchors.margins: -7

                            z: -1

                            radius: parent.radius + 7

                            color: "#dfe1f0"

                            opacity: 0.30
                        }

                        // =================================================
                        // FORM CONTENT
                        // =================================================

                        Column {
                            id: formColumn

                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top

                            anchors.leftMargin: 38
                            anchors.rightMargin: 38
                            anchors.topMargin: 42

                            spacing: 0

                            // =================================================
                            // HEADER
                            // =================================================

                            Column {
                                width: parent.width

                                spacing: 8

                                Text {
                                    width: parent.width

                                    horizontalAlignment: Text.AlignHCenter

                                    text: root.signupMode
                                          ? "Create Your Account 👋"
                                          : "Welcome Back! 👋"

                                    font.family: Theme.fontName
                                    font.pixelSize: 25
                                    font.weight: Font.Bold

                                    color: "#101a3c"
                                }

                                Text {
                                    width: parent.width

                                    horizontalAlignment: Text.AlignHCenter

                                    wrapMode: Text.WordWrap

                                    text: root.signupMode
                                          ? "Join SynaptiRole and start your journey towards your dream role."
                                          : "Login to continue your interview journey"

                                    font.family: Theme.fontName
                                    font.pixelSize: 13

                                    color: "#626a81"
                                }
                            }

                            // =================================================
                            // HEADER GAP
                            // =================================================

                            Item {
                                width: 1
                                height: root.signupMode ? 28 : 38
                            }

                            // =================================================
                            // NAME FIELD - SIGNUP ONLY
                            // =================================================

                            Column {
                                id: nameSection

                                width: parent.width

                                spacing: 8

                                visible: root.signupMode

                                Text {
                                    text: "Full Name"

                                    font.family: Theme.fontName
                                    font.pixelSize: 13
                                    font.weight: Font.DemiBold

                                    color: "#1d2539"
                                }

                                Rectangle {
                                    width: parent.width
                                    height: 54

                                    radius: 8

                                    color: "#ffffff"

                                    border.color:
                                        nameField.activeFocus
                                        ? "#6246e8"
                                        : "#d8dbe5"

                                    border.width:
                                        nameField.activeFocus
                                        ? 2
                                        : 1

                                    Text {
                                        anchors.left: parent.left
                                        anchors.verticalCenter: parent.verticalCenter

                                        anchors.leftMargin: 16

                                        text: "♙"

                                        font.pixelSize: 19

                                        color: "#5f687d"
                                    }

                                    TextInput {
                                        id: nameField

                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom

                                        anchors.leftMargin: 50
                                        anchors.rightMargin: 14

                                        verticalAlignment: TextInput.AlignVCenter

                                        font.family: Theme.fontName
                                        font.pixelSize: 13

                                        color: "#101828"

                                        clip: true

                                        selectByMouse: true

                                        Text {
                                            anchors.fill: parent

                                            verticalAlignment: Text.AlignVCenter

                                            text: "Enter your full name"

                                            font.family: Theme.fontName
                                            font.pixelSize: 13

                                            color: "#9aa1b2"

                                            visible: nameField.text.length === 0
                                        }
                                    }
                                }
                            }

                            Item {
                                width: 1
                                height: root.signupMode ? 20 : 0

                                visible: root.signupMode
                            }

                            // =================================================
                            // EMAIL
                            // =================================================

                            Column {
                                id: emailSection

                                width: parent.width

                                spacing: 8

                                Text {
                                    text: "Email Address"

                                    font.family: Theme.fontName
                                    font.pixelSize: 13
                                    font.weight: Font.DemiBold

                                    color: "#1d2539"
                                }

                                Rectangle {
                                    width: parent.width
                                    height: 54

                                    radius: 8

                                    color: "#ffffff"

                                    border.color:
                                        emailField.activeFocus
                                        ? "#6246e8"
                                        : "#d8dbe5"

                                    border.width:
                                        emailField.activeFocus
                                        ? 2
                                        : 1

                                    Text {
                                        anchors.left: parent.left
                                        anchors.verticalCenter: parent.verticalCenter

                                        anchors.leftMargin: 16

                                        text: "✉"

                                        font.pixelSize: 19

                                        color: "#5f687d"
                                    }

                                    TextInput {
                                        id: emailField

                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom

                                        anchors.leftMargin: 50
                                        anchors.rightMargin: 14

                                        verticalAlignment: TextInput.AlignVCenter

                                        font.family: Theme.fontName
                                        font.pixelSize: 13

                                        color: "#101828"

                                        clip: true

                                        selectByMouse: true
                                        selectionColor: "#6246ea"

                                        inputMethodHints:
                                            Qt.ImhEmailCharactersOnly

                                        Text {
                                            anchors.fill: parent

                                            verticalAlignment: Text.AlignVCenter

                                            text: "Enter your email"

                                            font.family: Theme.fontName
                                            font.pixelSize: 13

                                            color: "#9aa1b2"

                                            visible: emailField.text.length === 0
                                        }

                                        onAccepted: {
                                            if (root.signupMode)
                                                passwordField.forceActiveFocus()
                                            else
                                                root.doLogin()
                                        }
                                    }
                                }
                            }

                            // =================================================
                            // EMAIL / PASSWORD GAP
                            // =================================================

                            Item {
                                width: 1
                                height: 25
                            }

                            // =================================================
                            // PASSWORD HEADER
                            // =================================================

                            Row {
                                width: parent.width

                                Text {
                                    text: "Password"

                                    font.family: Theme.fontName
                                    font.pixelSize: 13
                                    font.weight: Font.DemiBold

                                    color: "#1d2539"
                                }

                                Item {
                                    width: Math.max(
                                        0,
                                        parent.width -
                                        passwordLabel.implicitWidth -
                                        forgotPasswordText.implicitWidth -
                                        15
                                    )

                                    height: 1

                                    Text {
                                        id: passwordLabel
                                        visible: false
                                    }
                                }

                                Text {
                                    id: forgotPasswordText

                                    visible: !root.signupMode

                                    text: "Forgot Password?"

                                    font.family: Theme.fontName
                                    font.pixelSize: 12
                                    font.weight: Font.DemiBold

                                    color: "#6246e8"

                                    MouseArea {
                                        anchors.fill: parent

                                        anchors.margins: -5

                                        cursorShape: Qt.PointingHandCursor

                                        onClicked: {
                                            App?.showForgotPassword()
                                        }
                                    }
                                }
                            }

                            Item {
                                width: 1
                                height: 8
                            }

                            // =================================================
                            // PASSWORD FIELD
                            // =================================================

                            Rectangle {
                                id: passwordContainer

                                width: parent.width
                                height: 54

                                radius: 8

                                color: "#ffffff"

                                border.color:
                                    passwordField.activeFocus
                                    ? "#6246e8"
                                    : "#d8dbe5"

                                border.width:
                                    passwordField.activeFocus
                                    ? 2
                                    : 1

                                Text {
                                    anchors.left: parent.left
                                    anchors.verticalCenter: parent.verticalCenter

                                    anchors.leftMargin: 16

                                    text: "♙"

                                    font.pixelSize: 19

                                    color: "#5f687d"
                                }

                                TextInput {
                                    id: passwordField

                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    anchors.top: parent.top
                                    anchors.bottom: parent.bottom

                                    anchors.leftMargin: 50
                                    anchors.rightMargin: 50

                                    verticalAlignment: TextInput.AlignVCenter

                                    font.family: Theme.fontName
                                    font.pixelSize: 13

                                    color: "#101828"

                                    clip: true

                                    echoMode:
                                        root.showPassword
                                        ? TextInput.Normal
                                        : TextInput.Password

                                    selectByMouse: true

                                    selectionColor: "#6246ea"

                                    Text {
                                        anchors.fill: parent

                                        verticalAlignment: Text.AlignVCenter

                                        text: "Enter your password"

                                        font.family: Theme.fontName
                                        font.pixelSize: 13

                                        color: "#9aa1b2"

                                        visible:
                                            passwordField.text.length === 0
                                    }

                                    onAccepted: {
                                        if (root.signupMode)
                                            confirmPasswordField.forceActiveFocus()
                                        else
                                            root.doLogin()
                                    }
                                }

                                Text {
                                    anchors.right: parent.right
                                    anchors.verticalCenter: parent.verticalCenter

                                    anchors.rightMargin: 17

                                    text:
                                        root.showPassword
                                        ? "◉"
                                        : "◌"

                                    font.pixelSize: 18

                                    color: "#657087"

                                    MouseArea {
                                        anchors.fill: parent

                                        anchors.margins: -8

                                        cursorShape:
                                            Qt.PointingHandCursor

                                        onClicked: {
                                            root.showPassword =
                                                    !root.showPassword
                                        }
                                    }
                                }
                            }

                            // =================================================
                            // CONFIRM PASSWORD - SIGNUP ONLY
                            // =================================================

                            Item {
                                width: 1
                                height: root.signupMode ? 22 : 0

                                visible: root.signupMode
                            }

                            Column {
                                id: confirmPasswordSection

                                width: parent.width

                                spacing: 8

                                visible: root.signupMode

                                Text {
                                    text: "Confirm Password"

                                    font.family: Theme.fontName
                                    font.pixelSize: 13
                                    font.weight: Font.DemiBold

                                    color: "#1d2539"
                                }

                                Rectangle {
                                    width: parent.width
                                    height: 54

                                    radius: 8

                                    color: "#ffffff"

                                    border.color:
                                        confirmPasswordField.activeFocus
                                        ? "#6246e8"
                                        : "#d8dbe5"

                                    border.width:
                                        confirmPasswordField.activeFocus
                                        ? 2
                                        : 1

                                    Text {
                                        anchors.left: parent.left
                                        anchors.verticalCenter: parent.verticalCenter

                                        anchors.leftMargin: 16

                                        text: "♙"

                                        font.pixelSize: 19

                                        color: "#5f687d"
                                    }

                                    TextInput {
                                        id: confirmPasswordField

                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom

                                        anchors.leftMargin: 50
                                        anchors.rightMargin: 50

                                        verticalAlignment:
                                            TextInput.AlignVCenter

                                        font.family: Theme.fontName
                                        font.pixelSize: 13

                                        color: "#101828"

                                        clip: true

                                        echoMode:
                                            root.showConfirmPassword
                                            ? TextInput.Normal
                                            : TextInput.Password

                                        selectByMouse: true

                                        selectionColor: "#6246ea"

                                        Text {
                                            anchors.fill: parent

                                            verticalAlignment:
                                                Text.AlignVCenter

                                            text: "Confirm your password"

                                            font.family: Theme.fontName
                                            font.pixelSize: 13

                                            color: "#9aa1b2"

                                            visible:
                                                confirmPasswordField.text.length === 0
                                        }

                                        onAccepted: {
                                            roleComboBox.forceActiveFocus()
                                        }
                                    }

                                    Text {
                                        anchors.right: parent.right
                                        anchors.verticalCenter:
                                            parent.verticalCenter

                                        anchors.rightMargin: 17

                                        text:
                                            root.showConfirmPassword
                                            ? "◉"
                                            : "◌"

                                        font.pixelSize: 18

                                        color: "#657087"

                                        MouseArea {
                                            anchors.fill: parent

                                            anchors.margins: -8

                                            cursorShape:
                                                Qt.PointingHandCursor

                                            onClicked: {
                                                root.showConfirmPassword =
                                                        !root.showConfirmPassword
                                            }
                                        }
                                    }
                                }
                            }

                            // =================================================
                            // ROLE - SIGNUP ONLY
                            // =================================================

                            Item {
                                width: 1
                                height: root.signupMode ? 22 : 0

                                visible: root.signupMode
                            }

                            Column {
                                id: roleSection

                                width: parent.width

                                spacing: 8

                                visible: root.signupMode

                                Text {
                                    text: "Target Role"

                                    font.family: Theme.fontName
                                    font.pixelSize: 13
                                    font.weight: Font.DemiBold

                                    color: "#1d2539"
                                }

                                Rectangle {
                                    width: parent.width
                                    height: 54

                                    radius: 8

                                    color: "#ffffff"

                                    border.color:
                                        roleComboBox.activeFocus
                                        ? "#6246e8"
                                        : "#d8dbe5"

                                    border.width:
                                        roleComboBox.activeFocus
                                        ? 2
                                        : 1

                                    Text {
                                        anchors.left: parent.left
                                        anchors.verticalCenter:
                                            parent.verticalCenter

                                        anchors.leftMargin: 16

                                        text: "◰"

                                        font.pixelSize: 19

                                        color: "#5f687d"
                                    }

                                    ComboBox {
                                        id: roleComboBox

                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom

                                        anchors.leftMargin: 50
                                        anchors.rightMargin: 8

                                        model: root.roleModel

                                        currentIndex: -1

                                        font.family: Theme.fontName
                                        font.pixelSize: 13

                                        onActivated: {
                                            root.selectedRole = currentText
                                        }

                                        // -----------------------------------------
                                        // ComboBox background
                                        // -----------------------------------------

                                        background: Item {
                                        }

                                        // -----------------------------------------
                                        // ComboBox content
                                        // -----------------------------------------

                                        contentItem: Text {
                                            leftPadding: 0
                                            rightPadding: 30

                                            verticalAlignment:
                                                Text.AlignVCenter

                                            text:
                                                roleComboBox.currentIndex >= 0
                                                ? roleComboBox.currentText
                                                : "Select your target role"

                                            font.family: Theme.fontName
                                            font.pixelSize: 13

                                            color:
                                                roleComboBox.currentIndex >= 0
                                                ? "#101828"
                                                : "#9aa1b2"

                                            elide: Text.ElideRight
                                        }

                                        indicator: Text {
                                            x: roleComboBox.width -
                                               width -
                                               8

                                            y: (
                                                roleComboBox.height -
                                                height
                                            ) / 2

                                            text: "⌄"

                                            font.pixelSize: 17

                                            color: "#667085"
                                        }

                                        popup: Popup {
                                            y: roleComboBox.height + 4

                                            width: roleComboBox.width

                                            padding: 5

                                            background: Rectangle {
                                                radius: 8

                                                color: "#ffffff"

                                                border.color: "#d8dbe5"
                                                border.width: 1
                                            }

                                            contentItem: ListView {
                                                implicitHeight:
                                                    Math.min(
                                                        contentHeight,
                                                        280
                                                    )

                                                clip: true

                                                model:
                                                    roleComboBox.popup.visible
                                                    ? roleComboBox.delegateModel
                                                    : null

                                                delegate: ItemDelegate {
                                                    width:
                                                        roleComboBox.width - 10

                                                    height: 40

                                                    text: modelData

                                                    font.family:
                                                        Theme.fontName

                                                    font.pixelSize: 12

                                                    highlighted:
                                                        roleComboBox.highlightedIndex
                                                        === index

                                                    onClicked: {
                                                        roleComboBox.currentIndex =
                                                                index

                                                        root.selectedRole =
                                                                modelData

                                                        roleComboBox.popup.close()
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            // =================================================
                            // TERMS - SIGNUP ONLY
                            // =================================================

                            Item {
                                width: 1
                                height: root.signupMode ? 20 : 0

                                visible: root.signupMode
                            }

                            Item {
                                id: termsRow

                                width: parent.width
                                height: 19

                                visible: root.signupMode

                                Row {
                                    width: parent.width

                                    spacing: 9

                                Rectangle {
                                    id: termsBox

                                    width: 19
                                    height: 19

                                    radius: 4

                                    color:
                                        root.termsAccepted
                                        ? "#6246e8"
                                        : "#ffffff"

                                    border.color:
                                        root.termsAccepted
                                        ? "#6246e8"
                                        : "#cfd3df"

                                    border.width: 1

                                    Text {
                                        anchors.centerIn: parent

                                        text: "✓"

                                        font.pixelSize: 12
                                        font.weight: Font.Bold

                                        color: "#ffffff"

                                        visible: root.termsAccepted
                                    }

                                    MouseArea {
                                        anchors.fill: parent

                                        cursorShape:
                                            Qt.PointingHandCursor

                                        onClicked: {
                                            root.termsAccepted =
                                                    !root.termsAccepted
                                        }
                                    }
                                }

                                Text {
                                    text: "I agree to the"

                                    font.family: Theme.fontName
                                    font.pixelSize: 11

                                    color: "#50596d"
                                }

                                Text {
                                    text: "Terms of Service"

                                    font.family: Theme.fontName
                                    font.pixelSize: 11
                                    font.weight: Font.DemiBold

                                    color: "#6246e8"

                                    MouseArea {
                                        anchors.fill: parent

                                        cursorShape:
                                            Qt.PointingHandCursor

                                        onClicked: {
                                            console.log(
                                                "Terms of Service clicked"
                                            )
                                        }
                                    }
                                }

                                Text {
                                    text: "and"

                                    font.family: Theme.fontName
                                    font.pixelSize: 11

                                    color: "#50596d"
                                }

                                Text {
                                    text: "Privacy Policy"

                                    font.family: Theme.fontName
                                    font.pixelSize: 11
                                    font.weight: Font.DemiBold

                                    color: "#6246e8"

                                    MouseArea {
                                        anchors.fill: parent

                                        cursorShape:
                                            Qt.PointingHandCursor

                                        onClicked: {
                                            console.log(
                                                "Privacy Policy clicked"
                                            )
                                        }
                                    }
                                }
                                }

                                MouseArea {
                                    anchors.fill: parent

                                    cursorShape:
                                        Qt.PointingHandCursor

                                    onClicked: {
                                        root.termsAccepted =
                                                !root.termsAccepted
                                    }
                                }
                            }

                            // =================================================
                            // ERROR MESSAGE
                            // =================================================

                            Item {
                                width: 1
                                height: errorLabel.visible ? 18 : 12
                            }

                            Rectangle {
                                id: errorContainer

                                width: parent.width

                                height:
                                    errorLabel.visible
                                    ? Math.max(
                                        34,
                                        errorLabel.implicitHeight + 14
                                      )
                                    : 0

                                radius: 7

                                color: "#fff2f2"

                                visible: errorLabel.visible

                                clip: true

                                Text {
                                    id: errorLabel

                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    anchors.top: parent.top
                                    anchors.bottom: parent.bottom

                                    anchors.leftMargin: 12
                                    anchors.rightMargin: 12

                                    verticalAlignment:
                                        Text.AlignVCenter

                                    horizontalAlignment:
                                        Text.AlignHCenter

                                    wrapMode: Text.WordWrap

                                    font.family: Theme.fontName
                                    font.pixelSize: 11

                                    color: "#dc3545"

                                    visible: false
                                }
                            }

                            // =================================================
                            // ERROR / BUTTON GAP
                            // =================================================

                            Item {
                                width: 1
                                height:
                                    errorLabel.visible
                                    ? 14
                                    : 20
                            }

                            // ---------------------------------------------
                            // Invisible checkbox state holder (always exists)
                            // ---------------------------------------------

                            Item {
                                id: rememberCheck

                                width: 0
                                height: 0

                                property bool checked: false
                            }

                            // =================================================
                            // REMEMBER ME - LOGIN ONLY
                            // =================================================

                            Row {
                                id: rememberRow

                                width: parent.width

                                spacing: 9

                                visible: !root.signupMode

                                Rectangle {
                                    id: rememberBox

                                    width: 19
                                    height: 19

                                    radius: 4

                                    color:
                                        rememberCheck.checked
                                        ? "#6246e8"
                                        : "#ffffff"

                                    border.color:
                                        rememberCheck.checked
                                        ? "#6246e8"
                                        : "#cfd3df"

                                    border.width: 1

                                    Text {
                                        anchors.centerIn: parent

                                        text: "✓"

                                        font.pixelSize: 12
                                        font.weight: Font.Bold

                                        color: "#ffffff"

                                        visible:
                                            rememberCheck.checked
                                    }

                                    MouseArea {
                                        anchors.fill: parent

                                        cursorShape:
                                            Qt.PointingHandCursor

                                        onClicked: {
                                            rememberCheck.checked =
                                                    !rememberCheck.checked
                                        }
                                    }
                                }

                                Text {
                                    text: "Remember me"

                                    font.family: Theme.fontName
                                    font.pixelSize: 12

                                    color: "#50596d"

                                    MouseArea {
                                        anchors.fill: parent

                                        anchors.margins: -5

                                        cursorShape:
                                            Qt.PointingHandCursor

                                        onClicked: {
                                            rememberCheck.checked =
                                                    !rememberCheck.checked
                                        }
                                    }
                                }
                            }

                            // =================================================
                            // REMEMBER / TERMS GAP
                            // =================================================

                            Item {
                                width: 1

                                height:
                                    root.signupMode
                                    ? 22
                                    : 22
                            }

                            // =================================================
                            // MAIN BUTTON
                            // =================================================

                            Rectangle {
                                id: submitButton

                                width: parent.width
                                height: 58

                                radius: 9

                                color: "#6246e8"

                                opacity:
                                    root.loading
                                    ? 0.78
                                    : 1.0

                                Behavior on opacity {
                                    NumberAnimation {
                                        duration: 120
                                    }
                                }

                                Text {
                                    anchors.centerIn: parent

                                    text:
                                        root.loading
                                        ? (
                                            root.signupMode
                                            ? "Creating account..."
                                            : "Logging in..."
                                          )
                                        : (
                                            root.signupMode
                                            ? "➤  Sign Up"
                                            : "➤  Login"
                                          )

                                    font.family: Theme.fontName
                                    font.pixelSize: 15
                                    font.weight: Font.DemiBold

                                    color: "#ffffff"
                                }

                                MouseArea {
                                    anchors.fill: parent

                                    enabled: !root.loading

                                    cursorShape:
                                        enabled
                                        ? Qt.PointingHandCursor
                                        : Qt.ArrowCursor

                                    onClicked: {
                                        console.log("[AUTH] Submit button clicked. signupMode =", root.signupMode)
                                        root.doLogin()
                                    }
                                }
                            }

                            // =================================================
                            // SOCIAL DIVIDER
                            // =================================================

                            Item {
                                width: 1
                                height: 28
                            }

                            Row {
                                id: socialDivider

                                width: parent.width

                                spacing: 12

                                Rectangle {
                                    width: Math.max(
                                        20,
                                        (
                                            parent.width -
                                            socialText.implicitWidth -
                                            24
                                        ) / 2
                                    )

                                    height: 1

                                    color: "#e4e6ed"
                                }

                                Text {
                                    id: socialText

                                    text: "or continue with"

                                    font.family: Theme.fontName
                                    font.pixelSize: 11

                                    color: "#858c9d"
                                }

                                Rectangle {
                                    width: Math.max(
                                        20,
                                        (
                                            parent.width -
                                            socialText.implicitWidth -
                                            24
                                        ) / 2
                                    )

                                    height: 1

                                    color: "#e4e6ed"
                                }
                            }

                            // =================================================
                            // GOOGLE
                            // =================================================

                            Item {
                                width: 1
                                height: 18
                            }

                            Rectangle {
                                id: googleButton

                                width: parent.width
                                height: 53

                                radius: 8

                                color: "#ffffff"

                                border.color: "#dfe2e9"
                                border.width: 1

                                Row {
                                    anchors.centerIn: parent

                                    spacing: 12

                                    Text {
                                        text: "G"

                                        font.family: "Arial"
                                        font.pixelSize: 20
                                        font.weight: Font.Bold

                                        color: "#4285F4"
                                    }

                                    Text {
                                        text: "Continue with Google"

                                        font.family: Theme.fontName
                                        font.pixelSize: 13

                                        color: "#303747"
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent

                                    enabled: !root.loading

                                    cursorShape:
                                        enabled
                                        ? Qt.PointingHandCursor
                                        : Qt.ArrowCursor

                                    onClicked: {
                                        App?.loginWithGoogle()
                                    }
                                }
                            }

                            // =================================================
                            // GITHUB
                            // =================================================

                            Item {
                                width: 1
                                height: 12
                            }

                            Rectangle {
                                id: githubButton

                                width: parent.width
                                height: 53

                                radius: 8

                                color: "#ffffff"

                                border.color: "#dfe2e9"
                                border.width: 1

                                Row {
                                    anchors.centerIn: parent

                                    spacing: 12

                                    Text {
                                        text: "●"

                                        font.pixelSize: 18
                                        font.weight: Font.Bold

                                        color: "#111111"
                                    }

                                    Text {
                                        text: "Continue with GitHub"

                                        font.family: Theme.fontName
                                        font.pixelSize: 13

                                        color: "#303747"
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent

                                    enabled: !root.loading

                                    cursorShape:
                                        enabled
                                        ? Qt.PointingHandCursor
                                        : Qt.ArrowCursor

                                    onClicked: {
                                        App?.loginWithGitHub()
                                    }
                                }
                            }

                            // =================================================
                            // BOTTOM SPACING
                            // =================================================

                            Item {
                                width: 1
                                height: 28
                            }
                        }
                    }

                    // =================================================
                    // BOTTOM SPACE
                    // =================================================

                    Item {
                        width: 1
                        height: 20
                    }
                }
            }
        }
    }

    // =========================================================
    // RESPONSIVE STATES
    // =========================================================

    states: [

        // =====================================================
        // COMPACT
        // =====================================================

        State {
            name: "compact"

            when: root.width < 1100

            PropertyChanges {
                target: leftPanel

                width: appFrame.width * 0.54
            }

            PropertyChanges {
                target: leftContent

                anchors.leftMargin: 48
                anchors.rightMargin: 38
            }

            PropertyChanges {
                target: heroColumn

                width: Math.min(
                    leftPanel.width - 85,
                    430
                )
            }

            PropertyChanges {
                target: features

                width: Math.min(
                    leftPanel.width - 80,
                    410
                )
            }

            PropertyChanges {
                target: illustration

                scale: 0.88
            }
        },

        // =====================================================
        // SMALL
        // =====================================================

        State {
            name: "small"

            when: root.width < 900

            PropertyChanges {
                target: leftPanel

                width: appFrame.width * 0.50
            }

            PropertyChanges {
                target: leftContent

                anchors.leftMargin: 35
                anchors.rightMargin: 30
            }

            PropertyChanges {
                target: heroColumn

                width: leftPanel.width - 65
            }

            PropertyChanges {
                target: features

                width: leftPanel.width - 55
            }

            PropertyChanges {
                target: illustration

                visible: false
            }

            PropertyChanges {
                target: trustCard

                height: 68
            }

            PropertyChanges {
                target: topSwitch

                anchors.rightMargin: 25
            }
        },

        // =====================================================
        // VERY SMALL
        // =====================================================

        State {
            name: "verySmall"

            when: root.width < 760

            PropertyChanges {
                target: leftPanel

                width: appFrame.width * 0.44
            }

            PropertyChanges {
                target: leftContent

                anchors.leftMargin: 25
                anchors.rightMargin: 20
            }

            PropertyChanges {
                target: heroColumn

                width: leftPanel.width - 45
            }

            PropertyChanges {
                target: features

                width: leftPanel.width - 40
            }

            PropertyChanges {
                target: illustration

                visible: false
            }

            PropertyChanges {
                target: trustCard

                visible: false
            }

            PropertyChanges {
                target: topSwitch

                anchors.rightMargin: 18
                anchors.topMargin: 22
            }

            PropertyChanges {
                target: formScrollView

                anchors.leftMargin: 12
                anchors.rightMargin: 12
            }
        }
    ]
}
