<!-- Breadcrumb-->
<%@ taglib prefix="s" uri="/struts-tags"%>
<ol class="breadcrumb">

	<s:if test="PageName != null">
		<li class="breadcrumb-item">
			<a href="ownerPage.action">
				<s:property value="lgView.getId('001')" />
			</a>
		</li>
		<li class="breadcrumb-item">
			<s:property value="PageName" />
		</li>
	</s:if>
	<s:else>
		<li class="breadcrumb-item">
			<s:property value="lgView.getId('001')" />
		</li>
	</s:else>
</ol>