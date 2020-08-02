import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

Rectangle {
    id: root
    width: 136
    height: 48
    radius: 3
    color: "#FFFFFF"

    property string exportFormat: "avi"
    property FormatDialog win

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
        text: "Формат экспорта"
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
        text: exportFormat
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
            var component = Qt.createComponent("FormatDialog.qml");
            win = component.createObject(root);
            win.show();

        }
    }

    Connections {
        target: win
        function onExitFormatDialog(result) {
            root.exportFormat = result
            win.destroy()
        }
    }
}
