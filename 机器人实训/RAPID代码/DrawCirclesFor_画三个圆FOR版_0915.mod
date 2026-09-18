MODULE DrawCirclesFor
    !==========================================================
    ! Simulation task: draw three continuous circles, using a FOR loop
    !   - radius 20 mm, drawn in the XY plane (z is constant)
    !   - three circles are TANGENT in a row (centers 2*radius = 40 mm apart)
    !   - start point: Target_160 (used as the TOP point of circle 1)
    ! FOR syntax (manual):
    !   FOR <loop var> FROM <expr> TO <expr> [STEP <expr>] DO <statements> ENDFOR
    !   - loop variable is num type and READ-ONLY (cannot be modified in the loop)
    !   - from / to / step expressions are evaluated ONLY ONCE
    !   - STEP is a reserved word: do NOT use it as a variable name
    ! NOTE: RAPID uses ISO 8859-1 charset. Strings and comments MUST be English.
    !==========================================================
    PROC draw_circles()
        VAR num i;                     ! loop counter: 0,1,2 -> circle index
        FOR i FROM 0 TO 2 DO
            ! move to this circle's TOP point (x offset = i*40)
            MoveJ Offs(Target_160,i*40,0,0), v50, z0, MyTool\WObj:=wobj0;
            ! right half of the circle: top -> right tangent point -> bottom
            MoveC Offs(Target_160,i*40+20,-20,0), Offs(Target_160,i*40,-40,0), v50, z0, MyTool\WObj:=wobj0;
            ! left half of the circle: bottom -> left tangent point -> top (closed)
            MoveC Offs(Target_160,i*40-20,-20,0), Offs(Target_160,i*40,0,0), v50, z0, MyTool\WObj:=wobj0;
        ENDFOR
    ENDPROC
ENDMODULE
