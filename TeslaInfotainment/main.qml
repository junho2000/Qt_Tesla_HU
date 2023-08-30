import QtQuick 2.9
import QtQuick.Window 2.2
import "ui/BottomBar"
import "ui/RightScreen"
import "ui/LeftScreen"

Window {
    visible: true
    width: 1280
    height: 720
    title: qsTr("Tesla Infotainment")
    //visibility: "FullScreen"

    RightScreen{
        id:rightScreen
    }

    LeftScreen{
        id:leftScreen
    }

    BottomBar{
        id:bottomBar
    }
}
