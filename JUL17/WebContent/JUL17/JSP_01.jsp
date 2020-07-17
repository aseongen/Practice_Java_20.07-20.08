<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!-- JUL16일  JSP_06 : 다른 형식 으로 만들어보기  -->
	<div class=center>
			<table border="1" width="700">
				<tr>
					<%--  <td></td> --%>
					<td>앨범 커버</td>
					<td>가수</td>
					<td>앨범 제목</td>
					<td>발매일</td>
				</tr>
				<tr>
				<%-- <td><input type="radio" name="title" value="IU" /></td>--%>
				<%-- <td>앨범 커버</td>--%>
				<td align ="center">
				    <a href="JSP_01_Send.jsp?title=IU">
					<img src="./1.jpg" width="100" height="100" /></a>
					<td>아이유</td>
					<td>
					<a href="JSP_01_Send.jsp?title=IU">Blumming</a></td>
					<td>2019-01-01</td>
				
				</tr>
				
				<tr>
					<%-- radio 버튼의 이름은 동일하게 맞춰준다. 파라미터로 넘길때 name= ~~~로 읽어들인다.--%>
					<%-- <td><input type="radio" name="title" value="AKMU" /></td>--%>
					<td align ="center">
					<%--align: 사진 위치 지정 --%>
					<a href="JSP_01_Send.jsp?title=AKMU">
					<img src="./2.jpg" width="100" height="100" /></a>
				
					<td>악동뮤지션</td>
					<td>
					<a href="JSP_01_Send.jsp?title=AKMU">항해</a></td>
					<td>2020-01-01</td>
				</tr>

				<%-- <tr>
					<td colspan="5">
					<%--colspan : 행을 병합 
					    rowspan : 열을 병합-->
					 <input type="submit" value="확인" />
					</td>
				</tr>--%>
			</table>
	</div>
</body>
</html>