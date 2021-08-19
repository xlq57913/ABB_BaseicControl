class Pos:
    _x = 0
    _y = 0
    _z = 0

    def __init__(self, x=0, y=0, z=0):
        self._x = float(x)
        self._y = float(y)
        self._z = float(z)

    def __str__(self):
        return "[{:06.2f} {:06.2f} {:06.2f}]".format(self._x, self._y, self._z)

    def __repr__(self):
        return "{:06.2f},{:06.2f},{:06.2f}".format(self._x, self._y, self._z)

    def encode(self) -> bytes:
        return repr(self).encode('utf-8')

    def decode(self, data: str):
        data = data.decode('utf-8').split(",")
        (self._x, self._y, self._z) = (float(data[0]), float(data[1]), float(data[2]))

    def set_pos(self, x, y, z):
        self._x = float(x)
        self._y = float(y)
        self._z = float(z)

    def set_x(self, x):
        self._x = float(x)

    def set_y(self, y):
        self._y = float(y)

    def set_z(self, z):
        self._z = float(z)

    @property
    def x(self) -> float:
        return self._x

    @property
    def y(self) -> float:
        return self._y

    @property
    def z(self) -> float:
        return self._z

    @property
    def string_list(self) -> list:
        return ["x: {:06.2f}".format(self._x), "y: {:06.2f}".format(self._y), "z: {:06.2f}".format(self._z)]


class Orient:
    _q1 = 0
    _q2 = 0
    _q3 = 0
    _q4 = 0

    def __init__(self, q1=0, q2=0, q3=0, q4=0):
        self._q1 = float(q1)
        self._q2 = float(q2)
        self._q3 = float(q3)
        self._q4 = float(q4)

    def __str__(self):
        return "[{:06.3f} {:06.3f} {:06.3f} {:06.3f}]".format(self._q1, self._q2, self._q3, self._q4)

    def __repr__(self):
        return "{:06.3f},{:06.3f},{:06.3f},{:06.3f}".format(self._q1, self._q2, self._q3, self._q4)

    def encode(self) -> bytes:
        return repr(self).encode('utf-8')

    def decode(self, data: str):
        data = data.decode('utf-8').split(",")
        (self._q1, self._q2, self._q3, self._q4) = (float(data[0]), float(data[1]), float(data[2]), float(data[3]))

    def set_orient(self, q1, q2, q3, q4):
        self._q1 = float(q1)
        self._q2 = float(q2)
        self._q3 = float(q3)
        self._q4 = float(q4)

    def set_q1(self, q1):
        self._q1 = q1

    def set_q2(self, q2):
        self._q2 = q2

    def set_q3(self, q3):
        self._q3 = q3

    def set_q4(self, q4):
        self._q4 = q4

    @property
    def q1(self) -> float:
        return self._q1

    @property
    def q2(self) -> float:
        return self._q2

    @property
    def q3(self) -> float:
        return self._q3

    @property
    def q4(self) -> float:
        return self._q4

    @property
    def string_list(self) -> list:
        return ["q1: {:06.3f}".format(self._q1), "q2: {:06.3f}".format(self._q2),
                "q3: {:06.3f}".format(self._q3), "q4: {:06.3f}".format(self._q4)]


class ConfData:
    _cf1 = None
    _cf4 = None
    _cf6 = None
    _cfx = None

    def __init__(self, cf1=0, cf4=0, cf6=0, cfx=0):
        self._cf1 = float(cf1)
        self._cf4 = float(cf4)
        self._cf6 = float(cf6)
        self._cfx = float(cfx)

    def __str__(self):
        return "[{:06.2f} {:06.2f} {:06.2f} {:06.2f}]".format(self._cf1, self._cf4, self._cf6, self._cfx)

    def __repr__(self):
        return "{:06.2f},{:06.2f},{:06.2f},{:06.2f}".format(self._cf1, self._cf4, self._cf6, self._cfx)

    def encode(self) -> bytes:
        return repr(self).encode('utf-8')

    def decode(self, data: str):
        data = data.decode('utf-8').split(",")
        (self._cf1, self._cf4, self._cf6, self._cfx) = (float(data[0]), float(data[1]), float(data[2]), float(data[3]))

    def set_confData(self, cf1, cf4, cf6, cfx):
        self._cf1 = float(cf1)
        self._cf4 = float(cf4)
        self._cf6 = float(cf6)
        self._cfx = float(cfx)

    def set_cf1(self, cf1):
        self._cf1 = float(cf1)

    def set_cf4(self, cf4):
        self._cf4 = float(cf4)

    def set_cf6(self, cf6):
        self._cf4 = float(cf6)

    def set_cf6(self, cfx):
        self._cf4 = float(cfx)

    @property
    def cf1(self) -> float:
        return self._cf1

    @property
    def cf4(self) -> float:
        return self._cf4

    @property
    def cf6(self) -> float:
        return self._cf6

    @property
    def cfx(self) -> float:
        return self._cfx

    @property
    def string_list(self) -> list:
        return ["cf1: {:06.2f}".format(self._cf1), "cf4: {:06.2f}".format(self._cf4),
                "cf6: {:06.2f}".format(self._cf6), "cfx: {:06.2f}".format(self._cfx)]


