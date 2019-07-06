<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="container sub_bg">
	<script>
		$(document).ready(function() {
			dropDownMenuTxtSet('1');
			dropDownMenuTxtSet('2');
		});

		$(function() {
			$("#ranking_tab_title").text('�ҽĹޱ� ����');
			$("#ranking_tab_explain").text('���� ���� �ҽĹޱ� ���� ������');

			$("#user_search_input").keypress(function(e) {
				if (e.which == 13) {
					searchUser();
				}
			});
		});

		function searchUser() {
			var qn = $("#user_search_input").val();
			if (qn == '') {
				location.href = '/chef/chef_list.html?order=chef_no_follower&term=all';
			} else {
				location.href = '/chef/chef_list.html?order=chef_no_follower&qn='
						+ qn + '&term=all';
			}
		}

		function doActFriend(uid) {
			EZ.ATLogin();
			return;
			var act = $("#btnActFriend_" + uid).attr("fact");
			var mode = (act == "insert") ? "addFriend" : "removeFriend";
			$
					.ajax({
						type : "GET",
						url : "/profile/ajax.html",
						data : "q_mode=" + mode + "&friend=" + uid,
						success : function(result) {
							if (result == 'SUCCESS') {
								var fact = (act == "insert") ? "delete"
										: "insert";
								var fval = (act == "insert") ? "����" : "�߰�";
								var msg = (act == 'insert') ? '���� �ҽĹޱ⿡ �߰��߽��ϴ�.'
										: '���� �ҽĹޱ⿡�� �����߽��ϴ�.';
								$("#btnActFriend_" + uid).attr("fact", fact);

								if (act == "insert")
									$("#btnActFriend_" + uid)
											.html(
													'<span class="glyphicon glyphicon-minus"></span>�ҽĹޱ�����');
								else
									$("#btnActFriend_" + uid)
											.html(
													'<span class="glyphicon glyphicon-plus"></span>�ҽĹޱ�');

								var uname = $("#folFriend_" + uid).text()
										.trim();

								ga('send', 'event', '�̿��߰�', fval, uname);

								alert(uname + msg);
							} else {
								alert('ó������. ����� �ٽ� �õ��� �ּ���.');
							}
						}
					});
		}

		function setTerm(val) {
			location.href = '/chef/chef_list.html?order=chef_no_follower&qn=&term='
					+ val;
		}

		function dropDownMenuTxtSet(flag) {
			if (flag == '1') {
				var txt = '����';
				$("#dropdownMenu" + flag).html(
						'<span class="glyphicon glyphicon-calendar"></span>'
								+ txt);
			} else if (flag == '2') {
				var txt = '�ҽĹޱ����';
				$("#dropdownMenu" + flag).html(
						'<span class="glyphicon glyphicon-align-justify"></span>'
								+ txt);
			}
		}
	</script>
	<div id="contents_area" class="col-xs-9">
		<div class="chef_list4">
			<%
			String chefmenu = request.getParameter("chefmenu");
			System.out.print(chefmenu);
			if (chefmenu == null) {
				chefmenu = "chef_chef";
			} else if (chefmenu.equals("chef")) {
				chefmenu = "chef_chef";
			} else if (chefmenu.equals("informed")) {
				chefmenu = "chef_chefinformed";
			}
			%>
			<ul class="nav nav-tabs3" style="position: relative;">
				<li role="presentation" class="active"><a
					href="./BoardContent.bo?pagefile=chef&chefmenu=chef">����</a></li>
				<li role="presentation">
				<a href="./BoardContent.bo?pagefile=chef&chefmenu=informed">�ҽĹ޴½���</a></li>
				<div class="list_sort">
					<div class="chef_search">
						<input type="text" id="user_search_input" value=""
							class="form-control" placeholder="���� �г����� �Է��� �ּ���."><span
							class="glyphicon glyphicon-search"></span>
						<button type="submit" onclick="searchUser()" class="btn search">�˻�</button>
					</div>
				</div>
			</ul>
		</div>
		
		<div class="chef_list_under">
		<jsp:include page='<%="../chef/" + chefmenu + ".jsp"%>'></jsp:include>	
		<!-- board_chef_content.jsp �� ���� jsp �� �θ��� ���� ���
		<jsp:include page ="../chef/chef_chef.jsp"></jsp:include>
		 -->
		 
		</div>
	</div>

	<div id="right_area" class="col-xs-3">
		<div style="text-align: center; margin-top: 10px">
			<script async=""
				src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
			<!-- 10k_w_right_300_250 -->
			<ins class="adsbygoogle"
				style="display: inline-block; width: 15px; height: 250px;"
				data-ad-client="ca-pub-1557771002660658" data-ad-slot="7619851795"
				data-adsbygoogle-status="done"></ins>
			<script>
				(adsbygoogle = window.adsbygoogle || []).push({});
			</script>
		</div>
		<script type="text/javascript">
		<!--
			$(document).ready(
					function() {
						EZ.countLog('event_chef_chef_list_right', 'web',
								'read', '261');
					});
		//-->
		</script>
		<div style="margin: 10px;">
			<a href="/event/261?q_from=event_chef_chef_list_right"
				onclick="EZ.countLog('event_chef_chef_list_right','web','click','261');"><img
				src="http://recipe1.ezmember.co.kr/cache/rpe/2019/06/27/bd477e77ee10e777c5ea4d0145d7d7771.jpg"
				style="width: 100%;"></a>
		</div>

		<script type="text/javascript">
		<!--
			$(document).ready(
					function() {
						EZ.countLog('event_chef_chef_list_right', 'web',
								'read', '259');
					});
		//-->
		</script>
		<div style="margin: 10px;">
			<a href="/event/259?q_from=event_chef_chef_list_right"
				onclick="EZ.countLog('event_chef_chef_list_right','web','click','259');"><img
				src="http://recipe1.ezmember.co.kr/cache/rpe/2019/06/13/f610c8ae4b06ab6e631a7e1914888cdd1.jpg"
				style="width: 100%;"></a>
		</div>



		<div style="text-align: center; margin-top: 10px">


			<script async=""
				src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
			<!-- 10k_w_right_300_600 -->
			<ins class="adsbygoogle"
				style="display: inline-block; width: 15px; height: 600px;"
				data-ad-client="ca-pub-1557771002660658" data-ad-slot="8777892938"
				data-adsbygoogle-status="done"></ins>
			<script>
				(adsbygoogle = window.adsbygoogle || []).push({});
			</script>

		</div>


	</div>
	<!-- /right_area -->
	<div class="col-xs-12 sub_bg_btm"></div>
</div>