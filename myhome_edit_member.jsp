<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<!--[if (IE 6)|(IE 7)|(IE 8)|(IE 9)]>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" class="old_ie">
<![endif]-->
<![if !IE]>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" class="">
<![endif]>
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<meta property="fb:pages" content="1567451316868458" />
<meta name="description" content="5���� �̻��� ������, ���� �˻�, ��õ ������, �α���� ������, ���� �̺�Ʈ">
<meta name="keywords" content="">
<meta name="google-site-verification" content="3eLg1zfxeZ_oO6oOOsvIxbtcW-FtDsViPVm7-CYOl8w" />
<title>������ ������</title>
<meta property="kakao:title" content="������ ������" />
<meta property="kakao:description" content="" />
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-PDPW2LX');</script>   
<link rel="stylesheet" type="text/css" href="http://recipe1.ezmember.co.kr/static/css/bootstrap_20180417.css" />
<link rel="stylesheet" type="text/css" href="/static/css/font.css" />
<link rel="stylesheet" type="text/css" href="/static/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="http://recipe1.ezmember.co.kr/static/css/ez_recipe_20190221.css" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="http://recipe1.ezmember.co.kr/img/icons/apple-touch-icon.png" rel="apple-touch-icon" />
<link href="http://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-76x76.png" rel="apple-touch-icon" sizes="76x76" />
<link href="http://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-120x120.png" rel="apple-touch-icon" sizes="120x120" />
<link href="http://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-152x152.png" rel="apple-touch-icon" sizes="152x152" />
<link href="http://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-180x180.png" rel="apple-touch-icon" sizes="180x180" />
<link href="http://recipe1.ezmember.co.kr/img/icons/icon-hires.png" rel="icon" sizes="192x192" />
<link href="http://recipe1.ezmember.co.kr/img/icons/icon-normal.png" rel="icon" sizes="128x128" />
<script type="text/javascript" src="http://recipe1.ezmember.co.kr/static/js/jquery-1.11.2.min.js" charset="utf-8"></script>
<script type="text/javascript" src="//static.criteo.net/js/ld/publishertag.js"></script>
<script type="text/javascript">
// Common Javascript
var _WWW_URL_ = 'http://www.10000recipe.com';
var _IMG_URL_ = 'http://recipe1.ezmember.co.kr';
var _FILE_URL_ = 'http://recipe1.ezmember.co.kr/cache';
var _CURRENT_PAGE_ = 'http://www.10000recipe.com/user/update.html?token=51300006';
var _USER_ID_ = '55520537';
</script>
</head>
<body>
 <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PDPW2LX"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>   
<div class="nav_etc"><a href="/index.html"><img src="http://recipe1.ezmember.co.kr/img/logo3.png"></a></div>
<script>
var opwFlag = false;

function chkEmailSSL() {
    emailFlag = false;
    var email = $("#id_email").val();
    if( !email )
    {
        viewMsg("email","�̸����� �Է��� �ּ���.","error");
        return ;
    }
    var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var isHan = /[��-����-��]/g;
    if (!isEmail.test(email) || isHan.test(email))
    {
        viewMsg("email","�̸��� �ּҰ� �ùٸ��� �ʽ��ϴ�.","error");
        return ;
    }
    if( email.length < 4 || email.length > 100 )
    {
        viewMsg("email","100�� �̳��� �Է��� �ּ���.","error");
        return ;
    }
    $.ajax({
        type: "POST",
        url: "https://www.10000recipe.com/user/ajax.html",
        dataType: 'jsonp',
        jsonpCallback: 'jsonEzCallback',
        data: "q_mode=checkDuplicateSSL&item=email&id="+btoa(unescape(encodeURIComponent(email))),
        success: function(result) {
            result = result['result'];
            switch(result)
            {
                case 'NO_USE' :
                    if($("#updNick").html()) emailSubmit(); //update ��
                    viewMsg("email","����� �� �ִ� �̸����Դϴ�.","success");
                    emailFlag = true;
                break;
                case 'DUPLICATE':
                    viewMsg("email","�̹� ������� �̸����Դϴ�.","error");
                break;
                case 'ERROR':
                    viewMsg("email","�����Դϴ�. �ٽ� �õ��� �ּ���.","error");
                break;
            }
        }
    });
}

