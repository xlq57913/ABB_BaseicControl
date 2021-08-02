import QtQuick 2.15
import QtQuick.Window 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12
Item {
    property alias title: first.text
    property alias content: listView.model
    Rectangle{
        id: rect
        width: parent.width
        height: parent.height
        Label{
            id:first
            font.bold: true
        }
        ListView{
            id: listView
            anchors.top: first.bottom
            anchors.right: rect.right
            width: rect.width-10
            height: 50
            clip: true
            delegate: Text{text: display}
        }
    }
}
