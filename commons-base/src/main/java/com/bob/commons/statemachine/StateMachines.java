package com.bob.commons.statemachine;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.collections4.MapUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * 状态机
 *
 * @author haibo.yang
 * @since 12 六月 2018
 */
public class StateMachines {

    private Map<String, Map<String, List<String>>> statemachines = Maps.newHashMap();

    public StateMachines() {
    }

    public Map<String, Map<String, List<String>>> getStatemachines() {
        return this.statemachines;
    }

    public void setStatemachines(Map<String, Map<String, List<String>>> statemachines) {
        this.statemachines = statemachines;
    }

    /**
     * 判断状态是否允许改变
     *
     * @param machine 状态机
     * @param from    当前状态
     * @param to      目标状态
     * @return
     */
    public boolean permit2Change(String machine, String from, String to) {
        if (StringUtils.isEmpty(machine) || StringUtils.isEmpty(from) || StringUtils.isEmpty(to)) {
            return false;
        }
        if (MapUtils.isEmpty(this.statemachines) || !this.statemachines.containsKey(machine)) {
            return false;
        } else {
            Map<String, List<String>> instance = this.statemachines.get(machine);
            if (MapUtils.isEmpty(instance) || !instance.containsKey(from)) {
                return false;
            } else {
                List<String> candidates = instance.get(from);
                return CollectionUtils.isNotEmpty(candidates) && candidates.contains(to);
            }
        }
    }


    public static void main(String[] args) {
        String json = "{\"subscribe\": {\n" +
                "            \"Start\": [\n" +
                "                \"Submitted\",\n" +
                "                \"Cancelled\"\n" +
                "            ],\n" +
                "            \"Submitted\": [\n" +
                "                \"Confirmed\",\n" +
                "                \"Cancelled\"\n" +
                "            ],\n" +
                "            \"Confirmed\": [\n" +
                "                \"SignIned\",\n" +
                "                \"Cancelled\"\n" +
                "            ],\n" +
                "            \"SignIned\": [\n" +
                "                \"Finish\",\n" +
                "                \"Cancelled\"\n" +
                "            ]\n" +
                "        }}";

        Map map = JSON.parseObject(json, Map.class);
        StateMachines machines = new StateMachines();
        machines.setStatemachines(map);
        boolean b = machines.permit2Change("subscribe", "Submitted", "Cancelled");
        System.out.println(b);

    }
}
