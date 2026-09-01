import QtQuick
import "."

Item {
    id: root
    property var nodes: []
    property string centerLabel: ""

    Timer {
        running: root.visible
        interval: 90
        repeat: true
        onTriggered: {
            root.t = (root.t + 0.05) % (Math.PI * 2)
            canvas.requestPaint()
        }
    }
    property real t: 0

    onNodesChanged: canvas.requestPaint()
    onWidthChanged: canvas.requestPaint()
    onHeightChanged: canvas.requestPaint()

    Canvas {
        id: canvas
        anchors.fill: parent
        antialiasing: true

        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()
            if (width < 50 || height < 50 || root.nodes.length === 0) return
            var cx = width / 2, cy = height / 2

            for (var i = 0; i < root.nodes.length; i++) {
                var n = root.nodes[i]
                var nx = cx + n.x * (cx - 40)
                var ny = cy + n.y * (cy - 34)
                ctx.strokeStyle = "rgba(124,58,237,0.28)"
                ctx.lineWidth = 1.4
                ctx.setLineDash([4, 4])
                ctx.beginPath()
                ctx.moveTo(cx, cy)
                ctx.lineTo(nx, ny)
                ctx.stroke()
                ctx.setLineDash([])
            }

            for (i = 0; i < root.nodes.length; i++) {
                n = root.nodes[i]
                nx = cx + n.x * (cx - 40)
                ny = cy + n.y * (cy - 34)
                var base = 9 + (n.score || 60) / 100 * 6
                var r = base + Math.sin(root.t * 2 + i * 1.3) * 1.2
                var col = n.status === 0 ? "#22c55e" : (n.status === 1 ? "#f59e0b" : "#ef4444")
                ctx.fillStyle = hexA(col, 0.16)
                ctx.beginPath()
                ctx.arc(nx, ny, r * 2.1, 0, Math.PI * 2)
                ctx.fill()
                ctx.fillStyle = col
                ctx.beginPath()
                ctx.arc(nx, ny, r, 0, Math.PI * 2)
                ctx.fill()
                ctx.fillStyle = "#ffffff"
                ctx.beginPath()
                ctx.arc(nx, ny, 3.2, 0, Math.PI * 2)
                ctx.fill()
                ctx.font = "600 11px 'Segoe UI'"
                ctx.fillStyle = "#334155"
                ctx.textAlign = "center"
                ctx.fillText(n.name, nx, ny + r + 15)
            }

            var pulse = Math.sin(root.t * 2) * 3
            ctx.fillStyle = hexA("#7c3aed", 0.14)
            ctx.beginPath()
            ctx.arc(cx, cy, 34 + pulse + 10, 0, Math.PI * 2)
            ctx.fill()
            ctx.fillStyle = hexA("#7c3aed", 0.30)
            ctx.beginPath()
            ctx.arc(cx, cy, 34 + pulse, 0, Math.PI * 2)
            ctx.fill()
            ctx.fillStyle = "#7c3aed"
            ctx.beginPath()
            ctx.arc(cx, cy, 26, 0, Math.PI * 2)
            ctx.fill()
            ctx.font = "700 11px 'Segoe UI'"
            ctx.fillStyle = "#ffffff"
            ctx.textAlign = "center"
            drawWrapped(ctx, root.centerLabel, cx, cy - 4, 44)
        }

        function hexA(hex, a) {
            var r = parseInt(hex.slice(1, 3), 16)
            var g = parseInt(hex.slice(3, 5), 16)
            var b = parseInt(hex.slice(5, 7), 16)
            return "rgba(" + r + "," + g + "," + b + "," + a + ")"
        }

        function drawWrapped(ctx, text, x, y, maxW) {
            var words = text.split(" ")
            var line = ""
            var lines = []
            for (var i = 0; i < words.length; i++) {
                var test = line + words[i] + " "
                if (ctx.measureText(test).width > maxW && line !== "") {
                    lines.push(line.trim())
                    line = words[i] + " "
                } else {
                    line = test
                }
            }
            lines.push(line.trim())
            var startY = y - (lines.length - 1) * 6.5
            for (i = 0; i < lines.length; i++)
                ctx.fillText(lines[i], x, startY + i * 13)
        }
    }
}
