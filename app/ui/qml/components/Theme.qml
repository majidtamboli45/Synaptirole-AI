import QtQuick

pragma Singleton

QtObject {
    readonly property string fontName: "Segoe UI"
    readonly property color primary: "#7c3aed"
    readonly property color primaryDark: "#5b21b6"
    readonly property color primarySoft: "#f3eefe"
    readonly property color deepBlue: "#1e1b4b"
    readonly property color bg: "#f6f7fb"
    readonly property color card: "#ffffff"
    readonly property color border: "#e8eaf2"
    readonly property color text: "#0f172a"
    readonly property color muted: "#64748b"
    readonly property color faint: "#94a3b8"
    readonly property color green: "#22c55e"
    readonly property color greenSoft: "#e9f9ef"
    readonly property color red: "#ef4444"
    readonly property color redSoft: "#fdecec"
    readonly property color amber: "#f59e0b"
    readonly property color amberSoft: "#fef4e2"
    readonly property color blue: "#3b82f6"
    readonly property color blueSoft: "#eaf2fe"
    readonly property color darkPanel: "#111827"

    function alpha(c, a) {
        return Qt.rgba(c.r, c.g, c.b, a)
    }
}
