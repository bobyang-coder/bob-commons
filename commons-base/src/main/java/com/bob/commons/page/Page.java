package com.bob.commons.page;

import java.io.Serializable;

/**
 * 分页查询对象
 *
 * @author bob   <bobyang_coder@163.com>
 * @since 2017/8/7
 */
public class Page implements Serializable {
    private static final long serialVersionUID = 0L;
    /**
     * 分页大小
     */
    private int pageSize = 10;
    /**
     * 总页数
     */
    private int totalPage;
    /**
     * 总结果数
     */
    private int totalResult;
    /**
     * 当期页码
     */
    private int currentPage;
    /**
     * 当前页结果数
     */
    private int currentResult;

    public Page() {
    }

    public int getTotalPage() {
        if (this.totalResult % this.pageSize == 0) {
            this.totalPage = this.totalResult / this.pageSize;
        } else {
            this.totalPage = this.totalResult / this.pageSize + 1;
        }
        return this.totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalResult() {
        return this.totalResult;
    }

    public void setTotalResult(int totalResult) {
        this.totalResult = totalResult;
    }

    public int getCurrentPage() {
        if (this.currentPage <= 0) {
            this.currentPage = 1;
        }
        if (this.currentPage > this.getTotalPage()) {
            this.currentPage = this.getTotalPage();
        }

        return this.currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return this.pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurrentResult() {
        this.currentResult = (this.getCurrentPage() - 1) * this.getPageSize();
        if (this.currentResult < 0) {
            this.currentResult = 0;
        }
        return this.currentResult;
    }

    public void setCurrentResult(int currentResult) {
        this.currentResult = currentResult;
    }
}
