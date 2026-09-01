import QtQuick
import "."

Item {
    id: root
    property var values: []
    property real yMax: 100

    onValuesChanged: canvas.requestPaint()
    onWidthChanged: canvas.requestPaint()
    onHeightChanged: canvas.requestPaint()

    Canvas {
        id: canvas
        anchors.fill: parent
        antialiasing: true

        function rr(ctx, x, y, w, h, r) {
            ctx.beginPath()
            ctx.moveTo(x + r, y)
            ctx.lineTo(x + w - r, y)
            ctx.quadraticCurveTo(x + w, y, x + w, y + r)
            ctx.lineTo(x + w, y + h)
            ctx.lineTo(x, y + h)
            ctx.lineTo(x, y + r)
            ctx.quadraticCurveTo(x, y, x + r, y)
            ctx.closePath()
        }

        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()
            if (width < 20 || height < 20 || root.values.length === 0) return
            var padB = 26, padT = 22
            var plotH = height - padT - padB
            var slot = width / root.values.length
            var barW = Math.min(64, slot * 0.5)

            for (var i = 0; i < root.values.length; i++) {
                var v = root.values[i]
                var h = (v.value / root.yMax) * plotH
                var x = slot * i + (slot - barW) / 2
                var y = padT + plotH - h

                var grad = ctx.createLinearGradient(0, y, 0, padT + plotH)
                grad.addColorStop(0, v.color)
                grad.addColorStop(1, hexA(v.color, 0.45))
                ctx.fillStyle = grad
                rr(ctx, x, y, barW, h, 8)
                ctx.fill()

                ctx.font = "700 12px 'Segoe UI'"
                ctx.fillStyle = "#334155"
                ctx.textAlign = "center"
                ctx.fillText(String(v.value), x + barW / 2, y - 7)

                ctx.font = "11px 'Segoe UI'"
                ctx.fillStyle = "#64748b"
                ctx.fillText(v.label, x + barW / 2, height - 8)
            }

            ctx.strokeStyle = "#e2e8f0"
            ctx.lineWidth = 1
            ctx.beginPath()
            ctx.moveTo(0, padT + plotH)
            ctx.lineTo(width, padT + plotH)
            ctx.stroke()
        }

        function hexA(hex, a) {
            var r = parseInt(hex.slice(1, 3), 16)
            var g = parseInt(hex.slice(3, 5), 16)
            var b = parseInt(hex.slice(5, 7), 16)
            return "rgba(" + r + "," + g + "," + b + "," + a + ")"
        }
    }
}
