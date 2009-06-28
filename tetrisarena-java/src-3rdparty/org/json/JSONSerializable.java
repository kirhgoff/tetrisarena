package org.json;

import org.json.JSONObject;
 
public interface JSONSerializable {
 
    public boolean fromJSONObj(JSONObject object);
 
    public JSONObject toJSONObject();
 
}