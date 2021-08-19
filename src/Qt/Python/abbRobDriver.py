from baseRobDriver import BaseRobDriver
from abbTypedef import *

import socket


class AbbRobDriver(BaseRobDriver):
    _socket = None
    _robInfo = None
    _robTargetInfo = None
    _onConnect = False

    def __init__(self):
        self._robInfo = RobInfo()
        self._robTargetInfo = RobTarget()

    def connect_to_rob(self, ip: str, port: int):
        self._socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        if self._socket.connect_ex((ip, port)) is 0:
            self._onConnect = True

    def disconnect_from_rob(self):
        self._socket.close()
        self._onConnect = False

    @property
    def on_connect(self) -> bool:
        return self._onConnect

    @property
    def rob_sys_info(self) -> RobInfo:
        return self._robInfo

    @property
    def rob_target_info(self) -> RobTarget:
        return self._robTargetInfo

    def require_rob_sys_info(self):
        flag = 1
        self._socket.send(str(flag).encode('utf-8'))
        data = self._socket.recv(1024)
        data = self._socket.recv(1024)
        self._robInfo.decode(data)
        self._socket.send("COPY!".encode('utf-8'))

    def require_rob_target_info(self):
        flag = 2
        self._socket.send(str(flag).encode('utf-8'))
        data = self._socket.recv(1024)

        data = self._socket.recv(1024)
        self._robTargetInfo.trans.decode(data)
        self._socket.send("COPY!".encode('utf-8'))

        data = self._socket.recv(1024)
        self._robTargetInfo.rot.decode(data)
        self._socket.send("COPY!".encode('utf-8'))

        data = self._socket.recv(1024)
        self._robTargetInfo.robConf.decode(data)
        self._socket.send("COPY!".encode('utf-8'))

        data = self._socket.recv(1024)
        self._robTargetInfo.exTax.decode(data)
        self._socket.send("COPY!".encode('utf-8'))

    def move_rob_target_to(self, target: RobTarget):
        flag = 3
        self._socket.send(str(flag).encode('utf-8'))
        data = self._socket.recv(1024)

        self._socket.send(target.trans.encode())
        data = self._socket.recv(1024)

        self._socket.send(target.rot.encode())
        data = self._socket.recv(1024)

        self._socket.send(target.robConf.encode())
        data = self._socket.recv(1024)

        self._socket.send(target.exTax.encode())
        data = self._socket.recv(1024)
