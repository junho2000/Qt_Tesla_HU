import QtQuick 2.0

Rectangle{
    id:bottomBar
    anchors{
        left:parent.left
        right:parent.right
        bottom:parent.bottom
    }
    height:parent.height/12
    color:"black"

    Image{
        id:carSettingsIcon
        anchors{
            left:parent.left
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height:parent.height*.6
        fillMode:Image.PreserveAspectFit
        source:"file:/home/jetson/TeslaInfotainment/ui/assets/sedan-car-front.png"
    }
    HVACComponent{
        id:driverHVACControl
        anchors{
            top:parent.top
            bottom:parent.bottom
            left:carSettingsIcon.right
            leftMargin: 150
        }
        hvacController: driverHVAC

    }
    HVACComponent{
        id:passengerHVACControl
        anchors{
            top:parent.top
            bottom:parent.bottom
            right:volumeControl.left
            rightMargin: 300
        }
        hvacController: passengerHVAC

    }
    VolumeControlComponent{
        id:volumeControl
        anchors{
            right:parent.right
            rightMargin: 20
            verticalCenter: parent.verticalCenter
            top:parent.top
            bottom:parent.bottom
        }
    }
}
