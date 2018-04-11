package com.bob.common.http;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

/**
 * Web下载相关
 *
 * @author bob   <bobyang_coder@163.com>
 * @version v1.0
 * @since 2017/9/28
 */
public class HttpDownloadUtil {

    /**
     * 设置下载的响应参数
     *
     * @param request
     * @param response http响应
     */
    public static void setDownloadResponseParam(HttpServletRequest request, HttpServletResponse response, String fileName) {
        response.setHeader("Cache-Control", "private");
        response.setHeader("Pragma", "private");
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setHeader("Content-Type", "application/force-download");
        response.setHeader("Content-Disposition", "attachment;filename=" + processFileName(request, fileName));
    }

    /**
     * 处理文件名称中文乱码问题
     *
     * @param request
     * @param fileName
     * @return
     */
    public static String processFileName(HttpServletRequest request, String fileName) {
        String codedfilename = null;
        String msie = "MSIE";
        String trident = "Trident";
        String mozilla = "Mozilla";
        try {
            String agent = request.getHeader("USER-AGENT");
            boolean b = null != agent && agent.contains(msie) || null != agent && agent.contains(trident);
            if (b) {
                codedfilename = URLEncoder.encode(fileName, "UTF-8");
            } else if (null != agent && agent.contains(mozilla)) {
                codedfilename = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return codedfilename;
    }

}
