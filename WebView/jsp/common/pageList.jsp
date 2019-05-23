<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
</style>
<s:if test="pageVo != null">
	<ul class="pagination justify-content-end" id="page-control">
		<li class="page-item">
			<a class="btn btn-outline-secondary" :class="{disabled:(currentPage == 1 || currentPage > pageCounts)}" @click="prevPage()"> ${ "<<" } </a>
		</li>
		<li class="page-item" v-for="(v, i) in pageArray" :key="i">
			<a class='btn btn-outline-secondary' :class="{disabled: currentPage==v}" v-text="v" @click="goPage(v)"> </a>
		</li>
		<li class="page-item">
			<a class="btn btn-outline-secondary" :class="{disabled:(currentPage == pageCounts && currentPage > pageCounts)}" @click="nextPage()"> ${ ">>" } </a>
		</li>
	</ul>
	<script type="text/javascript">
		var pageControl = new Vue(
				{
					el : '#page-control',
					name : 'PageControl', 
					data : JSON.parse(`${ pageVo.object }`),
					computed : {
						pageArray : function() {
							var vm = this
							var result = []
							for (var i = 1, j = 0; i <= this.pageCounts; i++) {
								result[j] = ++j;
							}
							result = $.map(result, function(val, key) {
								if (val < vm.currentPage + 3  && val > vm.currentPage - 3 ){
									return val  ;
								}
							})
							return result;
						},
						pageUrl : function(){
							var url = `${ request['javax.servlet.forward.request_uri'] }`;
							return url + g.getUrlParams({
								"goPage" : this.currentPage
							})
						}
					},
					mounted : function() {

					},
					methods : {
						nextPage : function() {
							if (this.currentPage + 1 > this.pageCounts)
								return;
							this.goPage(this.currentPage + 1);
						},
						prevPage : function() {
							if (this.currentPage - 1 <= 0)
								return;
							this.goPage(this.currentPage - 1);
						},
						goPage : function(p) {
							this.currentPage = p;
						},
					},
				})
	</script>
</s:if>