function chkPasswdOld()
{
    opwFlag = false;
    var oldPassword1 = $("#tx_passwd_old").val();
    if( !oldPassword1 )
    {
        viewMsg("opw","���� ��й�ȣ�� �Է����ּ���.","error");
        return ;
    }
    $.ajax({
        type: "POST",
        url: "/user/ajax.html",
        data: {q_mode:"checkPassword",id:oldPassword1},
        success: function(result) {
            switch(result)
            {
                case 'OK' :
                    viewMsg("opw","Ȯ�εǾ����ϴ�.","success");
                    opwFlag = true;
                break;
                case 'WRONG' :
                    viewMsg("opw","��й�ȣ�� ��ġ���� �ʽ��ϴ�.","error");
                break;
                case 'ERROR':
                    viewMsg("opw","�����Դϴ�. �ٽ� �õ��� �ּ���.","error");
                break;
            }
        }
    });
}

function doChangePassword()
{
    if(!opwFlag)
    {
        chkPasswdOld();
        return ;
    }
    if(!pwFlag)
    {
        chkPasswd1();
        return ;
    }
    $.ajax({
        type: "POST",
        url: "/user/ajax.html",
        data: {q_mode:"checkPassword",id:newPassword1},
        success: function(result) {
            switch(result)
            {
                case 'OK' :
                    viewPWMsg("���� ��й�ȣ�� ���� ��й�ȣ�Դϴ�.","error");
                    return ;
                break;
                case 'WRONG' :
                break;
                case 'ERROR':
                    viewPWMsg("�����Դϴ�. �ٽ� �õ��� �ּ���.","error");
                    return ;
                break;
            }
        }
    });
    if(!chkPasswd2())
    {
        return ;
    }

    var newPassword1 = $("#tx_passwd").val();
    $.ajax({
        type: "POST",
        url: "/user/ajax.html",
        data: {q_mode:"updateUser",item:"password",id:newPassword1},
        success: function(result) {
            if(result == 'SUCCESS')
            {
                $("#pwResult").addClass("text-success");
                $("#pwResult").html("��й�ȣ�� ����Ǿ����ϴ�.");
                $("#updPw").hide();
            }
            else
            {
                $("#pwResult").addClass("text-danger");
                $("#pwResult").html("��й�ȣ ������ �����߽��ϴ�. �ٽ� �õ��� �ּ���.");
            }
        }
    });
}

function nickSubmit()
{
    var nick = $("#nm_user").val();
    $.ajax({
        type: "POST",
        url: "/user/ajax.html",
        data: {q_mode:"updateUser",item:"nick",id:nick},
        success: function(result) {
            if(result == 'SUCCESS')
            {
                $("#cur_nick").html('<strong>'+nick+'</strong>');
                $("#cur_nick").addClass('text-success');
                $('#updNick').hide();
            }
            else if(result == 'LIMITED')
            {
                viewMsg("nick","�г����� 24�ð��� �纯���� �� �����ϴ�.","error");
            }
            else if(result == 'DUPLICATE')
            {
                viewMsg("nick","������� �г����Դϴ�. �ٽ� Ȯ���� �ּ���.","error");
            }
            else
            {
                viewMsg("nick","�г��� ������ �����߽��ϴ�. �ٽ� �õ��� �ּ���.","error");
            }
        }
    });
}

function emailSubmit()
{
    var email = $("#id_email").val();
    $.ajax({
        type: "POST",
        url: "/user/ajax.html",
        data: {q_mode:"sendConfirmUpdateEmail",email:btoa(unescape(encodeURIComponent(email)))},
        success: function(result) {
            if(result == 'SUCCESS')
            {
                $("#updEmail").addClass("text-success");
                $("#updEmail").html('<p class="text-center">'+email+'�� Ȯ�� ������ �߼۵Ǿ����ϴ�.</p>');
            }
            else if(result == 'DUPLICATE')
            {
                viewMsg("email","������� �̸����Դϴ�. �ٽ� Ȯ���� �ּ���.","error");
            }
            else
            {
                viewMsg("email","Ȯ�� ���� �߼��� �����߽��ϴ�. �ٽ� �õ��� �ּ���.","error");
            }
        }
    });
}

function ChangeIntroduce()
{
    var intro = $("#intro").val();
    $.ajax({
        type: "POST",
        url: "/user/ajax.html",
        data: {q_mode:"updateintro",item:"intro",id:intro},
        success: function(result) {
            if(result == 'SUCCESS')
            {
                $("#cur_intro").html('<strong>'+intro+'</strong>');
                $("#cur_intro").addClass('text-success');
                $('#updintro').hide();
            }
        }
    });	
	}

