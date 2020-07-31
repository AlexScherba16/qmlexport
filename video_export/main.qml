import QtQuick 2.12
import QtQuick.Window 2.12


Window {
    id: window
    visible: true
    width: 652
    height: 480
    minimumHeight: 480
    minimumWidth: 780
    flags: Qt.CoverWindow
    //    title: qsTr("Hello World")


    SearchButton{
        anchors.topMargin: 20
        id: searchButton
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 15
    }


    ExportButton{
        anchors.topMargin: 20
        id: exportButton
        anchors.top: parent.top
        anchors.left: searchButton.right
        anchors.leftMargin: 15
    }

    FormatButton{
        anchors.topMargin: 20
        id: formatButton
        anchors.top: parent.top
        anchors.left: exportButton.right
        anchors.leftMargin: 15
    }

    ChunkButton{
        anchors.topMargin: 20
        id: chunkButton
        anchors.top: parent.top
        anchors.left: formatButton.right
        anchors.leftMargin: 15
    }

    ImportButton{
        anchors.topMargin: 20
        id: importButton
        anchors.top: parent.top
        anchors.left: chunkButton.right
        anchors.leftMargin: 15
        buttonText: "Импортировать"

    }

    ExitButton{
        anchors.topMargin: 20
        anchors.top: parent.top
        anchors.left: importButton.right
        anchors.leftMargin: 15
        buttonText: "Выход"
        onExitButtonClicked: Qt.quit()
    }



    FormatDialog {
        id: formatDialog
        x: 126
        y: 128
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: exportButton.left
    }
}
