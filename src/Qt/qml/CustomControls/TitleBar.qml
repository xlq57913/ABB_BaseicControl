import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12

Item {
    property alias text: title.text
    property alias color: rect.border.color

    Rectangle{
        id: rect
        width: parent.width
        height: parent.height
        border.width: 1
        Label{
            id: title
            anchors.centerIn: rect
            font.bold: true

        }
    }

}
