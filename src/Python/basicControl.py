import socket
from abbTypedef import robTarget, robInfo


target = robTarget()
cmdFlag = -1

while True:
    client=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    client.connect(('192.168.125.1',1025))

    cmdFlag = 2
    client.send(str(cmdFlag).encode('utf-8'))
    data = client.recv(1024)

    data = client.recv(1024)
    target.decode(data)
    print(target)
    client.send("COPY!".encode('utf-8'))
    client.close()

    client=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    client.connect(('192.168.125.1',1025))

    cmdFlag = 3
    client.send(str(cmdFlag).encode('utf-8'))
    data = client.recv(1024)

    x=input("请输入X:")
    target.set_x(float(x))
    y=input("请输入Y:")
    target.set_y(float(y))
    z=input("请输入Z:")
    target.set_z(float(z))
    q1=input("请输入Q1:")
    target.set_q1(float(q1))
    q2=input("请输入Q2:")
    target.set_q2(float(q2))
    q3=input("请输入Q3:")
    target.set_q3(float(q3))
    q4=input("请输入Q4:")
    target.set_q4(float(q4))
    client.send(target.encode())
    data = client.recv(1024)
    client.close()