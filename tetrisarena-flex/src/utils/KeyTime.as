/* This code is based on 
 * Ilario Mazzei tetris application
 * Contact email: m360@libero.it
 *
 */
 
import utils.Timer;

class utils.KeyTime{
	static private var delayKeyPress:Number;
	static private var delayKeyDown:Number;	
	static private var TimerKey:Timer;
	static private var codeKeyPressed:Number;
	static private var KeyListener:Object;
	static var KeyPressed:Boolean;
	
	static function setKT(initobj:Object){
	  delayKeyPress = initobj._delayKeyPress
		delayKeyDown = initobj._delayKeyDown
		TimerKey = new Timer(delayKeyPress)
		
		codeKeyPressed = 0;
		KeyPressed = false;
		
		KeyListener = new Object();
		
		KeyListener.onKeyDown = function(){
			KeyPressed = true;
		}
		KeyListener.onKeyUp = function(){
			KeyPressed = false;
		}
		
		Key.addListener(KeyListener);
	}
	
	static function Check():Boolean {
	  if (!KeyPressed) {
	    codeKeyPressed = 0;
	    return false;
	  }
	  if (codeKeyPressed == 0) {
	    TimerKey.TReset();
      TimerKey.setDelay(delayKeyPress);
      codeKeyPressed = Key.getCode();
      return true;
	  } else if (codeKeyPressed == Key.getCode()) {
	    if (TimerKey.cTime()) {
  				TimerKey.setDelay(delayKeyDown);
  				return true;							
  		}
	    
	  }
		return false;
		/*
	  if (code != 0){
			if (codeKeyPressed == 0){				
				codeKeyPressed = code;
				TimerKey.TReset();
				return true;
			} else {
				if (code == codeKeyPressed) {
					if (TimerKey.cTime()) {
						TimerKey.setDelay(delayKeyDown);
						return true;							
					}
				} else {
					TimerKey.setDelay(delayKeyPress);
					codeKeyPressed = code;
				}
			}
		}
		return false;*/
	}
	
	static function Reset(){
		TimerKey.setDelay(delayKeyPress);
		TimerKey.TReset();
	}
	
}