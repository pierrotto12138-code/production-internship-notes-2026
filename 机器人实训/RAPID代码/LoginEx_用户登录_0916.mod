MODULE LoginEx
    PROC login()
        VAR num pwd{3};
        VAR num usr;
        VAR num input;
        VAR num tries;
        VAR bool ok;
        VAR num key;
        pwd{1}:=10;
        pwd{2}:=20;
        pwd{3}:=30;
        TPErase;
        TPReadFK usr,"Select user","user1","user2","user3","","";
        ok:=FALSE;
        tries:=0;
        WHILE ok=FALSE AND tries<3 DO
            TPReadNum input,"Password?";
            IF input=pwd{usr} THEN
                ok:=TRUE;
            ELSE
                tries:=tries+1;
            ENDIF
        ENDWHILE
        IF ok THEN
            TPWrite "Welcome user";
        ELSE
            TPWrite "NG";
        ENDIF
        TPReadFK key,"Done. Press OK to finish","","","","OK","";
    ENDPROC
ENDMODULE
