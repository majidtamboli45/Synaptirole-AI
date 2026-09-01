import QtQuick
import QtQuick.Controls
import "."

Item {
    id: root
    width: 190
    height: 40

    signal rangeChanged(string range)

    AppComboBox {
        anchors.fill: parent
        model: ["May 10 - May 16, 2024", "Today", "Last 7 Days", "Last 30 Days", "This Month", "Custom Range"]
        onActivated: function(index) {
            root.rangeChanged(root.model[index])
        }
    }
}
