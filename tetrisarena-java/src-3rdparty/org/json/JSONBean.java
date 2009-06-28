package org.json;

import java.lang.reflect.Method;

import junit.framework.Assert;

import org.junit.Test;
import org.kirhgoff.tetrisarena.model.GameModel;
 
public abstract class JSONBean implements JSONSerializable {
 
    public boolean fromJSONObj(JSONObject jsonObj) {
        Class beanClass = this.getClass();
        Method[] methods = beanClass.getMethods();
        for (int i = 0;  i < methods.length; i += 1) {
            try {
                Method method = methods[i];
                String name = method.getName();
                String key = "";
                if (name.startsWith("set")) {
                    key = name.substring(3);
                }
                if (key.length() > 0 &&
                        Character.isUpperCase(key.charAt(0)) &&
                        method.getParameterTypes().length == 1) {
                    if (key.length() == 1) {
                        key = key.toLowerCase();
                    } else if (!Character.isUpperCase(key.charAt(1))) {
                        key = key.substring(0, 1).toLowerCase() +
                            key.substring(1);
                    }
                    if (isAllowedKey(key))
                        method.invoke(this, jsonObj.get(key));
                }
            } catch (Exception e) {
                return false;
            }
        }
        return true;
    }
 
    public JSONObject toJSONObject() {
        return new JSONObject(this) {
            @Override
            public Object get(String key) throws JSONException {
                return isAllowedKey(key) ? super.get(key) : null;
            }
        };
    }
 
    protected static boolean isAllowedKey(String key) {
        return ((key != "class") && (key != "instance"));
    }
    
}