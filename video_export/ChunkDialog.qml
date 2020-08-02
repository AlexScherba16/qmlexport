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

    property int currentChunk: 10
    signal exitChunkDialog(int chunk)

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
            text: "Длительность"
            anchors.left: parent.left
            anchors.leftMargin: 56
            anchors.verticalCenter: handler.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 16
        }
    }

    Text {
        id: chunkText
        x: 96
        text: "Фрагмент"
        anchors.top: handler.bottom
        anchors.topMargin: 23
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Roboto"
        font.pixelSize: 14
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
                var result = tumbler.currentIndex < 5 ?
                            0 :
                            tumbler.currentIndex
                root.exitChunkDialog(result)
            }
        }
        gradient: buttonMouseArea.pressed ? pressedGradient : normalGradient
    }

    Tumbler {
        id: tumbler
        anchors.top: chunkText.bottom
        anchors.topMargin: 10
        anchors.bottom: okButton.top
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        wrap: true
        visibleItemCount: 4
        currentIndex: 10
        model: 61
    }
}

/*##^##
Designer {
    D{i:19;anchors_height:61;anchors_width:82;anchors_x:70;anchors_y:93}
}
##^##*/
