import QtQuick 2.0

Rectangle {
    id:navSearchBox
    radius:5
    color:"#f0f0f0"

    Image{
        id:searchIcon
        anchors{
            left:parent.left
            leftMargin: 15
            verticalCenter: parent.verticalCenter
        }
        height: parent.height*.6
        fillMode: Image.PreserveAspectFit
        source: "file:/home/jetson/Desktop/Qt_Tesla_HU/TeslaInfotainment/ui/assets/search.png"
    }

    Text{
        id:navigationPlaceHolderText
        visible: navigationTextInput.text === ""
        color:"#373737"
        text:"Navigate"
        anchors{
            verticalCenter: parent.verticalCenter
            left:searchIcon.right
            leftMargin: 20
        }
    }

    TextInput{
        id:navigationTextInput
        clip:true
        anchors{
            top:parent.top
            bottom:parent.bottom
            right:parent.right
            left:searchIcon.right
            leftMargin: 20
        }
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 16
    }

}
