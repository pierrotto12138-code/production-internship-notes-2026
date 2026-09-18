MODULE PickPlace
    PROC pick_place()
        VAR num dx := 183;
        VAR num hi := 50;
        VAR robtarget pPick := [[0,0,0],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
        VAR robtarget pPlace := [[0,0,0],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
        VAR num i;
        FOR i FROM 0 TO 2 DO
            MoveJ Offs(pPick, i*dx, 0, hi), v300, z50, tool0;
            MoveL Offs(pPick, i*dx, 0, 0), v100, fine, tool0;
            Reset D11_Gripper_Open;
            WaitTime 0.5;
            Set D10_Gripper_Close;
            WaitTime 0.5;
            MoveL Offs(pPick, i*dx, 0, hi), v200, fine, tool0;
            MoveJ Offs(pPlace, i*dx, 0, hi), v300, z50, tool0;
            MoveL Offs(pPlace, i*dx, 0, 0), v100, fine, tool0;
            Reset D10_Gripper_Close;
            WaitTime 0.5;
            Set D11_Gripper_Open;
            WaitTime 0.5;
            MoveL Offs(pPlace, i*dx, 0, hi), v200, fine, tool0;
        ENDFOR
    ENDPROC
ENDMODULE
