# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine

from mediator import Mediator


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    mediator = Mediator()
    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("mediator", mediator)
    engine.load(os.fspath(Path(__file__).resolve().parent / "../qml/main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
