<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>成绩录入分组设置</title>
		<link href="/system/styles/css/content.css" rel="stylesheet" type="text/css">
	<style>
		#title{
			width:92%;
			border:0px;
			margin-bottom:10px;
		}
		#title td{
			text-align:center;
			height:20px;
			line-height:150%
		}
		#title div{
			background-image: url(/system/styles/image/dot_02.gif);
			background-position:left top;
			background-repeat:no-repeat;
			margin:0 auto;
			padding-left:20px;
			text-align:left;
			width:10%;
			font-size: 15px;
			font-weight: bold;
			color: #CC0000;
			letter-spacing: 2px;
		}
	</style>
	</head>
	<body>

	<table cellspacing="0" cellpadding="0" id="title">
		<tbody><tr>
			<td nowrap="nowrap"><div>成绩录入分组</div></td>
		</tr>
		</tbody></table>

	<table cellspacing="0" cellpadding="0" class="subtitle">
		<tr>
			<td>成绩录入分组选择</td>
			<td>&nbsp;</td>
			<td id="rightbg">&nbsp;</td>
		</tr>
	</table>
	<form action="/system/exam/examScoreInput.jsp" method="post">
		<table cellpadding="0" cellspacing="0" class="broken_tab">
			<tbody>
			  <tr class="explain">
				  <td>年级</td>
				  <td><select><option>2014</option><option>2015</option><option>2016</option></select></td>
				  <td>学期</td>
				  <td><select><option>春</option><option>秋</option></select></td></tr>
			  <tr class="explain">
				  <td>班级</td>
				  <td><select><option>25</option><option>26</option></select></td>
				  <td>课程</td>
				  <td><select><option>语文</option><option>数学</option><option>英语</option></select></td>
			  </tr>
    </tbody></table>
		<br>
		<div align="center">
			<input class="button" value="确定" type="submit">
		</div>
		</form>
	</body></html>