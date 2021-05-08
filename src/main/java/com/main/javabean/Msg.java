package com.main.javabean;

import java.util.HashMap;

/**
 * 通用的返回类
 */
public class Msg {
    //状态码 100--成功 200--失败
    private int code;

    //提示信息
    private String msg;

    //用户要返回给浏览器的数据
    private HashMap<String,Object> extend = new HashMap<>();

    /**
     * 处理成功返回结果
     * @return
     */
    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理成功");
        return result;
    }

    /**
     * 处理失败返回结果
     * @return
     */
    public static Msg fail() {
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("处理失败");
        return result;
    }

    public Msg add(String key,Object value) {
        this.getExtend().put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public HashMap<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(HashMap<String, Object> extend) {
        this.extend = extend;
    }

}
