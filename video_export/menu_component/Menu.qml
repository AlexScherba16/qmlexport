import QtQuick 2.12
import QtQuick.Controls 2.12


Rectangle {
    id: menuRoot
    Row {
        id: row
        anchors.fill: parent
        leftPadding: 24
        rightPadding: 24
        topPadding: 24
        bottomPadding: 24
        spacing: 16

        SearchButton {
            id: searchButton
        }

        ExportButton {
            id: exportButton
        }

        FormatButton {
            id: formatButton
        }

        ChunkButton {
            id: chunkButton
        }

        ImportButton {
            id: importButton
        }

        ExitButton {
            id: exitButton
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
