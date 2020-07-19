<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<!-- List : 예약이 확정되어있을 때 들어갈 수 있음
     Seat: 희망좌석
     temp: 예약할 수 있는 좌석 즉 임시리스트 
     
     ex1) 내가 A-1, A-2 예약하고  싶다 : Seat 에 들어감
         count=0 기준 -> seat에 넣는다. 
         s에 한개씩 넣는다.s에 A-1이 들어가있고 만약 list 에 해당 좌석이 없으면 바로 temp 에 넣기(임시리스트) => count ++
         Seat, == temp -> List 에 넣는다.
         
     ex2) 또 다른 사람이 C-3, D-4, A-2 예약 원함
          Seat에 C-3 부터 차례대로 넣는다->list에 있는지 확인하고 없으면 -> temp 에 담음 -> count++
          Seat에 D-3 부터 차례대로 넣는다->list에 있는지 확인하고 없으면 -> temp 에 담음 -> count++
          Seat에 A-2 넣고 list 확인 -> 이미 선점되어 있음 -> break -> count X -> 예약 실패
     
     ex3) 첫번째부터 list에 좌석이 있을 경우 그냥 break;
     
      -->
<%
	//예매가 확정된 좌석 정보를 저장할 리스트
	List<String> list = new ArrayList<>(); //현재list 가 지역변수 이기 때문에 반복문이 끝나면 해당 정보가 유지 되지 않고 초기화된다. 
	                                    //따라서 이 list 정보를 백업시켜서 저장해야 한다.
	                                    
	 if(application.getAttribute("complete_list")!= null){
		 //null값이 아니다 -> 한번이라도 application 을 세팅한 경험이 있다.
		 list=(List<String>)application.getAttribute("complete_list"); //getAttribute: Object Type 
		 //다른 사람이 계속해서 예약해도 해당 정보가 유지된다.
	 }

	//사용자가 예매를 희망하는 좌석정보가 들어있는 배열.
	//seat String 은 선점 유무와 상관없이 정보가 넘어온다.
	String[] seat = request.getParameterValues("seat");
	
	//예약선점여부를 확인할 로직
	//예약 확정 전에 임시로 좌석정보를 저장할 리스트
	List<String>temp = new ArrayList<>();
	
	//몇자리를 예약할 수 있는지의 여부를 체크할 변수.
	int count=0;
	for(String s: seat){
		if(list.contains(s)){//중복된 좌석이 발견되는 순간 모두 cancel
			break;
		}else{
			temp.add(s);//좌석이 확정되었다면 임시 리스트에 넣어준다.
			count++; //임시리스트에 저장될 떄마다 카운트가 올라간다.
			       //내가 예약하고 싶은 좌석이 선택이 되면 카운팅이됨. 
		}
	}
	
	if(count==seat.length){
		//카운트 갯수가 선점한 길이와 같다면 ->선점이 안되고 전부 임시리스트에 들어감 ->예약 해줘야 하는 상황
		list.addAll(temp);//addALL()메서드는 리스트내부에 리스트 객체들을 전부 추가하는 메서드이다
	}

	application.setAttribute("complete_list", list);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div align="center">
		<h2>콘서트 예매 처리 결과</h2>
		<p>
			선택한 좌석<br>
			<%
				for(String s : seat) {
					out.println("<b>[" + s + "]</b>");
				}
			%>
			<br>가 예매 신청되었습니다.
		</p>
		<p>
			예매 신청 결과: <%= (count == seat.length) ? "성공" : "실패" %>
			<br>
			<% if(count != seat.length) { %>
				예매하고자 하는 좌석이 이미 선점되었습니다.
			<% } %>
			<br>
			<a href="concert_reserve.jsp">추가 예매하기</a>
		</p>
		
	</div>

</body>
</html>