MODULE LibraryFee
    !==========================================================
    ! IF statement practice: library overdue fee
    !   Step 1: select book type with TPReadFK (popup function keys)
    !   Step 2: input borrowing days with TPReadNum
    !   Step 3: show the fee with TPWrite
    ! Fee rules:
    !   Normal    (key 1): free 14 days, 0.5 per extra day
    !   Popular   (key 2): free  7 days, 0.8 per extra day
    !   Reference (key 3): free  3 days, 1.2 per extra day
    ! Examples: Normal 10 days -> 0
    !           Popular 10 days -> (10-7)*0.8 = 2.4
    !           Reference 10 days -> (10-3)*1.2 = 8.4
    ! NOTE: RAPID uses ISO 8859-1 charset. Strings and comments MUST be English.
    !==========================================================
    PROC library_fee()
        VAR num booktype;              ! 1=Normal  2=Popular  3=Reference
        VAR num days;                  ! borrowing days
        VAR num freedays;              ! free days of the chosen type
        VAR num rate;                  ! fee per extra day
        VAR num price;                 ! final fee
        VAR num key;
        TPErase;
        ! --- Step 1: choose book type (keys 1..3 are enabled) ---
        TPReadFK booktype, "Select book type", "Normal", "Popular", "Reference", "", "";
        ! --- Step 2: decide free days and rate by type ---
        IF booktype = 1 THEN
            freedays := 14;
            rate := 0.5;
        ELSEIF booktype = 2 THEN
            freedays := 7;
            rate := 0.8;
        ELSEIF booktype = 3 THEN
            freedays := 3;
            rate := 1.2;
        ELSE
            freedays := 0;             ! no valid type selected
            rate := 0;
        ENDIF
        ! --- Step 3: input days ---
        TPReadNum days, "Days?";
        ! --- Step 4: calculate the fee ---
        IF days > freedays THEN
            price := (days - freedays) * rate;
        ELSE
            price := 0;                ! within free days -> no fee
        ENDIF
        ! --- Step 5: show the result ---
        TPWrite "Price:" \Num := price;
        TPReadFK key, "Done. Press OK to finish", "", "", "", "OK", "";
    ENDPROC
ENDMODULE
