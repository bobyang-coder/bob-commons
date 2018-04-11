<div class="pagination">
	<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}" />
	<#if (page.currentPage == 1) >
		<span class="firstPage">&nbsp;</span>
		<span class="previousPage">&nbsp;</span>
	<#else>
		<a class="firstPage" title="首页" href="javascript: $.pageSkip(1);">&nbsp;</a>
		<a class="previousPage" title="上一页" href="javascript: $.pageSkip(${page.currentPage-1});">&nbsp;</a>
	</#if>
	
	<#if (page.currentPage == page.totalPage) >
		<span class="nextPage">&nbsp;</span>
		<span class="lastPage">&nbsp;</span>
	<#else>
		<a class="nextPage" title="下一页" href="javascript: $.pageSkip(${page.currentPage+1});">&nbsp;</a>
		<a class="lastPage" title="尾页" href="javascript: $.pageSkip(${page.totalPage});">&nbsp;</a>
	</#if>
	<span class="pageSkip">
		<span>共</span><span id="pageTotal">${page.totalResult}</span><span>条 当前${page.currentPage}/${page.totalPage}页 到第<input id="currentPage" name="currentPage" value="${page.currentPage}" maxlength="9" onpaste="return false;" />页<button type="submit">&nbsp;</button></span>
	</span>
</div>
