MODULE DrawCircles260
    !==========================================================
    ! Simulation task: draw three continuous circles based on Target_260
    !   - radius 20 mm, drawn in the XY plane (z is constant)
    !   - three circles are TANGENT in a row (centers 2*radius = 40 mm apart)
    !   - base point: Target_260 (used as the TOP point of circle 1)
    !   - Target_260 = [858.409, 63.326, 408], so z stays 408 -> XY plane
    ! Same structure as the Target_160 version; only the base point differs.
    ! NOTE: RAPID uses ISO 8859-1 charset. Strings and comments MUST be English.
    !==========================================================
    PROC draw_circles_260()
        VAR num i;                     ! loop counter: 0,1,2 -> circle index
        FOR i FROM 0 TO 2 DO
            ! move to this circle's TOP point (x offset = i*40)
            MoveJ Offs(Target_260,i*40,0,0), v50, z0, MyTool\WObj:=wobj0;
            ! right half: top -> right tangent point -> bottom
            MoveC Offs(Target_260,i*40+20,-20,0), Offs(Target_260,i*40,-40,0), v50, z0, MyTool\WObj:=wobj0;
            ! left half: bottom -> left tangent point -> top (closed)
            MoveC Offs(Target_260,i*40-20,-20,0), Offs(Target_260,i*40,0,0), v50, z0, MyTool\WObj:=wobj0;
        ENDFOR
    ENDPROC
ENDMODULE
