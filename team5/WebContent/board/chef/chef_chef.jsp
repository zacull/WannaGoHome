<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="chef_list4">
	<div class="chef_top2">
		<img src="http://recipe1.ezmember.co.kr/img/chef_top3.jpg" border="0"
			usemap="#Map">
		<map name="Map">
			<area shape="rect" coords="622,19,737,75" href="/chef/apply.html"
				alt="����Ȱ���ڼ�������">
		</map>
	</div>

	<ul class="my_nav2">
		<li id="" class="active">
		<a href="./BoardContent.bo?pagefile=chef&chefmenu=chef&chefselect=informedrank" id="ranking_tab_title">�ҽĹޱ� ����</a></li>
		<li id=""><a href="./BoardContent.bo?pagefile=chef&chefmenu=chef&chefselect=recentactivity">�ֱ�Ȱ������</a></li>
		<li id=""><a href="./BoardContent.bo?pagefile=chef&chefmenu=chef&chefselect=newchef">���ο��</a></li>
	</ul>
	
	<%
		String chefselect = request.getParameter("chefselect");
		if(chefselect==null) { chefselect="chef_chef_informedrank"; }
		else if(chefselect.equals("informedrank")) { chefselect="chef_chef_informedrank"; }
		else if(chefselect.equals("recentactivity")) { chefselect="chef_chef_recentactivity"; }
		else if(chefselect.equals("newchef")) { chefselect="chef_chef_newchef"; }
	%>
	
	<jsp:include page='<%="../chef/" + chefselect + ".jsp"%>'></jsp:include>	
	
		<%-- board_chef_content.jsp �� ���� jsp �� �θ��� ���� ���	<jsp:include page ="../chef/chef_chef_informedrank.jsp"></jsp:include>--%>
	
</div>