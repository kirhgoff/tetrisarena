class Tetris.BlockType{
	var bMatrix:Array;
	var iMatrix:Array;
	var bColor:String;
	var bOffL:Array;
	var bOffC:Array;

	function GetBlock(i){
		switch (i){
			case 1://L1
				bMatrix=new Array([1,0,0],[1,1,1]);
				iMatrix=new Array(2,3);//numbers of lines and cols
				bOffL=new Array(0,1,-1,0);//offset - lines to add after rotating - a rotation cause a state change
				bOffC=new Array(0,0,1,-1);//offset - colons to add after rotating - when initilized a block is in 
				bColor="color1";			  //state 0 (bState variable in Tetris.Level)- after a rotation is in
				break;					  //state 1 - after in state 2 - after in state 3- after return in state 0
			case 2://L2
				bMatrix=new Array([0,0,1],[1,1,1]);
				iMatrix=new Array(2,3);
				bOffL=new Array(0,1,-1,0);
				bOffC=new Array(0,0,1,-1);
				bColor="color2";
				break;
			case 3://S1
				bMatrix=new Array([1,1,0],[0,1,1]);
				iMatrix=new Array(2,3);
				bOffL=new Array(0,0,0,0);
				bOffC=new Array(1,-1,1,-1);
				bColor="color3";
				break;
			case 4://S2
				bMatrix=new Array([0,1,1],[1,1,0]);
				iMatrix=new Array(2,3);
				bOffL=new Array(0,0,0,0);
				bOffC=new Array(1,-1,1,-1);
				bColor="color4";
				break;
			case 5://Kappa
				bMatrix=new Array([0,1,0],[1,1,1]);
				iMatrix=new Array(2,3);
				bOffL=new Array(0,1,-1,0);
				bOffC=new Array(0,0,1,-1);
				bColor="color5";
				break;
			case 6://Line
				bMatrix=new Array([1,1,1,1],[0,0,0,0]);
				iMatrix=new Array(1,4);
				bOffL=new Array(0,0,0,0);
				bOffC=new Array(1,-1,1,-1);
				bColor="color6";
				break;
			case 7://Cubo
				bMatrix=new Array([1,1],[1,1]);
				iMatrix=new Array(2,2);
				bOffL=new Array(0,0,0,0);
				bOffC=new Array(0,0,0,0);
				bColor="color7";
				break;				
		}
	}
}