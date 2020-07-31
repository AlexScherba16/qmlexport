import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    id: root
    width: 232
    height: 224
    color: "#ffffff"
    property alias importButton: importButton
    border.width: 2

    Rectangle {
        id: handler
        height: 41
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0
                color: "#1e2d4b"
            }

            GradientStop {
                position: 1
                color: "#323e70"
            }
        }

        Text {
            id: handleText
            x: 56
            y: 13
            width: 103
            height: 16
            color: "#ffffff"
            text: "Конвертация"
            anchors.left: parent.left
            anchors.leftMargin: 56
            anchors.verticalCenter: handler.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 16
        }
    }

    Text {
        id: formatText
        x: 96
        text: "Выберите формат"
        anchors.top: handler.bottom
        anchors.topMargin: 23
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Roboto"
        font.pixelSize: 14
    }

    RadioButton {
        id: aviButton
        y: 89
        width: 111
        height: 25
        text: qsTr("avi")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.left: parent.left
        anchors.leftMargin: 60
        scale: 0.8
        checked: true
        font.pointSize: 16
    }

    RadioButton {
        id: mp4Button
        width: 111
        height: 25
        text: qsTr("mp4")
        anchors.top: aviButton.bottom
        anchors.topMargin: 16
        font.pointSize: 16
        checked: false
        scale: 0.8
        anchors.left: aviButton.left
    }

    ImportButton {
        id: importButton
        buttonText: "Ok"

        x: 38
        y: 171
        width: 159
        height: 39
    }


}


/*##^##
Designer {
    D{i:5;anchors_x:57}D{i:1;anchors_width:208;anchors_x:12;anchors_y:17}D{i:6;anchors_y:115}
D{i:7;anchors_x:173}D{i:8;anchors_x:173;anchors_y:151}
}
##^##*/
