import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12


Rectangle {
    property int chunkLength: 120

    width: upper.contentWidth + 32
    height: 48
    radius: 3
    color: "#FFFFFF"
//    border.color : "black"
//    border.width: 1

    RectangularGlow {
        id: effect
        anchors.fill: parent
        glowRadius: 1
        spread: 0.2
        color: "black"
        cornerRadius: parent.radius + glowRadius
        z: -1
    }

    Text{

        id: upper
        anchors.top: parent.top
        anchors.topMargin: 7
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 12
        text: "Формат экспорта"
        color: "#17181B"
    }

    Text{

        id: lower
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 7
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 12
        text: "MP4"
        color: "#17181B"
    }
}
