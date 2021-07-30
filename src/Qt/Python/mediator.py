from PySide2.QtCore import QObject, Property, Signal


class Mediator(QObject):
    _ip = "None"
    _port = 0
    _robType = "None"
    _isConnected = False

    connectionStateChanged = Signal()

    def __init__(self, parent=None):
        super(Mediator, self).__init__(parent)

    def get_ip(self):
        return self._ip

    def set_ip(self, ip: str):
        self._ip = ip

    ip = Property(str, get_ip, set_ip)

    def get_port(self):
        return self._port

    def set_port(self, port: int):
        self._port = port

    port = Property(int, get_port, set_port)

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
        else:
            self.disconnect_from_robot()

    is_connected = Property(bool, get_is_connected, set_is_connected, notify=connectionStateChanged)

    def connect_to_robot(self):
        if self._isConnected:
            return
        self._isConnected = True
        self.connectionStateChanged.emit()

    def disconnect_from_robot(self):
        if not self._isConnected:
            return
        self._isConnected = False
        self.connectionStateChanged.emit()
