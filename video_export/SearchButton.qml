import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12


Rectangle {
    property int chunkLength: 120

    width: buttonLabel.contentWidth + 32
    height: 48
    radius: 4
    color: "#FFFFFF"
//    border.color : "black"
//    border.width: 1
    //    layer.enabled: true
    //    layer.effect: DropShadow {
    //        transparentBorder: true
    //        horizontalOffset: 3
    //        verticalOffset: 3
    //    }

    //    Rectangle {
    //        id: background
    //        anchors.fill: parent
    //        color: "white"
    //    }


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

        id: buttonLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 12
        text: "Поиск hdd"
        color: "#17181B"
    }

}
