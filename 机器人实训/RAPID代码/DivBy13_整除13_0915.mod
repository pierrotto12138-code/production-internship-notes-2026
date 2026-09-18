MODULE DivBy13
    PROC div_by_13()
        VAR num i;
        VAR num key;
        TPErase;
        FOR i FROM 1 TO 100 DO
            IF i MOD 13 = 0 THEN
                TPWrite "13x" \Num:=i;
            ENDIF
        ENDFOR
        TPReadFK key,"Done. Press OK to finish","","","","OK","";
    ENDPROC
ENDMODULE
