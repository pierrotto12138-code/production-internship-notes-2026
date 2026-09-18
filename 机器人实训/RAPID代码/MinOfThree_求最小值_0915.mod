MODULE MinOfThree
    !==========================================================
    ! IF statement practice: input three integers from the FlexPendant,
    ! find the minimum value and output it.
    ! Instructions: TPReadNum / := / IF...THEN...ENDIF / TPWrite
    ! Method: "king of the hill" - set a champion, then let the others challenge it.
    ! NOTE: RAPID uses ISO 8859-1 charset. Strings and comments MUST be English.
    !==========================================================
    PROC min_of_three()
        VAR num num1;
        VAR num num2;
        VAR num num3;
        VAR num min1;                  ! holds the minimum value
        VAR num key;
        TPErase;
        TPReadNum num1, "First num ->";
        TPReadNum num2, "Second num ->";
        TPReadNum num3, "Third num ->";
        min1 := num1;                  ! 1) assume num1 is the smallest
        IF num2 < min1 THEN
            min1 := num2;              ! 2) num2 smaller -> replace
        ENDIF
        IF num3 < min1 THEN
            min1 := num3;              ! 3) num3 smaller -> replace
        ENDIF
        TPWrite "min" \Num := min1;    ! output the minimum
        TPReadFK key, "Min found. Press OK to finish", "", "", "", "OK", "";
    ENDPROC
ENDMODULE
