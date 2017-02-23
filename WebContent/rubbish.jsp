<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>�ռ���</title>
		<link href="images/zh-cn/globle_v1.css" rel="stylesheet"
			type="text/css">
		<link href="images/zh-cn/inbox.css" rel="stylesheet" type="text/css">
		<link href="images/zh-cn/skin_blue.css" rel="stylesheet"
			type="text/css" id="lnkSkin" />
	</head>

	<script type="text/javascript">
	function changeframe(item, sortname, src) { 
		if(item != "" && sortname != "") { 
			window.top.frames['mainFrame'].getObject('show_text').innerHTML = sortname + "  <img src=images/slide.gif broder=0 />  " + item 
		} 
		if(src != "") { 
			window.top.frames['manFrame'].location = src 
		} 
	} 
</script>
	<script type="text/javascript">   
        function checkall(){   
            var all = document.getElementById("oFormCheckAll");   
            var sub = document.getElementsByName("mid");   
            if(all.checked==true){   
                for(var i=0;i<sub.length;i++){   
                    sub[i].checked=true;   
                }   
            }else{   
                for(var i=0;i<sub.length;i++){   
                    sub[i].checked=false;   
                }   
            }   
        }   
    </script>

	<script language="javascript"> 
	function action1() 
	{ var n = 0; 
		var objs = document.getElementsByName("mid"); 
		for(var i=0;i <objs.length;i++)  
		{ 
		if(objs[i].checked) 
			n=n+1; 
		} 
		if( n == 0 ) {
			alert("����ѡ��һ��!");
		}else { 
			if(confirm("�Ƿ񽫴˷��ʼ�ɾ��?��ɾ�����ָܻ�����")){
			   document.messageForm.action="clearrubbish.do"; 
			   document.messageForm.submit(); 
		   }
	   }
	} function action2() 
	{ var n = 0; 
		var objs = document.getElementsByName("mid"); 
		for(var i=0;i <objs.length;i++)  
		{ 
		if(objs[i].checked) 
			n=n+1; 
		} 
		if( n == 0 ) {
			alert("����ѡ��һ��!");
		}else {
		   document.messageForm.action="rubbishmoveto.do"; 
		   document.messageForm.submit();
		 }
	}
	function changepage(s){
		
	   document.messageForm.action="gorubbish2.do?pageNo="+s; 
	   document.messageForm.submit();
	}
