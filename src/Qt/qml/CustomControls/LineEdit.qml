import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Layouts 1.3

Item {
    id: lineEdit
    property string content: ""
    property alias readonly: input.readOnly
    property alias color: rect.color
    signal edittingFinished()
    Rectangle {
        id: rect
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
                lineEdit.edittingFinished()
                ensureVisible(0)
            }
        }
    }
}
