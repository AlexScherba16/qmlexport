import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    property string buttonText:"GradientButton"

    width: buttonLabel.contentWidth + 32
    height: 48
    radius: 3

    signal importButtonClicked()

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

    Text{
        id: buttonLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 12
        text: parent.buttonText
        color: "#FFFFFF"
    }

    MouseArea{
        id: buttonMouseArea
        anchors.fill: parent
        hoverEnabled: true

        onPressed: parent.gradient = pressedGradient
        onEntered: parent.gradient = hoverGradient
        onExited: parent.gradient = normalGradient

        onReleased: {
            parent.gradient = buttonMouseArea.containsMouse ? hoverGradient :
                                                              normalGradient
            parent.importButtonClicked()
        }
    }
    gradient: buttonMouseArea.pressed ? pressedGradient : normalGradient
}