function TotalChange()
{
	chkEmailSSL();
	nickSubmit();
	doChangePassword();
	ChangeIntroduce();
	}
	
</script>
<div class="container_etc" style="width:460px;">
  <h2>ȸ������ ����</h2>
  <div class="panel-body etc_wrap">
  
    
    <p style="margin:15px 0;line-height:34px;"><b>�̸��� ����</b></p>
        <div id="updEmail" margin-top:20px;">
          <div id="emailFrms" class="form-group has-feedback">
            <input type="text" name="frm[pro_id_email]" class="form-control" id="id_email" placeholder="�̸���">
            <span id="emailStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="emailMsg" style="display:none;"></span>
          </div>
          <p class="help-block">���� ��û�Ͻø� Ȯ�θ����� ���ο� �����ּҷ� �߼۵˴ϴ�.<br>������ �������� �ʴ´ٸ� ���������Ե� Ȯ���� �ּ���.</p>
       </div>
       <div class="etc_line"></div>
          
       	<p style="margin:15px 0;line-height:34px;"><b>�г��� ����</b></p>
       <div id="updNick" margin-top:20px;">
          <div id="nickFrms" class="form-group has-feedback">
            <input type="text" name="frm[pro_nm_user]" class="form-control" id="nm_user" placeholder="�г���">
            <span id="nickStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="nickMsg" style="display:none;"></span>
          </div>
          <p class="help-block">�г����� ������ 24�ð����� �ٽ� ������ �� �����ϴ�.<br>�������� �� Ȯ���� �ּ���.</p>
        </div>
        <div class="etc_line"></div>    
               
    <p style="margin:15px 0;line-height:34px;"><b>��й�ȣ ����</b></p>
        <div id="updpw" margin-top:20px;">
          <div id="pwFrms" class="form-group has-feedback">
            <input type="text" name="frm[pro_tx_passwd_old]" class="form-control" id="tx_passwd_old" placeholder="��й�ȣ">
            <span id="pwStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="pwMsg" style="display:none;"></span>
          </div>
          <p class="help-block">�̰� ������ ���� �� �� �ֳ���?<br>���� ���� ���� �;��..</p>
       </div>
       <div class="etc_line"></div>   
       
          <p style="margin:15px 0;line-height:34px;"><b>�ڱ�Ұ� ����</b></p>
        <div id="updintro" margin-top:20px;">
          <div id="introFrms" class="form-group has-feedback">
            <input type="text" name="frm[pro_intro]" class="form-control" id="intro" placeholder="�ڱ�Ұ�">
            <span id="introStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="introMsg" style="display:none;"></span>
          </div>
          <p class="help-block">�̰� ������ ���� �� �� �ֳ���?<br>���� ���� ���� �;��..</p>
       </div>
       <div class="etc_line"></div>      
        
        <div><p style="text-align:center"><button type="button" onClick="TotalChange()" class="btn btn-primary" style="width:150px">����</button></p></div>
        <div class="etc_line"></div>
        <p style="margin:15px 0;line-height:34px;">ȸ��Ż�� <button type="button" onClick="location.href='/user/out.html'" class="btn btn-default" style="float:right;">Ż���ϱ�</button></p>

  </div>
</div>
<script type="text/javascript" src="http://recipe1.ezmember.co.kr/static/js/user.min_20190308.js" charset="utf-8"></script>
<script type="text/javascript" src="http://recipe1.ezmember.co.kr/static/js/coreutil.min_20170112.js" charset="utf-8"></script>
<script type="text/javascript" src="http://recipe1.ezmember.co.kr/static/js/ui.min_20150609.js" charset="utf-8"></script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-62003031-2', 'auto');
  ga('require', 'displayfeatures');
  ga('send', 'pageview');
</script>
<img src="//kr-gmtdmp.mookie1.com/t/v2/learn?tagid=V2_255869&src.rand=[timestamp]" style="display:none;"/>
<img src="//kr-gmtdmp.mookie1.com/t/v2/activity?tagid=V2_281041&src.rand=[timestamp]" style="display:none;"/>
<iframe src="//static-tagr.gd1.mookie1.com/s1/sync-apac.html?cc=KR" style="display:none;"></iframe>

</body>
</html>