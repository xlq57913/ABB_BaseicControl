MODULE tcp
	VAR socketdev socket1;
	VAR string X1:="";
	VAR string Y1:="";
	VAR string Z1:="";
	VAR bool ok;	
	PERS num X:=-10;
	PERS num Y:=-20;
	PERS num Z:=-30;
	
	PROC main()
		WHILE TRUE DO
		socket;
		MoveJ offs(CRobT(\Tool:=tool0),x,y,z), v200, fine, tool0;
		ENDWHILE
	ENDPROC

	PROC socket()
		SocketCreate socket1;
		SocketConnect socket1, "192.168.125.202", 1400;
		WaitTime 0.1;
		SocketSend socket1\Str:="COPY!";
		SocketReceive socket1\Str:=X1;
		WaitTime 0.1;
		SocketReceive socket1\Str:=Y1;
		SocketSend socket1\Str:="COPY!";
		WaitTime 0.1;
		SocketReceive socket1\Str:=Z1;
		SocketSend socket1\Str:="COPY!";
		WaitTime 0.1;
		SocketClose socket1;
		ok:=strtoval(X1,X);
		ok:=strtoval(Y1,Y);
		ok:=strtoval(Z1,Z);
	ENDPROC
	

ENDMODULE