class ExtJoint:
    _eax_a = None
    _eax_b = None
    _eax_c = None
    _eax_d = None
    _eax_e = None
    _eax_f = None

    def __init__(self, eax_a=0, eax_b=0, eax_c=0, eax_d=0, eax_e=0, eax_f=0):
        self._eax_a = float(eax_a)
        self._eax_b = float(eax_b)
        self._eax_c = float(eax_c)
        self._eax_d = float(eax_d)
        self._eax_e = float(eax_e)
        self._eax_f = float(eax_f)

    def __str__(self):
        return "[{:06.2f} {:06.2f} {:06.2f} {:06.2f} {:06.2f} {:06.2f}]".format(
            self._eax_a, self._eax_b, self._eax_c, self._eax_d, self._eax_e, self._eax_e)

    def __repr__(self):
        return "{:06.2f},{:06.2f},{:06.2f},{:06.2f},{:06.2f},{:06.2f}".format(
            self._eax_a, self._eax_b, self._eax_c, self._eax_d, self._eax_e, self._eax_e)

    def encode(self) -> bytes:
        return repr(self).encode('utf-8')

    def decode(self, data: str):
        data = data.decode('utf-8').split(",")
        (self._eax_a, self._eax_b, self._eax_c, self._eax_d, self._eax_e, self._eax_f) = (
            float(data[0]), float(data[1]), float(data[2]), float(data[3]), float(data[4]), float(data[5]))

    def set_extJoint(self, eax_a, eax_b, eax_c, eax_d, eax_e, eax_f):
        self._eax_a = float(eax_a)
        self._eax_b = float(eax_b)
        self._eax_c = float(eax_c)
        self._eax_d = float(eax_d)
        self._eax_e = float(eax_e)
        self._eax_f = float(eax_f)

    def set_eax_a(self, eax_a):
        self._eax_a = float(eax_a)

    def set_eax_b(self, eax_b):
        self._eax_b = float(eax_b)

    def set_eax_c(self, eax_c):
        self._eax_c = float(eax_c)

    def set_eax_d(self, eax_d):
        self._eax_d = float(eax_d)

    def set_eax_e(self, eax_e):
        self._eax_e = float(eax_e)

    def set_eax_f(self, eax_f):
        self._eax_f = float(eax_f)

    @property
    def eax_a(self) -> float:
        return self._eax_a

    @property
    def eax_b(self) -> float:
        return self._eax_b

    @property
    def eax_c(self) -> float:
        return self._eax_c

    @property
    def eax_d(self) -> float:
        return self._eax_d

    @property
    def eax_e(self) -> float:
        return self._eax_e

    @property
    def eax_f(self) -> float:
        return self._eax_f

    @property
    def string_list(self) -> list:
        return ["eax_a: {:06.2f}".format(self._eax_a), "eax_b: {:06.2f}".format(self._eax_b),
                "eax_c: {:06.2f}".format(self._eax_c), "eax_d: {:06.2f}".format(self._eax_d),
                "eax_e: {:06.2f}".format(self._eax_e), "eax_f: {:06.2f}".format(self._eax_f)]


class RobTarget:
    _trans = None
    _rot = None
    _robConf = None
    _exTax = None

    def __init__(self, x=0, y=0, z=0, q1=0, q2=0, q3=0, q4=0,
                 cf1=0, cf4=0, cf6=0, cfx=0, eax_a=0, eax_b=0, eax_c=0, eax_d=0, eax_e=0, eax_f=0):
        self._trans = Pos(x, y, z)
        self._rot = Orient(q1, q2, q3, q4)
        self._robConf = ConfData(cf1, cf4, cf6, cfx)
        self._exTax = ExtJoint(eax_a, eax_b, eax_c, eax_d, eax_e, eax_f)

    def __str__(self):
        return "trans: {0!s} \n rot: {1!s} \n robConf: {2!s} \n exTax: {3!s}".format(
            self._trans, self._rot, self._robConf, self._exTax)

    def __repr__(self):
        return "{0!r},{1!r},{2!r},{3!r}".format(self._trans, self._rot, self._robConf, self._exTax)

    def encode(self) -> bytes:
        return repr(self).encode('utf-8')

    def decode(self, data: str):
        data = data.decode('utf-8').split(",")
        self._trans.set_pos(data[0], data[1], data[2])
        self._rot.set_orient(data[3], data[4], data[5], data[6])
        self._robConf.set_confData(data[7], data[8], data[9], data[10])
        self._exTax.set_extJoint(data[11], data[12], data[13], data[14], data[15], data[16])

    def set_robotTarget(self, x, y, z, q1, q2, q3, q4):
        self._trans.set_pos(x, y, z)
        self._rot.set_orient(q1, q2, q3, q4)

    @property
    def trans(self) -> Pos:
        return self._trans

    @property
    def rot(self) -> Orient:
        return self._rot

    @property
    def robConf(self) -> ConfData:
        return self._robConf

    @property
    def exTax(self) -> ExtJoint:
        return self._exTax

    @property
    def string_list(self):
        return self._trans.string_list + self._rot.string_list + self._robConf.string_list + self._exTax.string_list


class RobInfo:
    _serialNo = None
    _swVersion = None
    _robType = None

    def __init__(self):
        self._serialNo = ""
        self._swVersion = ""
        self._robType = ""

    def __str__(self):
        return "SerialNo: {0}\n SWVersion: {1}\n RobType: {2}".format(
            self._serialNo, self._swVersion, self._robType)

    def __repr__(self):
        return "{0}*{1}*{2}".format(self._serialNo, self._swVersion, self._robType)

    def decode(self, data):
        data = data.decode('utf-8').split("*")
        (self._serialNo, self._swVersion, self._robType) = (data[0], data[1], data[2])

    @property
    def serialNo(self):
        return self._serialNo

    @property
    def swVersion(self):
        return self._swVersion

    @property
    def robType(self):
        return self._robType

    @property
    def string_list(self):
        return ["SerialNo: %s" % self._serialNo, "SWVersion: %s" % self._swVersion, "RobType: %s" % self._robType]