</script>
	<body class="All_C_Page Inbox">
		<form name="messageForm" id="oFormMessage" method="post">
			<div class="ContentWp">
				<div class="ContentThemeWp">
					<div class="gTitle">
						<b class="mTT"> </b> &nbsp;&nbsp;(��&nbsp;
						<b id="oTotal">${fn:length(rubbishEmailBeanList)}</b>&nbsp;��)
					</div>
					<div class="gToolbar gTbrTop">
						<input type="button" onclick="action1()" class="Btn BtnNml ImpBtn"
							value="����ɾ��" />

						<select class="Sel" name="moveto" onchange="action2()">
							<option value="none" selected="selected">
								�ƶ���...
							</option>
							<option value="receivebox">
								&nbsp;&nbsp;�ռ���
							</option>
							<option value="deletedbox">
								&nbsp;&nbsp;��ɾ���ʼ�
							</option>
							<option value="scriptbox">
								&nbsp;&nbsp;�ݸ���
							</option>
							<option value="sendedbox">
								&nbsp;&nbsp;�ѷ����ʼ�
							</option>
							<option value="adbox">
								&nbsp;&nbsp;����ʼ�
							</option>
							<option value="none" class="SelOptLine">
								-------------
							</option>
						</select>
						<div class="Extra">
							<span class="Txt"><span class="Unable"><a
									href="gorubbish2.do?pageNo=1">��ҳ</a>
							</span>&nbsp;&nbsp; <span class="Unable"><a
									href="gorubbish2.do?pageNo=${rubbishPageNo - 1 }">��ҳ</a>
							</span> &nbsp;&nbsp; <span class="Unable"> <a
									href="gorubbish2.do?pageNo=${rubbishPageNo + 1 }">��ҳ</a>
							</span>&nbsp;&nbsp; <span class="Unable"><a
									href="gorubbish2.do?pageNo=${rubbishTotalPages }">ĩҳ</a>
							</span> </span>
							<select class="SelA" style="margin-right: 0px" name="pageNo"
								onchange="changepage(this.value)">
								<c:forEach var="t" begin="1" end="${rubbishTotalPages}">
									<option value="${t }">
										${t }/${rubbishTotalPages }
									</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="Ibx_Main_Wp">
						<table id="oTableHead" class="Ibx_gTable F2Img Ibx_gTable_TT">
							<tbody>
								<tr>
									<th class="Ibx_Th_F"></th>
									<th class="Ibx_Th_Chkbx">
										<input id="oFormCheckAll" onclick="checkall()" type="checkbox"
											title="ȫѡ/��ѡ����ҳ�����ʼ�" />
									</th>
									<th class="Ibx_Th_icoInfo">
										<b class="icoIbx" title='�ʼ�����'><img
												src="images/web_icon_013.gif" />
										</b>
									</th>
									<th class="Ibx_Th_From">
										<a href="#" title="����ɰ�������">�ռ���</a>
									</th>
									<th class="Ibx_Th_icoFlag">
										<b class="icoIbx" title='�ʼ���ǩ'><img src="images/9.JPG">
										</b>
									</th>
									<th class="Ibx_Th_Subject">
										<a href="#" title="����ɰ�������">����</a>
									</th>
									<th class="Ibx_Th_Date">
										<a href="#" title="����ɰ�������">����<b class="icoIbx icoDown"></b>
										</a>
									</th>
									<th class="Ibx_Th_icoATCM">
										<b class="icoIbx" title='������ʶ'><img
												src="images/attach.gif" />
										</b>
									</th>
									<th class="Ibx_Th_Size">
										<a href="#" title="����ɰ�������">��С(KB)</a>
									</th>
								</tr>
							<tbody>
						</table>
						<div class="Ibx_Lst_dWp dWpOpen">
							<h4 class="Ibx_Lst_dTT">
								<a href="javascript:void(0)" title="չ��/����" class="icoIbx"></a><span
									class="Txt">���ڣ�����&nbsp;<span style="display: none">(<a
										href="javascript:void(0)" title="
ѡ�и��������ʼ�"
										key="oTableCOUNT0"><span id="oSpanCOUNT0">10</span>��</a>)</span>
								</span>
							</h4>
							<table class="Ibx_gTable Ibx_gTable_Con" id="oTableCOUNT0">
								<tbody>

									<logic:notPresent name="rubbishEmailBeanList" scope="session">
										<tr class="I_Mark0">
											<td align="center">
												�Բ��𣬲�ѯ���󣬣�
											</td>
										</tr>
									</logic:notPresent>
									<logic:present name="rubbishEmailBeanList" scope="session">

										<logic:empty name="rubbishEmailBeanList">
											<tr class="I_Mark0">
												<td align="center">
													�Բ���,ListΪ��,��ǰû���ʼ���
												</td>
											</tr>
										</logic:empty>
										<logic:notEmpty name="rubbishEmailBeanList">
											<c:forEach items="${rubbishEmailBeanList}" var="t">
												<tr class="I_Mark0">
													<td class="Ibx_Td_F">
														&nbsp;
													</td>
													<td class="Ibx_Td_Chkbx">
														<input name="mid" type="checkbox" title="ѡ��/��ѡ"
															value="${t.email.emailid }" />
													</td>
													<c:choose>
														<c:when test="${t.email.unread eq 1}">
															<td class="Ibx_Td_icoInfo" align="center">
																<b title="�����ʼ�"><img src="images/web_icon_013.gif" />
																</b>
															</td>
														</c:when>
														<c:otherwise>
															<td class="Ibx_Td_icoInfo">
																<b class="icoIbx icoSlow" title="�����ʼ�"><img
																		src="images/web_icon_016.gif" />
																</b>
															</td>
														</c:otherwise>

													</c:choose>
													<td class="Ibx_Td_From">
														<a href="#"
															onclick="javascript:changeframe('', '', 'rubbishmailtemp.jsp?emailid=${t.email.emailid }'); return false;">${t.email.recipients
															}</a>
													</td>
													<td class="Ibx_Td_icoFlag" title="δ����" align="left">
														<b class="icoIbx"> <c:choose>
																<c:when test="${t.email.mailtag.tagid eq 1}">
																	<img src="images/tag/1.JPG" />
																</c:when>
																<c:when test="${t.email.mailtag.tagid eq 2}">
																	<img src="images/tag/3.JPG" />
																</c:when>
																<c:when test="${t.email.mailtag.tagid eq 3}">
																	<img src="images/tag/4.JPG" />
																</c:when>
																<c:when test="${t.email.mailtag.tagid eq 4}">
																	<img src="images/tag/6.JPG" />
																</c:when>
																<c:when test="${t.email.mailtag.tagid eq 5}">
																	<img src="images/tag/5.JPG" />
																</c:when>
																<c:when test="${t.email.mailtag.tagid eq 6}">
																	<img src="images/tag/2.JPG" />
																</c:when>
																<c:when test="${t.email.mailtag.tagid eq 7}">
																	<img src="images/tag/8.JPG" />
																</c:when>
																<c:when test="${t.email.mailtag.tagid eq 8}">
																	<img src="images/tag/7.JPG" />
																</c:when>
																<c:otherwise>
																	<img src="images/tag/9.JPG" />
																</c:otherwise>
															</c:choose> </b>
													</td>
													<td align="left">
														<a
															onclick="javascript:changeframe('', '', 'rubbishmailtemp.jsp?emailid=${t.email.emailid }'); return false;"
															href="#">${t.email.subject }</a>
													</td>
													<td class="Ibx_Td_Date" title="">
														${t.email.senttime }
													</td>
													<c:choose>
														<c:when test="${t.containAttachment}">
															<td class="Ibx_Td_icoATCM">
																<img src="images/attach.gif" />
															</td>
														</c:when>
														<c:otherwise>
															<td class="Ibx_Td_icoATCM"></td>
														</c:otherwise>
													</c:choose>
													<td class="Ibx_Td_Size">
														<span title="5637 �ֽ�"><fmt:formatNumber
																value="${t.email.msgsize*1024 }" pattern="####.##" />
														</span>
													</td>
												</tr>
											</c:forEach>
										</logic:notEmpty>
									</logic:present>
								<tbody>
							</table>
						</div>
						<h4 class="Ibx_Lst_bExtra" id="oH4Check">
							ѡ��
							<a href="javascript:void(0)" type="all">ȫ��</a>&nbsp;-&nbsp;
							<a href="javascript:void(0)" type="unread">δ��</a>&nbsp;-&nbsp;
							<a href="
