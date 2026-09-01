import os
import sys
from pathlib import Path

from PySide6.QtCore import QUrl
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuick import QQuickWindow

from app.ui.app_controller import AppController
from app.utils import get_logger

logger = get_logger("main_window")


def qml_main_path():
    if getattr(sys, "frozen", False):
        base = Path(sys.executable).parent
        qml_path = base / "qml" / "Main.qml"
        if qml_path.exists():
            return QUrl.fromLocalFile(str(qml_path))
        internal_qml = base / "_internal" / "qml" / "Main.qml"
        if internal_qml.exists():
            return QUrl.fromLocalFile(str(internal_qml))
    else:
        base = Path(__file__).parent
    return QUrl.fromLocalFile(str(base / "qml" / "Main.qml"))


class MainWindow:
    def __init__(self):
        self.engine = QQmlApplicationEngine()
        self.controller = AppController()
        self.engine.rootContext().setContextProperty("App", self.controller)
        qml_path = qml_main_path()
        logger.info("Loading QML from: %s", qml_path.toLocalFile())
        self.engine.load(qml_path)
        if not self.engine.rootObjects():
            logger.error("QML failed to load: %s", qml_path.toLocalFile())
        self.valid = bool(self.engine.rootObjects())

    def run(self, app):
        window = self.engine.rootObjects()[0] if self.engine.rootObjects() else None
        if isinstance(window, QQuickWindow):
            logger.info("Starting maximized: %s", window.metaObject().className())
            window.showMaximized()
        result = app.exec()
        self.engine.deleteLater()
        app.processEvents()
        self.engine = None
        self.controller = None
        return result
