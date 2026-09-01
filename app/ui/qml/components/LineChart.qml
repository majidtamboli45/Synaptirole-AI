import QtQuick
import "."

Item {
    id: root
    property var points: []
    property real yMax: 100

    onPointsChanged: canvas.requestPaint()
    onWidthChanged: canvas.requestPaint()
    onHeightChanged: canvas.requestPaint()

    Rectangle {
        id: tooltip
        visible: root.hoverIndex >= 0
        width: tipCol.implicitWidth + 18
        height: 46
        radius: 9
        color: "#0f172a"
        opacity: 0.94
        x: {
            var i = Math.max(0, Math.min(root.hoverIndex, root.points.length - 1))
            var px = canvas.padL + (root.points.length === 1 ? (canvas.plotW / 2) : (canvas.plotW * i / (root.points.length - 1)))
            return Math.max(4, Math.min(px - width / 2, root.width - width - 4))
        }
        y: -8
        Column {
            id: tipCol
            anchors.centerIn: parent
            spacing: 1
            Text {
                id: tipDate
                property int idx: Math.max(0, Math.min(root.hoverIndex, root.points.length - 1))
                text: root.points.length > idx ? root.points[idx].label : ""
                color: "#cbd5e1"
                font.family: Theme.fontName
                font.pixelSize: 10
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Text {
                text: "Score: " + (root.points.length > tipDate.idx ? root.points[tipDate.idx].value : "")
                color: "#ffffff"
                font.family: Theme.fontName
                font.pixelSize: 12
                font.weight: Font.Bold
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    property int hoverIndex: -1
    onHoverIndexChanged: canvas.requestPaint()

    Canvas {
        id: canvas
        anchors.fill: parent
        antialiasing: true

        readonly property real padL: 36
        readonly property real padR: 12
        readonly property real padT: 14
        readonly property real padB: 26
        readonly property real plotW: width - padL - padR
        readonly property real plotH: height - padT - padB

        function xAt(i) {
            return padL + (root.points.length === 1 ? plotW / 2 : plotW * i / (root.points.length - 1))
        }
        function yAt(v) {
            return padT + plotH - (v / root.yMax) * plotH
        }

        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()
            if (plotW <= 10 || plotH <= 10 || root.points.length === 0) return

            ctx.font = "11px 'Segoe UI'"
            for (var v = 0; v <= root.yMax; v += 25) {
                var gy = yAt(v)
                ctx.strokeStyle = v === 0 ? "#e2e8f0" : "#eef0f7"
                ctx.lineWidth = 1
                ctx.beginPath()
                ctx.moveTo(padL, gy)
                ctx.lineTo(padL + plotW, gy)
                ctx.stroke()
                ctx.fillStyle = "#94a3b8"
                ctx.textAlign = "right"
                ctx.fillText(String(v), padL - 8, gy + 4)
            }

            ctx.textAlign = "center"
            ctx.fillStyle = "#94a3b8"
            for (var i = 0; i < root.points.length; i++) {
                ctx.fillText(root.points[i].label, xAt(i), height - 8)
            }

            var grad = ctx.createLinearGradient(0, padT, 0, padT + plotH)
            grad.addColorStop(0, "rgba(124,58,237,0.22)")
            grad.addColorStop(1, "rgba(124,58,237,0.01)")
            ctx.beginPath()
            ctx.moveTo(xAt(0), padT + plotH)
            for (i = 0; i < root.points.length; i++)
                ctx.lineTo(xAt(i), yAt(root.points[i].value))
            ctx.lineTo(xAt(root.points.length - 1), padT + plotH)
            ctx.closePath()
            ctx.fillStyle = grad
            ctx.fill()

            ctx.beginPath()
            for (i = 0; i < root.points.length; i++) {
                if (i === 0) ctx.moveTo(xAt(i), yAt(root.points[i].value))
                else ctx.lineTo(xAt(i), yAt(root.points[i].value))
            }
            ctx.strokeStyle = "#7c3aed"
            ctx.lineWidth = 2.6
            ctx.lineJoin = "round"
            ctx.lineCap = "round"
            ctx.stroke()

            for (i = 0; i < root.points.length; i++) {
                var isHover = i === root.hoverIndex
                ctx.beginPath()
                ctx.arc(xAt(i), yAt(root.points[i].value), isHover ? 5.5 : 4, 0, Math.PI * 2)
                ctx.fillStyle = isHover ? "#5b21b6" : "#7c3aed"
                ctx.fill()
                ctx.lineWidth = 2
                ctx.strokeStyle = "#ffffff"
                ctx.stroke()
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        onPositionChanged: {
            if (root.points.length === 0) return
            var mx = mouse.x
            var best = -1
            var bestD = 1e9
            for (var i = 0; i < root.points.length; i++) {
                var px = canvas.xAt(i)
                var d = Math.abs(mx - px)
                if (d < bestD) { bestD = d; best = i }
            }
            root.hoverIndex = best
        }
        onExited: root.hoverIndex = -1
    }
}
