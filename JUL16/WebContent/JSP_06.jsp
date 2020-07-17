<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class=center>
		<form action=" JSP_06_Send.jsp">
			<table border="1" width="700">
				<tr>
					<td></td>
					<td>앨범 커버</td>
					<td>가수</td>
					<td>앨범 제목</td>
					<td>발매일</td>
				</tr>
				<tr>
					<td><input type="radio" name="title" value="IU" /></td>
					<td><img src="./1.jpg" width="100" height="100" /></td>
					<td>아이유</td>
					<td>Blumming</td>
					<td>2019-01-01</td>
				</tr>
				<tr>
					<!-- radio 버튼의 이름은 동일하게 맞춰준다. 파라미터로 넘길때 name= ~~~로 읽어들인다.-->
					<td><input type="radio" name="title" value="AKMU" /></td>
					<td><img src="./2.jpg" width="100" height="100" /></td>
					<td>악동뮤지션</td>
					<td>항해</td>
					<td>2020-01-01</td>
				</tr>

				<tr>
					<td colspan="5">
					<!--colspan : 행을 병합 
					    rowspan : 열을 병합-->
					 <input type="submit" value="확인" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>