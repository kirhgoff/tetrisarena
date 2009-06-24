/* This code is based on 
 * Ilario Mazzei tetris application
 * Contact email: m360@libero.it
 *
 */

class Tetris.LevelType{
	var _Delay:Number;
	var acceleration:Number=-40;
	var scoreToGo:Number;
	
	function GetLevel(i:Number, accelerate:Boolean){
	  _Delay = Math.max(100, 500 + accelerate * (i-1) * acceleration);
		scoreToGo = (i == 1) ? 200:  scoreToGo * 2;
	}
}