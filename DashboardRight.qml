import QtQuick

Item {
    Rectangle {
        anchors.fill: parent
        color: "transparent"
    }

    Rectangle {
        anchors.right: parent.right
        anchors.rightMargin: 48
        anchors.top: parent.top
        anchors.topMargin: 110
        width: 72
        height: 72
        radius: 12
        color: "#2A1D40"
        opacity: 0.9
    }

    Text {
        anchors.right: parent.right
        anchors.rightMargin: 48
        anchors.top: parent.top
        anchors.topMargin: 200
        text: "I should be waiting"
        color: "#FFFFFF"
        font.pixelSize: 20
        style: Text.Outline
        styleColor: "#000000"
    }

    Text {
        anchors.right: parent.right
        anchors.rightMargin: 48
        anchors.top: parent.top
        anchors.topMargin: 228
        text: "wonderful U/Aga"
        color: "#C8CFD9"
        font.pixelSize: 14
        style: Text.Outline
        styleColor: "#000000"
        opacity: 0.9
    }

    Text {
        anchors.right: parent.right
        anchors.rightMargin: 48
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 24
        text: "23°C"
        color: "#E9EEF6"
        font.pixelSize: 22
        style: Text.Outline
        styleColor: "#000000"
    }
}

