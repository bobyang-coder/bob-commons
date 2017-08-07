package com.bob.commons.page;

import java.io.Serializable;
import java.util.List;

/**
 * 分页查询结果
 *
 * @author bob   <bobyang_coder@163.com>
 * @since 2017/8/7
 */
public class ResultList<T extends Serializable> implements Serializable {

    private Page page;
    private List<T> list;

    public ResultList() {
    }

    public Page getPage() {
        return this.page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public List<T> getList() {
        return this.list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
