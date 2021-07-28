import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Layouts 1.3

Item {
    id: logger
    property string content: ""
    Rectangle {
        width: parent.width
        height: parent.height
        radius: 5
        border.color:"silver"
        color: "whitesmoke"
        TextInput {
            id: field
            width: parent.width

            color: "lightgray"
            font.pointSize: 12
            padding: 5
            clip: true
            readOnly: true

            anchors.verticalCenter: parent.verticalCenter
            text: qsTr(content)
        }
    }
}
