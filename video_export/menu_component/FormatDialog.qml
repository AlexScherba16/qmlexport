import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.1

Window {
    id: root
    width: 232
    height: 224
    color: "#ffffff"
    flags :  Qt.Dialog | Qt.CustomizeWindowHint
    modality: Qt.WindowModal

    property string currentExportFormat: "TEST_FORMAT"
    signal exitFormatDialog(string format)

    Rectangle {
        id: handler
        height: 41
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0; color: "#1e2d4b" }
            GradientStop { position: 1; color: "#323e70" }
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

    Rectangle {
        id: okButton
        y: 175
        height: 32

        Gradient {
            id: normalGradient
            orientation: Gradient.Horizontal
            GradientStop { position: 0.0; color: "#1E2D4B"}
            GradientStop { position: 1.0; color: "#323E70"}
        }

        Gradient {
            id: pressedGradient
            orientation: Gradient.Horizontal
            GradientStop { position: 0.0; color: "#1A2741"}
            GradientStop { position: 1.0; color: "#1A2741"}
        }
        Gradient {
            id: hoverGradient
            orientation: Gradient.Horizontal
            GradientStop { position: 0.0; color: "#233B6C" }
            GradientStop { position: 1.0; color: "#4E5EA0" }
        }

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 16
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: 30

        Text {
            id: okText
            color: "#ffffff"
            text: qsTr("Ок")
            font.family: "Roboto"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.pixelSize: 14
        }
        MouseArea{
            id: buttonMouseArea
            anchors.fill: parent
            hoverEnabled: true

            onPressed: parent.gradient = pressedGradient
            onEntered: parent.gradient = hoverGradient
            onExited: parent.gradient = normalGradient

            onReleased: {
                if(aviButton.checked)
                    root.exitFormatDialog(aviButton.text)
                if(mp4Button.checked)
                    root.exitFormatDialog(mp4Button.text)
            }
        }
        gradient: buttonMouseArea.pressed ? pressedGradient : normalGradient
    }
}
