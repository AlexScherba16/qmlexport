import QtQuick 2.12
import QtQuick.Window 2.12
import "menu_component" as MenuComponent


Window {
    id: window
    visible: true
    flags: Qt.CoverWindow

    MenuComponent.Menu {
        id: menu

    }
}
