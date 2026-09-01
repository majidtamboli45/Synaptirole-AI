import os
import sys
import traceback
from app.utils import get_logger

logger = get_logger("main")


def _excepthook(exc_type, exc_value, exc_tb):
    tb = "".join(traceback.format_exception(exc_type, exc_value, exc_tb))
    logger.critical("Unhandled exception: %s", tb)


def main():
    os.environ.setdefault("QT_QUICK_CONTROLS_STYLE", "Basic")
    selftest = "--selftest" in sys.argv
    if selftest:
        os.environ.setdefault("QT_QPA_PLATFORM", "offscreen")
        from PySide6.QtGui import QGuiApplication
        from app.ui.main_window import MainWindow
        app = QGuiApplication(sys.argv)
        window = MainWindow()
        if not window.valid:
            return 1
        print("SELFTEST_OK")
        return 0

    sys.excepthook = _excepthook

    from PySide6.QtCore import QTimer
    from PySide6.QtGui import QGuiApplication

    from app.ui.main_window import MainWindow

    app = QGuiApplication(sys.argv)
    app.setApplicationName("SynaptiRole AI")
    app.setOrganizationName("SynaptiRole")

    window = MainWindow()
    if not window.valid:
        return 1

    try:
        result = window.run(app)
    except Exception as e:
        logger.exception("Fatal error in application: %s", e)
        raise
    print("SELFTEST_OK")
    return result


if __name__ == "__main__":
    sys.exit(main())