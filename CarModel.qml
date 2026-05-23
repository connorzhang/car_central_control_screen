import QtQuick
import QtQuick3D

Node {
    id: root
    property color bodyColor: "#FFFFFF"
    property color glassColor: "#121212"

    Node {
        scale: Qt.vector3d(0.4, 0.4, 0.4)

        Model {
            source: "#Cube"
            scale: Qt.vector3d(1.0, 0.4, 2.2)
            position: Qt.vector3d(0, 20, 0)
            materials: PrincipledMaterial {
                baseColor: root.bodyColor
                metalness: 0.7
                roughness: 0.25
            }
        }

        Model {
            source: "#Cube"
            scale: Qt.vector3d(0.8, 0.35, 1.2)
            position: Qt.vector3d(0, 57, -10)
            materials: PrincipledMaterial {
                baseColor: root.glassColor
                metalness: 0.2
                roughness: 0.2
                opacity: 0.75
                alphaMode: PrincipledMaterial.Blend
            }
        }

        Model {
            source: "#Cube"
            scale: Qt.vector3d(0.9, 0.2, 0.1)
            position: Qt.vector3d(0, 20, 110)
            materials: PrincipledMaterial { baseColor: "#050505" }
        }

        Model {
            source: "#Cube"
            scale: Qt.vector3d(0.25, 0.1, 0.05)
            position: Qt.vector3d(30, 25, 112)
            materials: PrincipledMaterial { baseColor: "#FFFFFF"; emissiveFactor: Qt.vector3d(1, 1, 1) }
        }
        Model {
            source: "#Cube"
            scale: Qt.vector3d(0.25, 0.1, 0.05)
            position: Qt.vector3d(-30, 25, 112)
            materials: PrincipledMaterial { baseColor: "#FFFFFF"; emissiveFactor: Qt.vector3d(1, 1, 1) }
        }

        Model {
            source: "#Cube"
            scale: Qt.vector3d(0.9, 0.08, 0.05)
            position: Qt.vector3d(0, 30, -112)
            materials: PrincipledMaterial { baseColor: "#FF0000"; emissiveFactor: Qt.vector3d(1, 0, 0) }
        }

        Node {
            Model {
                source: "#Cylinder"
                scale: Qt.vector3d(0.4, 0.15, 0.4)
                eulerRotation.z: 90
                position: Qt.vector3d(50, 15, 70)
                materials: PrincipledMaterial { baseColor: "#111111"; roughness: 0.9 }
            }
            Model {
                source: "#Cylinder"
                scale: Qt.vector3d(0.4, 0.15, 0.4)
                eulerRotation.z: 90
                position: Qt.vector3d(-50, 15, 70)
                materials: PrincipledMaterial { baseColor: "#111111"; roughness: 0.9 }
            }
            Model {
                source: "#Cylinder"
                scale: Qt.vector3d(0.4, 0.15, 0.4)
                eulerRotation.z: 90
                position: Qt.vector3d(50, 15, -70)
                materials: PrincipledMaterial { baseColor: "#111111"; roughness: 0.9 }
            }
            Model {
                source: "#Cylinder"
                scale: Qt.vector3d(0.4, 0.15, 0.4)
                eulerRotation.z: 90
                position: Qt.vector3d(-50, 15, -70)
                materials: PrincipledMaterial { baseColor: "#111111"; roughness: 0.9 }
            }
        }
    }
}

