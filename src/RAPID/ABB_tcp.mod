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
		getData;
		phraseCmdFlag;
		TEST cmdFlag
		CASE 1 : !// PC requires robotStatus
			sendRobInfo;
		CASE 2 : !// PC requires currentRobotTarget
			sendCurrentTarget;
		CASE 3 : !// PC sends targetPoint to move to
			getData;
			phraseTarget;
			moveToTarget;
		DEFAULT :
		ENDTEST
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
		SocketAccept server, incomming_socket;
	ENDPROC

	PROC closeConnection()
		SocketClose incomming_socket;
	ENDPROC

	PROC getData()
		SocketReceive incomming_socket\Str:=data;
		SocketSend incomming_socket\Str:="COPY!";
	ENDPROC

	PROC phraseCmdFlag()
		VAR bool ok;
		ok:=strtoval(data, cmdFlag);
	ENDPROC

	PROC phraseTarget()
		VAR num start:=1;
		VAR num end:=0;
		VAR bool ok;
		start:=1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.trans.x);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.trans.y);
		start:=end+1;
		end:=StrFind(data,start,",");
		ok:=strtoval(StrPart(data,start,end-start), target.trans.z);
		start:=end+1;
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
	ENDPROC

	PROC moveToTarget()
		MoveJ target, v200, fine, tool0;
	ENDPROC

	PROC sendRobInfo()
		data := GetSysInfo(\SerialNo) + "*";
        data := addString + GetSysInfo(\SWVersion) + "*";
        data := addString + GetSysInfo(\RobotType);
		SocketSend incomming_socket\Str:=data;
		SocketReceive incomming_socket\Str:=data;
	ENDPROC

	PROC sendCurrentTarget()
		VAR robTarget currentTarget;
		currentTarget:=CRobT(\Tool:=tool0);
		data := NumToStr(currentTarget.trans.x,2) + ",";
        data := data + NumToStr(currentTarget.trans.y,2) + ",";
        data := data + NumToStr(currentTarget.trans.z,2) + ",";
        data := data + NumToStr(currentTarget.rot.q1,3) + ",";
        data := data + NumToStr(currentTarget.rot.q2,3) + ",";
        data := data + NumToStr(currentTarget.rot.q3,3) + ",";
        data := data + NumToStr(currentTarget.rot.q4,3) + ",";
		data := data + NumToStr(currentTarget.robconf.cf1,2) + ",";
		data := data + NumToStr(currentTarget.robconf.cf4,2) + ",";
		data := data + NumToStr(currentTarget.robconf.cf6,2) + ",";
		data := data + NumToStr(currentTarget.robconf.cfx,2) + ",";
		data := data + NumToStr(currentTarget.extax.eax_a,2) + ",";
		data := data + NumToStr(currentTarget.extax.eax_b,2) + ",";
		data := data + NumToStr(currentTarget.extax.eax_c,2) + ",";
		data := data + NumToStr(currentTarget.extax.eax_d,2) + ",";
		data := data + NumToStr(currentTarget.extax.eax_e,2) + ",";
		data := data + NumToStr(currentTarget.extax.eax_f,2);
		SocketSend incomming_socket\Str:=data;
		SocketReceive incomming_socket\Str:=data;
	ENDPROC

ENDMODULE