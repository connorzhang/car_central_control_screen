import os
import sys

from PySide6.QtCore import QUrl
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine


def main() -> int:
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    base_dir = os.path.dirname(os.path.abspath(__file__))
    qml = os.path.join(base_dir, "Main.qml")
    engine.load(QUrl.fromLocalFile(qml))

    if not engine.rootObjects():
        return 1

    return app.exec()


if __name__ == "__main__":
    raise SystemExit(main())

