import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

Rectangle {

    function getExportItemLen(){
        var len = upper.contentWidth > lower.contentWidth ?
                    upper.contentWidth : lower.contentWidth;
        return len + 32
    }

    property string exportPath: "TEST_PATH"

    width: getExportItemLen()
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
        text: "Адрес экспорта"
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
        text: exportPath
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
            var oldLen = getExportItemLen()
            upper.font.weight = Font.Bold
            lower.font.weight = Font.Bold
            var newLen = getExportItemLen()
            if (Math.abs(oldLen - newLen) > 10)
                parent.width = oldLen
            else
                parent.width = newLen

        }
        onExited: {
            upper.font.weight = Font.Normal
            lower.font.weight = Font.Normal
        }

        onReleased: {
            parent.width = getExportItemLen()
            upper.font.weight = buttonMouseArea.containsMouse ? Font.Bold :
                                                                Font.Normal
            lower.font.weight = upper.font.weight
            parent.border.width = 0
        }
    }
}
