MODULE tcp
	VAR socketdev server;
	VAR socketdev incomming_socket;
	VAR robTarget target;
	VAR string data:="";
	PERS num cmdFlag:=-1;

	PROC main()
		Initialize;
		WHILE TRUE DO
		acceptConnection;
		WHILE TRUE DO
		getCmdFlag;
		TEST cmdFlag
		CASE 0 : !// PC disconnect from robt
		CASE 1 : !// PC requires robotStatus
			sendRobInfo;
		CASE 2 : !// PC requires currentRobotTarget
			sendCurrentTarget;
		CASE 3 : !// PC sends targetPoint to move to
			getTarget;
			moveToTarget;
		DEFAULT :
		ENDTEST
		ENDWHILE
		closeConnection;
		ENDWHILE
	ENDPROC

	PROC Initialize()
		target:=CRobT(\Tool:=tool0);
		SocketCreate server;
		SocketBind server, "192.168.125.1", 1025;
		SocketListen server;
	ENDPROC

	PROC acceptConnection()
		SocketAccept server, incomming_socket \Time:=WAIT_MAX;
	ENDPROC

	PROC closeConnection()
		SocketClose incomming_socket;
	ENDPROC

	PROC getData()
		SocketReceive incomming_socket \Str:=data \Time:=WAIT_MAX;
		SocketSend incomming_socket \Str:="COPY!";
	ENDPROC

	PROC getCmdFlag()
		VAR bool ok;
		getData;
		ok:=strtoval(data, cmdFlag);
	ENDPROC

	PROC getTarget()
		VAR num start:=1;
		VAR num end:=0;
		VAR bool ok;

		getData;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.trans.x);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.trans.y);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.trans.z);

		getData;
		start:=1;
		end:=0;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.rot.q1);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.rot.q2);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.rot.q3);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.rot.q4);

		getData;
		start:=1;
		end:=0;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.robconf.cf1);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.robconf.cf4);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.robconf.cf6);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.robconf.cfx);

		getData;
		start:=1;
		end:=0;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.extax.eax_a);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.extax.eax_b);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.extax.eax_c);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.extax.eax_d);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.extax.eax_e);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.extax.eax_f);
	ENDPROC

	PROC moveToTarget()
		MoveJ target, v200, fine, tool0;
	ENDPROC

	PROC sendRobInfo()
		data := GetSysInfo(\SerialNo) + "*";
        data := data + GetSysInfo(\SWVersion) + "*";
        data := data + GetSysInfo(\RobotType);
		SocketSend incomming_socket\Str:=data;
		SocketReceive incomming_socket\Str:=data;
	ENDPROC

	PROC sendCurrentTarget()
		VAR robTarget currentTarget;
		currentTarget:=CRobT(\Tool:=tool0);
		data := NumToStr(currentTarget.trans.x,2) + ",";
        data := data + NumToStr(currentTarget.trans.y,2) + ",";
        data := data + NumToStr(currentTarget.trans.z,2) + ",";
		SocketSend incomming_socket\Str:=data;
		SocketReceive incomming_socket\Str:=data;

        data := NumToStr(currentTarget.rot.q1,3) + ",";
        data := data + NumToStr(currentTarget.rot.q2,3) + ",";
        data := data + NumToStr(currentTarget.rot.q3,3) + ",";
        data := data + NumToStr(currentTarget.rot.q4,3) + ",";
		SocketSend incomming_socket\Str:=data;
		SocketReceive incomming_socket\Str:=data;

		data := NumToStr(currentTarget.robconf.cf1,1) + ",";
		data := data + NumToStr(currentTarget.robconf.cf4,1) + ",";
		data := data + NumToStr(currentTarget.robconf.cf6,1) + ",";
		data := data + NumToStr(currentTarget.robconf.cfx,1) + ",";
		SocketSend incomming_socket\Str:=data;
		SocketReceive incomming_socket\Str:=data;

		data := NumToStr(currentTarget.extax.eax_a,1) + ",";
		data := data + NumToStr(currentTarget.extax.eax_b,1) + ",";
		data := data + NumToStr(currentTarget.extax.eax_c,1) + ",";
		data := data + NumToStr(currentTarget.extax.eax_d,1) + ",";
		data := data + NumToStr(currentTarget.extax.eax_e,1) + ",";
		data := data + NumToStr(currentTarget.extax.eax_f,1);
		SocketSend incomming_socket\Str:=data;
		SocketReceive incomming_socket\Str:=data;
	ENDPROC

ENDMODULE