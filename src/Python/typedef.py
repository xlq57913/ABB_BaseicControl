class pos:
    __x = 0
    __y = 0
    __z = 0

    def __init__(self, x, y, z):
        self.__x = float(x)
        self.__y = float(y)
        self.__z = float(z)

    def __str__(self):
        return "{:06.2f},{:06.2f},{:06.2f}".format(self.__x, self.__y, self.__z)

    def encode(self):
        return str(self).encode('utf-8')

    def decode(self, data):
        data = data.decode('utf-8').split(",")
        (self.__x, self.__y, self.__z) = (float(data[0]), float(data[1]), float(data[2]))

    def set_pos(self, x, y, z):
        self.__x = float(x)
        self.__y = float(y)
        self.__z = float(z)

    def set_x(self,x):
        self.__x = float(x)

    def set_y(self,y):
        self.__y = float(y)

    def set_z(self,z):
        self.__z = float(z)

    @property
    def x(self):
        return self.__x

    @property
    def y(self):
        return self.__y

    @property
    def z(self):
        return self.__z

class orient:
    __q1 = 0
    __q2 = 0
    __q3 = 0
    __q4 = 0

    def __init__(self, q1, q2, q3, q4):
        self.__q1 = float(q1)
        self.__q2 = float(q2)
        self.__q3 = float(q3)
        self.__q4 = float(q4)

    def __str__(self):
        return "{:06.3f},{:06.3f},{:06.3f},{:06.3f}".format(self.__q1, self.__q2, self.__q3, self.__q4)

    def encode(self):
        return str(self).encode('utf-8')

    def decode(self, data):
        data = data.decode('utf-8').split(",")
        (self.__q1, self.__q2, self.__q3, self.__q4) = (float(data[0]), float(data[1]), float(data[2]), float(data[3]))

    def set_orient(self, q1, q2, q3, q4):
        self.__q1 = float(q1)
        self.__q2 = float(q2)
        self.__q3 = float(q3)
        self.__q4 = float(q4)

    def set_q1(self, q1):
        self.__q1 = q1

    def set_q2(self, q2):
        self.__q2 = q2

    def set_q3(self, q3):
        self.__q3 = q3

    def set_q4(self, q4):
        self.__q4 = q4

    @property
    def q1(self):
        return self.__q1

    @property
    def q2(self):
        return self.__q2

    @property
    def q3(self):
        return self.__q3

    @property
    def q4(self):
        return self.__q4

class robTarget:
    __pos = None
    __orient = None

    def __init__(self, x, y, z, q1, q2, q3, q4):
        self.__pos = pos(x, y, z)
        self.__orient = orient(q1, q2, q3, q4)

    def __str__(self):
        return "{0!s},{1!s}".format(self.__pos, self.__orient)

    def encode(self):
        return str(self).encode('utf-8')

    def decode(self, data):
        data = data.decode('utf-8').split(",")
        self.__pos.set_pos(data[0], data[1], data[2])
        self.__orient.set_orient(data[3], data[4], data[5], data[6])

    def set_robotTarget(self, x, y, z, q1, q2, q3, q4):
        self.__pos.set_pos(x, y, z)
        self.__orient.set_orient(q1, q2, q3, q4)

    def set_x(self, x):
        self.__pos.set_x(x)

    def set_y(self, y):
        self.__pos.set_y(y)

    def set_z(self, z):
        self.__pos.set_z(z)

    def set_pos(self, x, y, z):
        self.__pos.set_pos(x, y, z)

    def set_q1(self, q1):
        self.__orient.set_q1(q1)

    def set_q2(self, q2):
        self.__orient.set_q2(q2)

    def set_q3(self, q3):
        self.__orient.set_q3(q3)

    def set_q4(self, q4):
        self.__orient.set_q4(q4)

    def set_orient(self, q1, q2, q3, q4):
        self.__orient.set_orient(q1, q2, q3, q4)

    @property
    def pos(self):
        return self.__pos

    @property
    def orient(self):
        return self.__orient