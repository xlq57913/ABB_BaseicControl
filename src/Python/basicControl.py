import socket
from typedef import pos


offset = pos(0,0,0)

while True:
    client=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    client.connect(('192.168.125.1',1025))
    x=input("请输入X:")
    offset.set_x(int(x))
    y=input("请输入Y:")
    offset.set_y(int(y))
    z=input("请输入Z:")
    offset.set_z(int(z))
    client.send(offset.encode())
    data = client.recv(1024)
    client.close()
