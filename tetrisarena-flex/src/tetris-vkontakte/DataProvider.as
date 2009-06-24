import utils.MD5;

class Tetris.DataProvider {
  var API_ID = "1";
  var API_SECRET = "Tetris1secret";
  var API_SERVER_URL = "http://api.vkontakte.ru/api.php";
  var API_REQUEST_METHOD = "POST";
  var API_TEST_MODE = false;
  
  private var _viewer_id: Number;
  private var _request_params: Array;
  
  function DataProvider()
  {
    _request_params = new Array();
    _request_params["api_id"] = API_ID;
    _viewer_id = parseInt(_root.viewer_id);
    if (API_TEST_MODE) {
      _viewer_id = 6492;
      _request_params["test_mode"] = "1";
    }
  }
  
  
  /**
   * Sends user's score
   *
   */
  public function sendScore(score:Number, onComplete:Function)
  {
    _sendRequest("setUserScore", {params:{score:score}, onComplete:onComplete});
  }
  
  /**
   * Retreives users ratinf
   *
   */
  public function getUsersRating(onComplete:Function)
  {
    _sendRequest("getHighScores", {onComplete: onComplete})
  }
  
  
  
  /********************
   * Private methods
   ********************/ 
   
 /**
  * Sends request to the server
  *
  */
  private function _sendRequest(method:String, options:Object)
  {
    var response:XML = new XML();
    response.ignoreWhite = true;
    if (options.onComplete);
    response.onLoad = options.onComplete;
    var request:LoadVars = new LoadVars();
    
    var request_params:Object = {
      method: method
    };
    
    for (var key in _request_params)
    {
      request_params[key] = _request_params[key];
    }
    for (var key in options.params)
    {
      request_params[key] = options.params[key];
    }
    
    request["sig"] = _generate_signature(request_params);
    for (var key in request_params)
    {
      request[key] = request_params[key];
    }
    
    request.sendAndLoad(API_SERVER_URL, response, API_REQUEST_METHOD);
  }
  
  
 /**
  * Sorts array by keys
  *
  */
  private function _sort_array_by_keys(aInput: Object)
  {
    var aTemp = new Array();
    for (var sKey:String in aInput)
      aTemp.push([sKey, aInput[sKey]]);
    
    aTemp.sort(function () {
      return arguments[0][0] < arguments[1][0]}
      );
    var aOutput = new Array();
    for (var i:Number = aTemp.length - 1; i >= 0; i--)
    {
      aOutput[aTemp[i][0]] = aTemp[i][1];
    }
    return aOutput;
  }
  
  /**
   * Generates request signature
   *
   */
  private function _generate_signature(request_params) {
    var signature = "";
    var sorted_array = _sort_array_by_keys(request_params);
   
    // Note: make sure that the signature parameter is not already included in
    //       request_params array.
    for (var key in sorted_array)
      signature = key + "=" + sorted_array[key] + signature;
      
    signature = _viewer_id + signature + API_SECRET;
    return MD5.encrypt(signature);
  }
}