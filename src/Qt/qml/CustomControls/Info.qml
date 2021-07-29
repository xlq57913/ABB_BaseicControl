import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12

Item {
    property string infoType: "InfoType"
    property string value: "value"
    Rectangle{
        width: parent.width
        height: parent.height
        color: "transparent"

            Label{
                id: type
                height: parent.height
                anchors.left: parent.left
                anchors.leftMargin: 2
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr(infoType + ": ")
                font.bold: true
            }

            TextInput{
                id: val
                height: parent.height
                anchors.left: type.right
                anchors.leftMargin: 2
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr(value)
                readOnly: true
                selectByMouse: true
                clip: true
                font.italic: true
            }

    }
}
