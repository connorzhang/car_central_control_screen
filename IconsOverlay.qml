import QtQuick

Item {
    id: root

    component Telltale : Item {
        property string iconName: ""
        property int size: 28
        width: size
        height: size

        Image {
            anchors.fill: parent
            source: "file:///" + "I:/GIT/QT/汽车中控屏/icons/" + parent.iconName + ".svg"
            fillMode: Image.PreserveAspectFit
            smooth: true
            antialiasing: true
            sourceSize.width: parent.size
            sourceSize.height: parent.size
        }
    }

    Row {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 18
        anchors.leftMargin: 18
        spacing: 14

        Telltale { iconName: "turn_left"; size: 34 }
    }

    Row {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 18
        anchors.rightMargin: 18
        layoutDirection: Qt.RightToLeft
        spacing: 14

        Telltale { iconName: "turn_right"; size: 34 }
    }

    Text {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        text: "06:36"
        color: "#101010"
        font.pixelSize: 26
        font.bold: true
    }
}

