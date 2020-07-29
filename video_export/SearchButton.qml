import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12


Rectangle {
//    property int itemWidth: buttonLabel.contentWidth + 32

    width: 96//itemWidth
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
        font.family: "Roboto"
        font.styleName: "normal"
        font.weight: Font.Normal
        font.pixelSize: 13

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: "Поиск hdd"
        color: "#17181B"
    }

    MouseArea{
        id: buttonMouseArea
        anchors.fill: parent
        hoverEnabled: true

//        onPressed: parent.gradient = pressedGradient
        onEntered: {
            buttonLabel.font.weight = Font.Bold
        }
        onExited: {
            buttonLabel.font.weight = Font.Normal
        }

//        onReleased: {
//            parent.gradient = buttonMouseArea.containsMouse ? hoverGradient :
//                                                              normalGradient
//            parent.importButtonClicked()
//        }
    }


//    Text { font.family: "Helvetica"; font.pointSize: 13; font.bold: true }

}
