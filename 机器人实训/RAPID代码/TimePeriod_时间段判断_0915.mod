MODULE TimePeriod
    !==========================================================
    ! IF statement practice (multi-branch): input one integer, show the time period
    !   0 - 5   -> dawn
    !   6 - 11  -> morning
    !   12 - 17 -> afternoon
    !   18 - 23 -> evening
    !   others  -> NG
    ! Instructions: TPReadNum / := / IF...ELSEIF...ELSE...ENDIF / TPWrite
    ! NOTE: RAPID uses ISO 8859-1 charset. Strings and comments MUST be English.
    !==========================================================
    PROC time_period()
        VAR num timeval;               ! input value (named timeval to avoid predefined names)
        VAR num key;
        TPErase;
        TPReadNum timeval, "time?";
        IF timeval >= 0 AND timeval <= 5 THEN
            TPWrite "dawn";            ! 0-5
        ELSEIF timeval >= 6 AND timeval <= 11 THEN
            TPWrite "morning";         ! 6-11
        ELSEIF timeval >= 12 AND timeval <= 17 THEN
            TPWrite "afternoon";       ! 12-17
        ELSEIF timeval >= 18 AND timeval <= 23 THEN
            TPWrite "evening";         ! 18-23
        ELSE
            TPWrite "NG";              ! others: invalid
        ENDIF
        TPReadFK key, "Done. Press OK to finish", "", "", "", "OK", "";
    ENDPROC
ENDMODULE
