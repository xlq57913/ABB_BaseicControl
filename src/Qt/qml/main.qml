import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12
import"./CustomControls" as CustomControls

Window {
    id: base
    width: 640
    height: 480
    visible: true
    title: qsTr("RobController")
    color: 'lightgray'

    ColumnLayout{
        spacing: 5
        width: parent.width
        height: parent.height - 5
        anchors.centerIn: parent

        Rectangle{
            Layout.fillWidth: true
            Layout.minimumHeight: 35
            Layout.preferredHeight: 45
            Layout.alignment: Qt.AlignTop
            radius: 5
            color: base.color
            border.color: "white"


            RowLayout{
                Layout.alignment: Qt.AlignCenter
                spacing: 5
                Layout.margins: 5
                anchors.verticalCenter: parent.verticalCenter

                Label {
                    Layout.fillWidth: true
                    Layout.margins: 5
                    font.pixelSize: 15
                    font.bold: true
                    text: qsTr("RobType:")
                }

                ComboBox{
                    id:comboBox_robType
                    editable: false
                    Layout.preferredWidth: 120
                    Layout.preferredHeight: 25
                    font.pixelSize: 12

                    model: ["ABB"]
                }

                Label{
                    Layout.fillWidth: true
                    Layout.margins: 5
                    font.pixelSize: 15
                    font.bold: true
                    text: qsTr("IP:")
                }

                CustomControls.LineEdit{
                    Layout.fillWidth: true
                    Layout.minimumWidth: 125
                    Layout.preferredWidth: 150
                    Layout.preferredHeight: 25

                    content: "0.0.0.0"

                }

                Label{
                    Layout.fillWidth: true
                    Layout.margins: 5
                    font.pixelSize: 15
                    font.bold: true
                    text: qsTr("PORT:")
                }

                CustomControls.LineEdit{
                    Layout.fillWidth: true
                    Layout.minimumWidth: 45
                    Layout.preferredWidth: 60
                    Layout.preferredHeight: 25

                    content: "0"
                }

                Button{
                    id: button_connect
                    Layout.fillWidth: true
                    Layout.preferredHeight: 25
                    Layout.preferredWidth: 80
                    Layout.alignment: Qt.AlignRight
                    Layout.margins: 5
                    font.pixelSize: 12
                    highlighted: true
                    text: qsTr("CONNECT")
                }
            }
        }

        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: base.color
            radius: 5

            RowLayout{
                Layout.alignment: Qt.AlignCenter
                width: parent.width
                height: parent.height

                Rectangle{
                    id: rectangle_robCmd
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignLeft
                    border.color: "white"
                    color: base.color
                    radius: 5
                }

                Rectangle{
                    id: rectangle_robInfo
                    Layout.fillHeight: true
                    Layout.preferredWidth: 0.33*parent.width
                    Layout.alignment: Qt.AlignRight
                    border.color: "white"
                    color: base.color
                    radius: 5

                    ColumnLayout{
                        width: parent.width-5
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5

                        CustomControls.Info{
                            id: info_robType
                            Layout.preferredHeight: 15
                            Layout.fillWidth: true
                            infoType: "RobType"
                            value: "None"
                        }

                        CustomControls.Info{
                            id: info_serialNo
                            Layout.preferredHeight: 15
                            Layout.fillWidth: true
                            infoType: "SerialNo"
                            value: "None"
                        }

                        CustomControls.Info{
                            id: info_swVersion
                            Layout.preferredHeight: 15
                            Layout.fillWidth: true
                            infoType: "SWVersion"
                            value: "None"
                        }
                        CustomControls.Info{
                            id: info_pos
                            Layout.preferredHeight: 15
                            Layout.fillWidth: true
                            infoType: "(x,y,z)"
                            value: "None"
                        }
                        CustomControls.Info{
                            id: info_orient
                            Layout.preferredHeight: 15
                            Layout.fillWidth: true
                            infoType: "(q1,q2,q3,q4)"
                            value: "None"
                        }
                        CustomControls.Info{
                            id: info_config
                            Layout.preferredHeight: 15
                            Layout.fillWidth: true
                            infoType: "()"
                            value: "None"
                        }
                        CustomControls.Info{
                            id: info_extax
                            Layout.preferredHeight: 15
                            Layout.fillWidth: true
                            infoType: "()"
                            value: "None"
                        }
                    }
                }
            }
        }

        CustomControls.Logger{
            Layout.fillWidth: true
            Layout.minimumHeight: 25
            Layout.preferredHeight: 35
            Layout.alignment: Qt.AlignBottom
            Layout.margins: 3

            content: "Messages will be shown here..."
        }
    }

}
