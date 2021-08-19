import QtQuick 2.15
import QtQuick.Window 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12
Item {
    property alias title: first.text
    property alias content: listView.model
    property alias color: rect.color
    property alias preferredHeight: rect.height
    Rectangle{
        id: rect
        width: parent.width
        height: first.height+listView.height
        Label{
            id:first
            font.bold: true
        }
        ListView{
            id: listView
            anchors.top: first.bottom
            anchors.right: rect.right
            width: rect.width-10
            height: count * 13
            clip: true
            delegate: Text{
                text: display
                font.pixelSize: 10
            }
        }
    }
}
