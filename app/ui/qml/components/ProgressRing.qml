import QtQuick
import "."

Item {
    id: root
    property real value: 0
    property real size: 120
    property int lineWidth: 12
    property color ringColor: Theme.primary
    property string label: ""
    property string subLabel: ""

    width: size
    height: size

    onWidthChanged: canvas.requestPaint()

    Canvas {
        id: canvas
        anchors.fill: parent
        antialiasing: true
        property real animatedValue: 0
        onAnimatedValueChanged: canvas.requestPaint()

        Behavior on animatedValue {
            NumberAnimation {
                duration: 900
                easing.type: Easing.OutCubic
            }
        }

        Connections {
            target: root
            function onValueChanged() {
                canvas.animatedValue = root.value
            }
        }

        Component.onCompleted: canvas.animatedValue = root.value

        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()
            if (width < 10) return
            var cx = width / 2, cy = height / 2
            var r = Math.min(cx, cy) - root.lineWidth / 2 - 1
            ctx.lineWidth = root.lineWidth
            ctx.lineCap = "round"
            ctx.strokeStyle = "#edeef5"
            ctx.beginPath()
            ctx.arc(cx, cy, r, 0, Math.PI * 2)
            ctx.stroke()
            var frac = Math.max(0, Math.min(animatedValue, 100)) / 100
            if (frac > 0.001) {
                ctx.lineCap = "butt"
                ctx.strokeStyle = root.ringColor
                ctx.beginPath()
                ctx.arc(cx, cy, r, -Math.PI / 2, -Math.PI / 2 + frac * Math.PI * 2)
                ctx.stroke()
            }
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 0
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: root.label !== "" ? root.label : Math.round(root.value) + "%"
            font.family: Theme.fontName
            font.pixelSize: root.size > 100 ? 24 : 18
            font.weight: Font.Bold
            color: Theme.text
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            visible: root.subLabel !== ""
            text: root.subLabel
            font.family: Theme.fontName
            font.pixelSize: 11
            color: Theme.muted
        }
    }
}
