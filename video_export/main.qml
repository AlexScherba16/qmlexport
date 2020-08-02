import QtQuick 2.12
import QtQuick.Window 2.12
import "menu_component" as MenuComponent


Window {
    id: window
    visible: true
//    width: menu.width
//    height: menu.height
//    minimumHeight: menu.height
//    minimumWidth: menu.width
    flags: Qt.CoverWindow

    MenuComponent.Menu {
        id: menu

    }

}
