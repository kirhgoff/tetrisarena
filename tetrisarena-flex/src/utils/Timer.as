/* This code is based on 
 * Ilario Mazzei tetris application
 * Contact email: m360@libero.it
 *
 */
 
class utils.Timer{
	private var Time1:Number;
	private var newTime:Number;
	private var Delay:Number;
	
	function Timer(_Delay:Number){
		Delay = _Delay;
		Time1 = getTimer();
	}
	
	function setDelay(_Delay:Number){
		Delay = _Delay;
	}
	
	function cTime():Boolean{
		newTime = getTimer();
		if ((newTime - Time1) >= Delay){
			Time1 = newTime;
			return true;
		} else return false;
	}
		
	function TReset(){
		Time1 = getTimer();
	}
}