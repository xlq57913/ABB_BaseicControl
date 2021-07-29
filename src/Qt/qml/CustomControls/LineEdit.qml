import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Layouts 1.3

Item {
    id: lineEdit
    property string content: ""
    signal edittingFinished(string content)
    Rectangle {
        width: parent.width
        height: parent.height
        radius: 5
        border.color: 'grey'

        TextInput {
            id: input
            width: parent.width

            color: "blue"
            font.pointSize: 15
            padding: 5
            clip: true
            selectByMouse: true

            anchors.verticalCenter: parent.verticalCenter
            text: qsTr(content)
            onEditingFinished: {
                content = displayText
                lineEdit.edittingFinished(content)
                ensureVisible(0)
            }
        }
    }
}
