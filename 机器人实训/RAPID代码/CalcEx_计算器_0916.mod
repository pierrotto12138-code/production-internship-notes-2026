MODULE CalcEx
    PROC calc()
        VAR num result;
        VAR num operand;
        VAR num op;
        VAR num key;
        TPErase;
        TPReadNum result,"Num?";
        op:=0;
        WHILE op<>5 DO
            TPReadFK op,"Operator?","+","-","*","/","=";
            IF op<>5 THEN
                TPReadNum operand,"Num?";
                TEST op
                CASE 1:
                    result:=result+operand;
                CASE 2:
                    result:=result-operand;
                CASE 3:
                    result:=result*operand;
                CASE 4:
                    IF operand<>0 THEN
                        result:=result/operand;
                    ELSE
                        TPWrite "Div by zero";
                    ENDIF
                DEFAULT:
                    TPWrite "Illegal op";
                ENDTEST
            ENDIF
        ENDWHILE
        TPWrite "Result="\Num:=result;
        TPReadFK key,"Done, Press OK to finish","","","","OK","";
    ENDPROC
ENDMODULE
