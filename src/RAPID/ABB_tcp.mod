MODULE tcp
	VAR socketdev server;
	VAR socketdev client;
	VAR pos target:= [0,0,0];
	VAR string data:="";
	VAR bool ok;
	PERS num start:=1;
	PERS num end:=0;

	PROC main()
		initServer;
		WHILE TRUE DO
		getData;
		phrase;
		moveToTarget;
		ENDWHILE
	ENDPROC

	PROC initServer()
		SocketCreate server;
		SocketBind server, "192.168.125.1", 1025;
		SocketListen server;
	ENDPROC

	PROC getData()
		SocketAccept server, client;
		SocketReceive client\Str:=data;
		SocketSend client\Str:="COPY!";
		SocketClose client;
	ENDPROC

	PROC phrase()
		start:=1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.x);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.y);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.z);
	ENDPROC

	PROC moveToTarget()
		MoveJ offs(CRobT(\Tool:=tool0), target.x, target.y, target.z), v200, fine, tool0;
	ENDPROC

ENDMODULE