javascript:void(0)" type="read">�Ѷ�</a>&nbsp;-&nbsp;
							<a href="javascript:void(0)" type="reverse">��ѡ</a>&nbsp;-&nbsp;
							<a href="javascript:void(0)" type="no">��ѡ</a>
						</h4>
					</div>

					<div class="gToolbar gTbrBtm">
						<input type="button" onclick="action1()" class="Btn BtnNml ImpBtn"
							value="����ɾ��" />
						<select class="Sel">
							<option value="none" selected="true">
								�ƶ���...
							</option>
							<option value="1">
								&nbsp;&nbsp;�ռ���
							</option>
							<option value="5">
								&nbsp;&nbsp;�����ʼ�
							</option>
							<option value="200000">
								&nbsp;&nbsp;�ѽ����ʼ�
							</option>
							<option value="2">
								&nbsp;&nbsp;�ݸ���
							</option>
							<option value="3">
								&nbsp;&nbsp;�ѷ����ʼ�
							</option>
							<option value="4">
								&nbsp;&nbsp;������
							</option>
							<option value="none" class="SelOptLine">
								-------------
							</option>
						</select>
						<div class="Extra">
							<span class="Txt"><span class="Unable"><a
									href="gorubbish2.do?pageNo=1">��ҳ</a>
							</span>&nbsp;&nbsp; <span class="Unable"><a
									href="gorubbish2.do?pageNo=${rubbishPageNo - 1 }">��ҳ</a>
							</span> &nbsp;&nbsp; <span class="Unable"> <a
									href="gorubbish2.do?pageNo=${rubbishPageNo + 1 }">��ҳ</a>
							</span>&nbsp;&nbsp; <span class="Unable"><a
									href="gorubbish2.do?pageNo=${rubbishTotalPages }">ĩҳ</a>
							</span> </span>
							<select class="SelA" style="margin-right: 0px" name="pageNo"
								onchange="changepage(this.value)">
								<c:forEach var="t" begin="1" end="${rubbishTotalPages}">
									<option value="${t }">
										${t }/${rubbishTotalPages }
									</option>
								</c:forEach>
							</select>
						</div>
					</div>

				</div>
			</div>
		</form>
	</body>
</html>