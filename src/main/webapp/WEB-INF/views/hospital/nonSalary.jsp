<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/nonSalary.css" rel="stylesheet">
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />

<div id="board">
	
	
	<div id="board_box">
		
		<div id="boardList">
		
			 <h3>비급여진료안내</h3>
			 
			 <ul>
			 	<li>의료법 제45조 및 동법 시행규칙 제42조의 2 비급여 진료비용 고지에 의거 비급여 항목과 비용을 검색하는 화면입니다.</li>
			 	<li>게시된 진료비용은 단일 개별 항목의 기본적용 비용이며, 시술방법 및 진료량에 따라 해당 항목의 비용이 달라질 수 있습니다.</li>
			 	<li>항목을 입력하시면 비급여 진료비용을 조회할 수 있습니다.</li>
			 </ul>
	        	 
	        	<div class="nonSalary_contents">
	        		
	        		<table>
	        			<tr>
	        				<th style="width: 120px">분류</th>
	        				<th style="width: 150px">명칭</th>
	        				<th style="width: 80px">코드</th>
	        				<th style="width: 220px">구분</th>
	        				<th style="width: 100px">비용</th>
	        				<th style="width: 120px">특이사항</th>
	        			</tr>
	        			<tr>
	        				<td>감염증 기타 검사</td>
	        				<td>인플루엔자 A·B 바이러스항원검사 [현장검사]</td>
	        				<td>CZ394</td>
	        				<td>Influenza A.B Virus 항원검사[현장검사]</td>
	        				<td>33,800</td>
	        				<td></td>
	        			</tr>
	        			<tr>
	        				<td>감염증 혈청검사</td>
	        				<td>HIV항체[현장검사]</td>
	        				<td>CZ396</td>
	        				<td>HIV 항체 [현장검사];HIV Antibody [POCT]</td>
	        				<td>43,400</td>
	        				<td></td>
	        			</tr>
	        			<tr>
	        				<td>감염증 혈청검사</td>
	        				<td>말라리아 항원검사 (젖산탈수소효소)[간이검사]</td>
	        				<td>CZ397</td>
	        				<td>말라리아 항원검사</td>
	        				<td>24,300</td>
	        				<td></td>
	        			</tr>
	        			<tr>
	        				<td>감염증 혈청검사</td>
	        				<td>지카 바이러스</td>
	        				<td></td>
	        				<td>Zika virus RNA,정성,RT-PCR</td>
	        				<td>175,054</td>
	        				<td>임상적 증상의심환자 기준부합하지않으나 본인희망및의사필요하다고 판단되는 경우</td>
	        			</tr>
	        			<tr>
	        				<td>감염증 혈청검사</td>
	        				<td>메르스</td>
	        				<td></td>
	        				<td>MERS-CoV RNA,정성</td>
	        				<td>169,950</td>
	        				<td>임상적 증상의심환자 기준부합하지않으나 본인희망및의사필요하다고 판단되는 경우</td>
	        			</tr>
	        			<tr>
	        				<td>기능검사료</td>
	        				<td>Bladder scan을 이용한 방광잔뇨량 측정검사(1일당)</td>
	        				<td>EZ754</td>
	        				<td>Bladder scan을 이용한 방광잔뇨량 측정검사(1일당)</td>
	        				<td>30,000</td>
	        				<td></td>
	        			</tr>
	        			<tr>
	        				<td>기타검사</td>
	        				<td>PTH-related peptide (SCL)국외</td>
	        				<td></td>
	        				<td></td>
	        				<td>435,600</td>
	        				<td></td>
	        			</tr>
	        			<tr>
	        				<td>기타검사</td>
	        				<td>Coxsackie virus B type 3 CF(녹십자)</td>
	        				<td></td>
	        				<td></td>
	        				<td>20,966</td>
	        				<td></td>
	        			</tr>
	        			
	        		</table>
					
					
	        	</div> 
		
		</div>
		
	</div>
	
</div>



<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>