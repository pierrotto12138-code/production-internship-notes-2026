MODULE DrawCircles
    !==========================================================
    ! Simulation task: draw three continuous circles
    !   - radius 20 mm, drawn in the XY plane (z is constant)
    !   - three circles are TANGENT in a row (centers 40 mm apart)
    !   - start point: Target_160 (used as the TOP point of circle 1)
    ! Instructions: MoveJ / MoveC / MoveL / Offs
    ! NOTE: RAPID uses ISO 8859-1 charset. Strings and comments MUST be English.
    !==========================================================
    PROC draw_circles()
        MoveJ Target_160, v50, z0, MyTool\WObj:=wobj0;
        MoveC Offs(Target_160,20,-20,0), Offs(Target_160,0,-40,0), v50, z0, MyTool\WObj:=wobj0;
        MoveC Offs(Target_160,-20,-20,0), Target_160, v50, z0, MyTool\WObj:=wobj0;
        MoveL Offs(Target_160,40,0,0), v50, z0, MyTool\WObj:=wobj0;
        MoveC Offs(Target_160,60,-20,0), Offs(Target_160,40,-40,0), v50, z0, MyTool\WObj:=wobj0;
        MoveC Offs(Target_160,20,-20,0), Offs(Target_160,40,0,0), v50, z0, MyTool\WObj:=wobj0;
        MoveL Offs(Target_160,80,0,0), v50, z0, MyTool\WObj:=wobj0;
        MoveC Offs(Target_160,100,-20,0), Offs(Target_160,80,-40,0), v50, z0, MyTool\WObj:=wobj0;
        MoveC Offs(Target_160,60,-20,0), Offs(Target_160,80,0,0), v50, z0, MyTool\WObj:=wobj0;
    ENDPROC
ENDMODULE
