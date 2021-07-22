import socket

server=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
server.bind(('0.0.0.0',1400))
server.listen()

while True:
    conn,addr = server.accept()
    X=input("请输入X:")
    conn.send(X.encode(('utf-8')))
    data = conn.recv(1024)
    Y=input("请输入Y:")
    conn.send(Y.encode(('utf-8')))
    data = conn.recv(1024)
    Z=input("请输入Z:")
    conn.send(Z.encode(('utf-8')))
    data = conn.recv(1024)
    conn.close()
