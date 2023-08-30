import QtQuick 2.0

Item {
    property string fontColor: "#f0eded"
    Connections{
        target:audioController
        onVolumeLevelChanged: {
            console.log("test")
            volumeIcon.visible = false
            visibleTimer.stop()
            visibleTimer.start()
        }
    }
    Timer{
        id:visibleTimer
        interval: 500
        repeat:false
        onTriggered: {
            volumeIcon.visible = true
        }
    }

    Rectangle{
        id:decrementButton
        anchors{
            right:volumeIcon.left
            rightMargin: 15
            top:parent.top
            bottom:parent.bottom
        }
        width:height/2
        color:"black"
        Text{
            id:decrementText
            anchors.centerIn: parent
            text:"<"
            font.pixelSize: 15
            color:fontColor
        }
        MouseArea{
            anchors.fill:parent
            onClicked: audioController.incrementVolume(-1)
        }
    }
    Image{
        id:volumeIcon
        height: parent.height * .5
        fillMode: Image.PreserveAspectFit
        anchors{
            right:incrementButton.left
            rightMargin: 15
            verticalCenter: parent.verticalCenter
        }
        source: {
            if(audioController.volumeLevel <= 1)
                return "file:/home/jetson/Desktop/Qt_Tesla_HU/TeslaInfotainment/ui/assets/mute.png"
            else if(audioController.volumeLevel <= 50)
                return "file:/home/jetson/Desktop/Qt_Tesla_HU/TeslaInfotainment/ui/assets/volume1.png"
            else
                return "file:/home/jetson/Desktop/Qt_Tesla_HU/TeslaInfotainment/ui/assets/volume2.png"
        }
    }

    Text{
        id:volumeTextLabel
        visible: !volumeIcon.visible
        anchors{
            centerIn:volumeIcon
        }
        color:fontColor
        font.pixelSize: 24
        text:audioController.volumeLevel
    }

    Rectangle{
        id:incrementButton
        anchors{
            right:parent.right
            rightMargin: 17
            top:parent.top
            bottom:parent.bottom
        }
        width:height/2
        color:"black"
        Text{
            id:incrementText
            anchors.centerIn: parent
            text:">"
            font.pixelSize: 15
            color:fontColor
        }
        MouseArea{
            anchors.fill:parent
            onClicked: audioController.incrementVolume(1)
        }
    }
}
