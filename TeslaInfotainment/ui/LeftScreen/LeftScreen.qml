import QtQuick 2.0

Rectangle{
    id:leftScreen
    anchors{
        left:parent.left
        right:rightScreen.left
        bottom:bottomBar.top
        top:parent.top
    }
    color:"white"

    Image{
        id:carRender
        anchors.centerIn: parent
        width:parent.width*.9
        fillMode: Image.PreserveAspectFit
        //source:"qrc:/ui/assets/carRender.jpg"
        source:"file:/home/jetson/Desktop/Qt_Tesla_HU/TeslaInfotainment/ui/assets/tesla_car.png" //from local directory
    }
}
