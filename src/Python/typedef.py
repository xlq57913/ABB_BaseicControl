class pos:
    __x = 0
    __y = 0
    __z = 0

    def __init__(self, x, y, z):
        self.__x = int(x)
        self.__y = int(y)
        self.__z = int(z)

    def __str__(self):
        return "%r,%r,%r" %(self.__x, self.__y, self.__z)

    def encode(self):
        return str(self).encode('utf-8')

    def decode(self, data):
        string = data.decode('utf-8')
        pos = string.split(",")
        (self.__x, self.__y, self.__z) = (int(pos[0], int(pos[1]), int(pos[2])))

    def set_pos(self, x, y, z):
        self.__x = int(x)
        self.__y = int(y)
        self.__z = int(z)

    def set_x(self,x):
        self.__x = int(x)

    def set_y(self,y):
        self.__y = int(y)

    def set_z(self,z):
        self.__z = int(z)

    def get_x(self):
        return self.__x

    def get_y(self):
        return self.__y

    def get_z(self):
        return self.__z