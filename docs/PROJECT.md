# 项目说明

## 1. 概述

本工程为车机仪表/中控屏原型的可运行实现，聚焦：

- 透明化 3D 道路/车流动效（示意）
- UI 图标与信息层叠加展示

## 2. 运行（Windows）

```powershell
python run_mock.py
```

## 3. 构建（Qt/CMake）

工程提供 CMake + C++ 入口用于后续集成：

- [CMakeLists.txt](file:///i:/GIT/QT/汽车中控屏/CMakeLists.txt)
- [main.cpp](file:///i:/GIT/QT/汽车中控屏/main.cpp)

## 4. 主要模块

- [Main.qml](file:///i:/GIT/QT/汽车中控屏/Main.qml)：界面层级与布局
- [Scene3D.qml](file:///i:/GIT/QT/汽车中控屏/Scene3D.qml)：3D 场景与车道/车流规则
- [CarModel.qml](file:///i:/GIT/QT/汽车中控屏/CarModel.qml)：车辆简易 3D 模型
- [IconsOverlay.qml](file:///i:/GIT/QT/汽车中控屏/IconsOverlay.qml)：图标叠加层
- [icons/](file:///i:/GIT/QT/汽车中控屏/icons)：本地图标资源
