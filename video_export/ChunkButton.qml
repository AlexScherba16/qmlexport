import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

Rectangle {
    property int chunkLength: 120

    width: 150
    height: 48
    radius: 3
    color: "#FFFFFF"

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
        font.family: "Roboto"
        font.styleName: "normal"
        font.weight: Font.Normal
        font.pixelSize: 12

        anchors.top: parent.top
        anchors.topMargin: 7
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Длительность"
        color: "#17181B"
    }

    Text{
        id: lower
        font.family: "Roboto"
        font.styleName: "normal"
        font.weight: Font.Normal
        font.pixelSize: 12

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 7
        anchors.horizontalCenter: parent.horizontalCenter
        text: "фрагментов 10 мин"
        color: "#17181B"
    }

    MouseArea{
        id: buttonMouseArea
        anchors.fill: parent
        hoverEnabled: true

        onPressed: {
            upper.font.weight = Font.Normal
            lower.font.weight = Font.Normal
            parent.border.color = "black"
            parent.border.width = 1
        }
        onEntered:{
            upper.font.weight = Font.Bold
            lower.font.weight = Font.Bold
        }
        onExited: {
            upper.font.weight = Font.Normal
            lower.font.weight = Font.Normal
        }

        onReleased: {
            upper.font.weight = buttonMouseArea.containsMouse ? Font.Bold :
                                                                Font.Normal
            lower.font.weight = upper.font.weight
            parent.border.width = 0
        }
    }
}
