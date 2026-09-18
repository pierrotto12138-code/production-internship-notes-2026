MODULE DrawCircles6
    PROC draw_circles()
        VAR num i;
        VAR num j;
        FOR j FROM 0 TO 1 DO
            FOR i FROM 0 TO 2 DO
                MoveJ Offs(Target_160,i*40,j*40,0),v50,z0,MyTool\WObj:=wobj0;
                MoveC Offs(Target_160,i*40+20,j*40-20,0),Offs(Target_160,i*40,j*40-40,0),v50,z0,MyTool\WObj:=wobj0;
                MoveC Offs(Target_160,i*40-20,j*40-20,0),Offs(Target_160,i*40,j*40,0),v50,z0,MyTool\WObj:=wobj0;
            ENDFOR
        ENDFOR
    ENDPROC
ENDMODULE
