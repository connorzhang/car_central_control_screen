import QtQuick

Item {
    id: root

    Rectangle {
        anchors.fill: parent
        color: "transparent"
    }

    Text {
        id: speedText
        anchors.left: parent.left
        anchors.leftMargin: 40
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -10
        text: speedValue.toFixed(0)
        color: "#FFFFFF"
        font.pixelSize: 110
        font.bold: true
        style: Text.Outline
        styleColor: "#000000"
    }

    Text {
        anchors.left: speedText.left
        anchors.top: speedText.bottom
        anchors.topMargin: -6
        text: "mph"
        color: "#C8CFD9"
        font.pixelSize: 18
    }

    Text {
        anchors.left: speedText.right
        anchors.leftMargin: 18
        anchors.bottom: speedText.bottom
        anchors.bottomMargin: 22
        text: "D"
        color: "#FFFFFF"
        font.pixelSize: 26
        font.bold: true
        style: Text.Outline
        styleColor: "#000000"
    }

    Rectangle {
        anchors.left: speedText.left
        anchors.top: speedText.bottom
        anchors.topMargin: 22
        width: 210
        height: 6
        radius: 3
        color: "#1B1F26"
        opacity: 0.6

        Rectangle {
            width: parent.width * (rpmValue / 8000.0)
            height: parent.height
            radius: parent.radius
            color: "#1E88FF"
        }
    }

    Text {
        anchors.left: speedText.left
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 22
        text: "1200 mi  Normal"
        color: "#E9EEF6"
        font.pixelSize: 16
        opacity: 0.9
        style: Text.Outline
        styleColor: "#000000"
    }

    property real speedValue: 85
    property real rpmValue: 3200

    SequentialAnimation on speedValue {
        loops: Animation.Infinite
        NumberAnimation { to: 60; duration: 2500; easing.type: Easing.InOutSine }
        NumberAnimation { to: 85; duration: 2500; easing.type: Easing.InOutSine }
    }

    SequentialAnimation on rpmValue {
        loops: Animation.Infinite
        NumberAnimation { to: 1800; duration: 2500; easing.type: Easing.InOutSine }
        NumberAnimation { to: 4200; duration: 2500; easing.type: Easing.InOutSine }
    }
}

