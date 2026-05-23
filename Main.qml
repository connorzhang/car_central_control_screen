import QtQuick
import QtQuick.Controls

Item {
    width: 1024
    height: 390

    Scene3D {
        anchors.fill: parent
    }

    DashboardLeft {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: parent.width * 0.35
    }

    DashboardRight {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: parent.width * 0.35
    }

    IconsOverlay {
        anchors.fill: parent
    }
}

