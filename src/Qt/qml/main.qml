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

                    onCurrentTextChanged: {
                        mediator.rob_type = comboBox_robType.currentText
                        logger.log("set robot type to "+comboBox_robType.currentText)
                    }
                }

                Label{
                    Layout.fillWidth: true
                    Layout.margins: 5
                    font.pixelSize: 15
                    font.bold: true
                    text: qsTr("IP:")
                }

                CustomControls.LineEdit{
                    id: lineEdit_ip
                    Layout.fillWidth: true
                    Layout.minimumWidth: 125
                    Layout.preferredWidth: 150
                    Layout.preferredHeight: 25

                    content: mediator.ip

                    onEdittingFinished: {
                        mediator.ip = content
                        logger.log("set ip address to " + content)
                    }

                }

                Label{
                    Layout.fillWidth: true
                    Layout.margins: 5
                    font.pixelSize: 15
                    font.bold: true
                    text: qsTr("PORT:")
                }

                CustomControls.LineEdit{
                    id: lineEdit_port
                    Layout.fillWidth: true
                    Layout.minimumWidth: 45
                    Layout.preferredWidth: 60
                    Layout.preferredHeight: 25

                    content: qsTr(Number(mediator.port).toString())

                    onEdittingFinished: {
                        mediator.port = Number(content)
                        logger.log("set port to " + content)
                    }
                }

                Button{
                    property bool isConnected: false

                    id: button_connect
                    Layout.fillWidth: true
                    Layout.preferredHeight: 25
                    Layout.preferredWidth: 100
                    Layout.alignment: Qt.AlignRight
                    Layout.margins: 5
                    font.pixelSize: 12
                    highlighted: true
                    text: qsTr("CONNECT") 

                    onClicked: {
                        mediator.is_connected = !isConnected
                    }

                    states: [
                        State {
                            name: "Connected"
                            when: mediator.is_connected
                            PropertyChanges {
                                target: button_connect
                                text: qsTr("DISCONNECT")
                                isConnected: true
                            }
                            PropertyChanges {
                                target: lineEdit_ip
                                enabled:false
                                color: "lightgray"
                            }
                            PropertyChanges {
                                target: lineEdit_port
                                enabled:false
                                color: "lightgray"
                            }
                        },
                        State {
                            name: "Disconnected"
                            when: !mediator.is_connected
                            PropertyChanges {
                                target: button_connect
                                text: qsTr("CONNECT")
                                isConnected: false
                            }
                            PropertyChanges {
                                target: lineEdit_ip
                                enabled:true
                                color: "white"
                            }
                            PropertyChanges {
                                target: lineEdit_port
                                enabled:true
                                color: "white"
                            }
                        }
                    ]
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

                        CustomControls.TitleBar{
                            text: "systemInfo"
                            color: "black"
                            Layout.preferredHeight: 15
                            Layout.fillWidth: true
                        }

                        CustomControls.TwoLayerInfo{
                            id: twoLayerInfo_sys
                            title: "sysInfo"
                            Layout.fillWidth: true
                            Layout.minimumHeight: 60
                            content: mediator.rob_system_info
                        }

                        CustomControls.TitleBar{
                            text: "robTarget"
                            color: "black"
                            Layout.preferredHeight: 15
                            Layout.fillWidth: true
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
            id: logger
            Layout.fillWidth: true
            Layout.minimumHeight: 25
            Layout.preferredHeight: 35
            Layout.alignment: Qt.AlignBottom
            Layout.margins: 3

            content: "Messages will be shown here..."
        }
    }

}
