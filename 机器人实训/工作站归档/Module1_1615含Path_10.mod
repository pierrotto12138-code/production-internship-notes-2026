
MODULE Module1
	CONST robtarget p10:=[[699.42,88.43,705.75],[0.190432,-0.061687,0.979687,0.0119907],[0,0,0,0],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
	CONST robtarget p20:=[[699.42,88.43,705.75],[0.190432,-0.061687,0.979687,0.0119907],[0,-1,0,0],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
	CONST robtarget p30:=[[762.23,96.37,426.55],[0.00469136,-0.0628409,0.998012,0.000295343],[0,-1,0,0],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
	CONST robtarget Target_160:=[[752.961021712,0,473.000001678],[-0.00000002,0,1,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Target_170:=[[558.409,63.326,408],[0,0,1,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Target_180:=[[558.409,-79.547,408],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Target_190:=[[591.551,-79.397,408],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Target_200:=[[617.506,-100.006,408],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Target_210:=[[752.961,0,473],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Target_220:=[[680.926,-100.006,408],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Target_230:=[[748.721,-63.019,408],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Target_240:=[[771.941,-136.674,408],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Target_250:=[[858.409,-136.674,408],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Target_260:=[[858.409,63.326,408],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Target_270:=[[558.409,63.326,408],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Target_280:=[[752.961,0,473],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	PROC demo1()
		MoveJ p10, v200, z20, MyTool;
	ENDPROC
	PROC Path_10()
	    MoveJ Target_160,v50,z100,MyTool\WObj:=wobj0;
	    MoveL Target_170,v50,z100,MyTool\WObj:=wobj0;
	    MoveL Target_180,v50,z100,MyTool\WObj:=wobj0;
	    MoveC Target_190,Target_200,v50,z100,MyTool\WObj:=wobj0;
		MoveL Target_220,v50,z100,MyTool\WObj:=wobj0;
		MoveC Target_230,Target_240,v50,z100,MyTool\WObj:=wobj0;
		MoveL Target_250,v50,z100,MyTool\WObj:=wobj0;
		MoveL Target_260,v50,z100,MyTool\WObj:=wobj0;
		MoveL Target_270,v50,z100,MyTool\WObj:=wobj0;
		MoveL Target_280,v50,z100,MyTool\WObj:=wobj0;
	ENDPROC

ENDMODULE