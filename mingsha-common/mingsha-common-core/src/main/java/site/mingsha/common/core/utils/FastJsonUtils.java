package site.mingsha.common.core.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.TypeReference;

/**
 * @author chenlong
 * @create: 2024-03-20 16:17
 */
public class FastJsonUtils {


    /**
     * 用fastjson 将json字符串解析为一个 JavaBean
     *
     * @param jsonString
     * @param cls
     * @return
     */
    public static <T> T getObject(String jsonString, Class<T> cls) {
        T t = null;
        try {
            t = JSON.parseObject(jsonString, cls);
        } catch (Exception e) {
        }
        return t;
    }

    /**
     * 用fastjson 将json字符串 解析成为一个 List<JavaBean> 及 List<String>
     *
     * @param jsonString
     * @param cls
     * @return
     */
    public static <T> List<T> getList(String jsonString, Class<T> cls) {
        List<T> list = new ArrayList<T>();
        try {
            list = JSON.parseArray(jsonString, cls);
        } catch (Exception e) {
        }
        return list;
    }

    /**
     * 用fastjson 将jsonString 解析成 List<Map<String,Object>>
     *
     * @param jsonString
     * @return
     */
    public static List<Map<String, Object>> getListMap(String jsonString) {
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        try {
            list = JSON.parseObject(jsonString, new TypeReference<List<Map<String, Object>>>() {
            });
        } catch (Exception e) {

        }
        return list;
    }

    /**
     * 用fastjson 将jsonString 解析成 Map<String,Object>
     *
     * @param jsonString
     * @return
     */
    public static Map<String, Object> getMap(String jsonString) {
        Map<String, Object> map = new HashMap<>();
        try {
            map = (Map<String, Object>) JSON.parse(jsonString);
        } catch (Exception e) {

        }
        return map;
    }

    /**
     * 用fastjson 将obj解析成 json字符串
     *
     * @param object
     * @return
     */
    public static String getJsonStr(Object object) {
        try {
            return JSON.toJSONString(object);
        } catch (Exception e) {
        }
        return null;
    }
}
