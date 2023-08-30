import QtQuick 2.0
import QtLocation 5.9
import QtPositioning 5.9
Rectangle{
    id:rightScreen
    anchors{
        top:parent.top
        bottom:bottomBar.top
        right:parent.right
    }

    Map{
        id:map
        anchors.fill:parent
        plugin: Plugin{
            id:mapPlugin
            name:"osm"
        }
        center:marker.coordinate
        //QtPositioning.coordinate(37.46,-122.14) //Palo Alto
        zoomLevel: 17

        MapQuickItem{
            id:marker
            anchorPoint.x: 10
            anchorPoint.y: 10
            width:15
            coordinate: QtPositioning.coordinate(37.46,-122.14)
            sourceItem: Image{
                id:car //add degree
                width: 30
                fillMode: Image.PreserveAspectFit
                source: "file:/home/jetson/TeslaInfotainment/ui/assets/car.png"
            }
        }

    }

    Image{
        id:lockIcon
        anchors{
            left:parent.left
            top:parent.top
            margins: 10
        }
        width: parent.width/40
        fillMode: Image.PreserveAspectFit
        source: (systemHandler.carLocked ? "file:/home/jetson/TeslaInfotainment/ui/assets/padlock.png" : "file:/home/jetson/TeslaInfotainment/ui/assets/padlock-unlock.png")
        MouseArea{
            anchors.fill: parent
            onClicked: systemHandler.setCarLocked(!systemHandler.carLocked)
        }
    }

    Text{
        id:dateTimeDisplay
        anchors{
            left:lockIcon.right
            leftMargin: 20
            bottom:lockIcon.bottom
        }
        font.pixelSize: 12
        font.bold:true
        color:"black"
        text:systemHandler.currentTime
    }

    Text{
        id:outdoorTemperatureDisplay
        anchors{
            left:dateTimeDisplay.right
            leftMargin: 20
            bottom:lockIcon.bottom
        }
        font.pixelSize: 12
        font.bold:true
        color:"black"
        text:systemHandler.outdoorTemp + "°"
    }

    Image{
        id:userIcon
        anchors{
            left:outdoorTemperatureDisplay.right
            leftMargin: 20
            bottom: lockIcon.bottom
        }
        width: parent.width/60
        fillMode: Image.PreserveAspectFit
        source: "file:/home/jetson/TeslaInfotainment/ui/assets/user.png"
    }

    Text{
        id:userNameDisplay
        anchors{
            left:userIcon.right
            leftMargin: 5
            bottom:lockIcon.bottom
        }
        font.pixelSize: 12
        font.bold:true
        color:"black"
        text:systemHandler.name
    }

    NavigationSearchBox{
        id:navSearchBox
        width:parent.width*1/3
        height:parent.height*1/12
        anchors{
            left:lockIcon.left
            top:lockIcon.bottom
            topMargin: 15

        }
    }

    width:parent.width*2/3
}
