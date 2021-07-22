MODULE BasicControl
    ! A Basic Code to control ABB offline

    PERS num x:=-10;
    PERS num y:=-20;
    PERS num z:=-30;

    PROC main()
        MoveJ offs(CRobT(\Tool:=tool0),x,y,z), v200, fine, tool0;
    ENDPROC
ENDMODULE