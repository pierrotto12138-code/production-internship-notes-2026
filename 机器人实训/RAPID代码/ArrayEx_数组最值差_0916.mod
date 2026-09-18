MODULE ArrayEx
    PROC max_min_diff()
        VAR num a{8};
        VAR num i;
        VAR num vmax;
        VAR num vmin;
        VAR num key;
        TPErase;
        FOR i FROM 1 TO 8 DO
            TPReadNum a{i}, "Num?";
        ENDFOR
        vmax := a{1};
        vmin := a{1};
        FOR i FROM 2 TO 8 DO
            IF a{i} > vmax THEN
                vmax := a{i};
            ENDIF
            IF a{i} < vmin THEN
                vmin := a{i};
            ENDIF
        ENDFOR
        TPWrite "Diff=" \Num := vmax - vmin;
        TPReadFK key, "Done. Press OK to finish", "", "", "", "OK", "";
    ENDPROC
ENDMODULE
