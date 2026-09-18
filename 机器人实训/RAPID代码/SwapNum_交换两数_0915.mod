MODULE SwapNum
    !==========================================================
    ! HMI instruction practice: read two numbers, swap them with
    ! assignment instructions, then show the result on the FlexPendant.
    ! Instructions: TPReadNum / := / TPWrite
    ! NOTE: RAPID uses ISO 8859-1 charset. Strings and comments MUST be English.
    !==========================================================
    PROC swap_num()
        VAR num num1;      ! first number (from FlexPendant)
        VAR num num2;      ! second number (from FlexPendant)
        VAR num temp;      ! temporary variable used for the swap
        VAR num key;
        TPErase;                              ! clear the FlexPendant display
        TPReadNum num1, "First num1 ->";
        TPReadNum num2, "Second num2 ->";
        temp := num1;                         ! 1) save num1 (or it will be lost)
        num1 := num2;                         ! 2) num2 -> num1
        num2 := temp;                         ! 3) saved value -> num2: swap done
        TPWrite "num1:" \Num := num1;
        TPWrite "num2:" \Num := num2;
        TPReadFK key, "Swap done. Press OK to finish", "", "", "", "OK", "";
    ENDPROC
ENDMODULE
