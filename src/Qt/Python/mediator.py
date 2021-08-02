from PySide2.QtCore import QObject, Property, Signal, QStringListModel
from abbRobDriver import AbbRobDriver
from abbTypedef import *


class Mediator(QObject):
    _ip = "192.168.125.1"
    _port = 1025
    _robType = "None"
    _robSysInfo = None
    _isConnected = False
    _robotDriver = None

    ipChanged = Signal()
    portChanged = Signal()
    connectionStateChanged = Signal()
    robSysInfoChanged = Signal()

    def __init__(self, parent=None):
        super(Mediator, self).__init__(parent)
        self._robSysInfo = QStringListModel()
        self._robotDriver = AbbRobDriver()

    def get_ip(self):
        return self._ip

    def set_ip(self, ip: str):
        self._ip = ip

    ip = Property(str, get_ip, set_ip, notify=ipChanged)

    def get_port(self):
        return self._port

    def set_port(self, port: int):
        self._port = port

    port = Property(int, get_port, set_port, notify=portChanged)

    def get_rob_type(self):
        return self._robType

    def set_rob_type(self, rob_type: str):
        self._robType = rob_type

    rob_type = Property(str, get_rob_type, set_rob_type)

    def get_is_connected(self):
        return self._isConnected

    def set_is_connected(self, var: bool):
        if var:
            self.connect_to_robot()
            self._robSysInfo.setStringList(self._robotDriver.rob_sys_info.string_list)
            self.robSysInfoChanged.emit()
        else:
            self.disconnect_from_robot()

    is_connected = Property(bool, get_is_connected, set_is_connected, notify=connectionStateChanged)

    def get_rob_system_info(self):
        return self._robSysInfo

    def set_rob_system_info(self, val):
        pass

    rob_system_info = Property(QObject, get_rob_system_info, set_rob_system_info, notify=robSysInfoChanged)

    def connect_to_robot(self):
        if self._robotDriver is not None:
            pass
        if self._isConnected:
            return
        self._robotDriver.connect_to_rob(self._ip, self._port)
        if self._robotDriver.on_connect:
            self._isConnected = True
            self.connectionStateChanged.emit()

    def disconnect_from_robot(self):
        if not self._isConnected:
            return
        self._isConnected = False
        self.connectionStateChanged.emit()
