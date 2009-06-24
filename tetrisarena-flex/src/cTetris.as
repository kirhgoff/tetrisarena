/* This code is based on 
 * Ilario Mazzei tetris application
 * Contact email: m360@libero.it
 *
 */

import Tetris.DataProvider;

class cTetris extends MovieClip{
  
  private var sMessage: MovieClip;
  private var sLevel:MovieClip;
  private var sHighScores:MovieClip;
  private var style_sheet: TextField.StyleSheet;
  private var dataProvider: DataProvider;
	function cTetris(){
	  dataProvider = new DataProvider();
    sMessage =    eval(_parent + ".sMessage");
    sLevel =      eval(_target + ".sLevel");
    sHighScores = eval(_parent + ".sHighScores");
    
    style_sheet = new TextField.StyleSheet();
    style_sheet.setStyle("a",
      {
      fontWeight: 'bold'
      }
    );
    style_sheet.setStyle("p",
      {fontFamily: 'Tahoma,Helvetica,Arial,sans-serif', 
      fontSize: '12px',
      fontWeight: 'normal',
      color: '#333333'
      }
    );
  }
	
	
	function TetrisStart(){
		var initobj:Object=new Object();
	  sLevel.addEventListener("onStart",this);
		sLevel.addEventListener("onInitLevel",this);
		sLevel.addEventListener("onPause",this);
		sLevel.addEventListener("onEndPause",this);
		sLevel.addEventListener("onGameOver",this);		
		sLevel.addEventListener("onLinesDeleted",this);
		initobj._delayKeyPress = 300;
		initobj._delayKeyDown=30;
		initobj._delayAlpha=30;		
		if (sLevel.Blocks == undefined) 
		  sLevel.initApp(initobj);
		sLevel.initLevel(1);
		sLevel.onEnterFrame = sLevel.runBlocks;
		
    sMessage.gotoAndStop(1);
	}
	
	function TetrisPause(){
		sLevel.ToPause = true;
		if (sLevel.pflag)
		  sMessage.gotoAndStop(1);
		else
			sMessage.gotoAndStop("pause");
	}
	
	function TetrisStop(){
		sLevel.ToStop = true;
	}
	
	function TetrisResume(){
	  sHighScores.gotoAndStop(1);
  	if (sLevel.Blocks != undefined  && !sLevel.ToStop)
      TetrisPause();
	}
	
	function TetrisHighScores(){
	  if (!sLevel.pflag && sLevel.Blocks != undefined && !sLevel.ToStop)
	    TetrisPause();
	  sHighScores.gotoAndStop("Loading");
	  var self:Object = this;
	  dataProvider.getUsersRating(function(success:Boolean){ // limit == 10
	    self.sHighScores.gotoAndStop("HighScores");
	    if (success) {
	      trace(this);
        var txtUserNames:TextField = self.sHighScores.txtUserNames;
        var txtScores:TextField = self.sHighScores.txtScores;
        
        txtUserNames.styleSheet = self.style_sheet;
        txtScores.styleSheet = self.style_sheet;
        var scores:Array = new Array();
        for (var fNode:XMLNode = this.firstChild.firstChild; fNode != null; fNode = fNode.nextSibling) {
          var user_id: String;
          var user_name: String;
          var score: Number;
            for (var cNode:XMLNode = fNode.firstChild; cNode != null; cNode = cNode.nextSibling) {
              switch (cNode.nodeName){
                case 'user_id':   user_id = cNode.firstChild.nodeValue;         break;
                case 'user_name': user_name = cNode.firstChild.nodeValue;       break;
                case 'score':     score = parseInt(cNode.firstChild.nodeValue); break;
              }
            }
            scores.push({user_id: user_id, user_name: user_name, score: score});
        }
        txtUserNames.htmlText = txtScores.htmlText = "";
        
        for (var i:Number = 0; i < scores.length; i++)
        {
          txtUserNames.htmlText += "<p>" + (i+1) + '. <a href="http://vkontakte.ru/id' + scores[i]['user_id'] + '" target="_blank">' + scores[i]['user_name'].substr(0, 25) + '</a></p>';
          txtScores.htmlText += "<p>" + scores[i]['score'] + "</p>";
        }
      } else {
        self.sHighScores.txtUserNames.htmlText = "Connection failed.";
      }
	  });
	}
	
	function onGameOver(e:Object){
	  sMessage.gotoAndStop("GameOver");
	  dataProvider.sendScore(e.score, function(success:Boolean){
	    if (success) {
             // trace(this);
      } else {
              trace("error downloading content");
      }
	  });
	}
	
}