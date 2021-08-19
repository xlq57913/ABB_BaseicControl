from PySide2.QtCore import QObject, Property, Signal, QStringListModel
from abbRobDriver import AbbRobDriver
from abbTypedef import *
from random import random


class Mediator(QObject):
    _ip = "192.168.125.1"
    _port = 1025
    _robType = "None"
    _robSysInfo = None
    _robTargetInfo = None
    _isConnected = False
    _sendCmd = False
    _robotDriver = None
    _target = None

    ipChanged = Signal()
    portChanged = Signal()
    connectionStateChanged = Signal()
    cmdSent = Signal()
    robSysInfoChanged = Signal()
    robTargetInfoChanged = Signal()

    def __init__(self, parent=None):
        super(Mediator, self).__init__(parent)
        self._robSysInfo = QStringListModel()
        self._robTargetInfo = QStringListModel()
        self._robotDriver = AbbRobDriver()
        self._target = RobTarget()

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
            self._robotDriver.require_rob_sys_info()
            self._robSysInfo.setStringList(self._robotDriver.rob_sys_info.string_list)
            self.robSysInfoChanged.emit()
            self._robotDriver.require_rob_target_info()
            self._robTargetInfo.setStringList(self._robotDriver.rob_target_info.string_list)
            self.robTargetInfoChanged.emit()

        else:
            self.disconnect_from_robot()
            self._robSysInfo.removeRows(0, self._robSysInfo.rowCount())
            self._robTargetInfo.removeRows(0, self._robTargetInfo.rowCount())

    is_connected = Property(bool, get_is_connected, set_is_connected, notify=connectionStateChanged)

    def get_send_cmd(self):
        return self._sendCmd

    def set_send_cmd(self, var: bool):
        if var:
            self.set_random_target()
            self.move_rob_target()

    send_cmd = Property(bool, get_send_cmd, set_send_cmd, notify=cmdSent)

    def get_rob_system_info(self):
        return self._robSysInfo

    def set_rob_system_info(self, val):
        pass

    rob_system_info = Property(QObject, get_rob_system_info, set_rob_system_info, notify=robSysInfoChanged)

    def get_rob_target_info(self):
        return self._robTargetInfo

    def set_rob_target_info(self, val):
        pass

    rob_target_info = Property(QObject, get_rob_target_info, set_rob_target_info, notify=robTargetInfoChanged)

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

    def set_random_target(self):
        self._target.decode(self._robotDriver.rob_target_info.encode())
        self._target.trans.set_x(self._target.trans.x + 10 * random())
        self._target.trans.set_y(self._target.trans.y + 10 * random())
        self._target.trans.set_z(self._target.trans.z + 10 * random())

    def move_rob_target(self):
        self._robotDriver.move_rob_target_to(self._target)
