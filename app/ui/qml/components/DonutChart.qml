import QtQuick
import "."

Item {
    id: root
    property var segments: []
    property string centerTop: ""
    property string centerBottom: ""
    property int lineWidth: 26

    onSegmentsChanged: canvas.requestPaint()
    onWidthChanged: canvas.requestPaint()
    onHeightChanged: canvas.requestPaint()

    Canvas {
        id: canvas
        anchors.fill: parent
        antialiasing: true

        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()
            if (width < 20 || root.segments.length === 0) return
            var cx = width / 2, cy = height / 2
            var r = Math.min(cx, cy) - root.lineWidth / 2 - 2
            var total = 0
            for (var i = 0; i < root.segments.length; i++)
                total += root.segments[i].value
            if (total <= 0) return

            var angle = -Math.PI / 2
            var gap = 0.035
            for (i = 0; i < root.segments.length; i++) {
                var seg = root.segments[i]
                var span = (seg.value / total) * Math.PI * 2
                ctx.beginPath()
                ctx.arc(cx, cy, r, angle + gap / 2, angle + Math.max(span - gap, 0.01))
                ctx.strokeStyle = seg.color
                ctx.lineWidth = root.lineWidth
                ctx.stroke()
                angle += span
            }
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 1
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: root.centerTop
            font.family: Theme.fontName
            font.pixelSize: 22
            font.weight: Font.Bold
            color: Theme.text
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: root.centerBottom
            font.family: Theme.fontName
            font.pixelSize: 12
            color: Theme.muted
        }
    }
}
