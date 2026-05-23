import QtQuick
import QtQuick3D

Item {
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#E5E9EE" }
            GradientStop { position: 0.55; color: "#D0D6DF" }
            GradientStop { position: 1.0; color: "#B8C1CD" }
        }
    }

    View3D {
        anchors.fill: parent
        environment: SceneEnvironment {
            clearColor: "transparent"
            backgroundMode: SceneEnvironment.Transparent
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.High
        }

        PerspectiveCamera {
            position: Qt.vector3d(0, 300, 800)
            eulerRotation.x: -15
        }

        DirectionalLight {
            position: Qt.vector3d(0, 1000, 1000)
            eulerRotation.x: -45
            brightness: 1.5
            ambientColor: "#808080"
        }

        Model {
            source: "#Rectangle"
            scale: Qt.vector3d(1.0, 150, 1.0)
            eulerRotation.x: -90
            position: Qt.vector3d(0, 0, -2000)
            materials: PrincipledMaterial { baseColor: "#A5AFBC"; opacity: 0.9; alphaMode: PrincipledMaterial.Blend }
        }
        Model {
            source: "#Rectangle"
            scale: Qt.vector3d(1.0, 150, 1.0)
            eulerRotation.x: -90
            position: Qt.vector3d(-100, 0, -2000)
            materials: PrincipledMaterial { baseColor: "#A5AFBC"; opacity: 0.35; alphaMode: PrincipledMaterial.Blend }
        }
        Model {
            source: "#Rectangle"
            scale: Qt.vector3d(1.0, 150, 1.0)
            eulerRotation.x: -90
            position: Qt.vector3d(100, 0, -2000)
            materials: PrincipledMaterial { baseColor: "#A5AFBC"; opacity: 0.35; alphaMode: PrincipledMaterial.Blend }
        }
        Model {
            source: "#Rectangle"
            scale: Qt.vector3d(1.5, 150, 1.0)
            eulerRotation.x: -90
            position: Qt.vector3d(-225, 0, -2000)
            materials: PrincipledMaterial { baseColor: "#A5AFBC"; opacity: 0.06; alphaMode: PrincipledMaterial.Blend }
        }
        Model {
            source: "#Rectangle"
            scale: Qt.vector3d(1.5, 150, 1.0)
            eulerRotation.x: -90
            position: Qt.vector3d(225, 0, -2000)
            materials: PrincipledMaterial { baseColor: "#A5AFBC"; opacity: 0.06; alphaMode: PrincipledMaterial.Blend }
        }

        Node {
            id: linesNode
            PropertyAnimation on z { from: -1000; to: 0; duration: 800; loops: Animation.Infinite }

            Repeater3D {
                model: 15
                Model {
                    source: "#Rectangle"
                    scale: Qt.vector3d(0.1, 4, 1)
                    eulerRotation.x: -90
                    position: Qt.vector3d(-50, 1, -2000 + index * 300)
                    materials: PrincipledMaterial { baseColor: "#FFFFFF" }
                }
            }
            Repeater3D {
                model: 15
                Model {
                    source: "#Rectangle"
                    scale: Qt.vector3d(0.1, 4, 1)
                    eulerRotation.x: -90
                    position: Qt.vector3d(50, 1, -2000 + index * 300)
                    materials: PrincipledMaterial { baseColor: "#FFFFFF" }
                }
            }
        }

        CarModel {
            id: egoCar
            position: Qt.vector3d(0, 0, 200)
            bodyColor: "#FFFFFF"
            SequentialAnimation on position.y {
                loops: Animation.Infinite
                NumberAnimation { to: 2; duration: 1000; easing.type: Easing.InOutSine }
                NumberAnimation { to: 0; duration: 1000; easing.type: Easing.InOutSine }
            }
        }

        CarModel {
            id: trafficCar1
            property real speedZ: 80.0
            position: Qt.vector3d(0, 0, -2200)
            bodyColor: "#AA0000"
        }

        CarModel {
            id: trafficCar2
            property real speedZ: -260.0
            position: Qt.vector3d(-100, 0, 900)
            bodyColor: "#0000AA"
        }

        CarModel {
            id: trafficCar3
            property real speedZ: 140.0
            position: Qt.vector3d(100, 0, -2800)
            bodyColor: "#AAAAAA"
        }

        FrameAnimation {
            running: true
            onTriggered: {
                var dt = frameTime
                var safeDist = 900

                trafficCar2.z += trafficCar2.speedZ * dt
                trafficCar3.z += trafficCar3.speedZ * dt
                trafficCar1.z += trafficCar1.speedZ * dt

                var laneCars = [egoCar, trafficCar1]
                laneCars.sort(function(a, b) { return b.z - a.z })
                for (var i = 0; i < laneCars.length - 1; i++) {
                    var behind = laneCars[i]
                    var ahead = laneCars[i + 1]
                    if ((behind.z - ahead.z) < safeDist) {
                        ahead.z = behind.z - safeDist
                    }
                }

                if (trafficCar1.z > 1200) trafficCar1.z = -4200
                if (trafficCar2.z < -4200) trafficCar2.z = 1200
                if (trafficCar3.z > 1200) trafficCar3.z = -4200
            }
        }
    }
}

