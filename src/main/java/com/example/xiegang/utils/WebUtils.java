package com.example.xiegang.utils;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class WebUtils {

    /**
     * 获得字符串渲染到客户端
     *
     * @date 14:34 2022/1/26
     * @param response 渲染对象
     * @param string 待渲染的字符串
     * @return
     */
    public static String renderString(HttpServletResponse response,String string){
        try {
            response.setStatus(200);
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(string);
        }
        catch (IOException e){
            e.printStackTrace();
        }
        return null;
    }
}
