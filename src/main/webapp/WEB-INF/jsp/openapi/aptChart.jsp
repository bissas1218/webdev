<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">

	function sidoChange(val){
		
		console.log( val );
		
		//var guList = null;
		
		$.ajax({
			type: 'get',
			url: '/sidoSelect',
		//	dataType: 'text',
			data : {sidoCode:val},
			success:function(data){
				
				//console.log('success '+data.guList);
				$("select[name='guCode'] option").remove();
				$("select[name='dongCode'] option").remove();
				$("select[name='aptList'] option").remove();
				
				$("#guCode").append("<option value=''>==선택==</option>");
				$("#dongCode").append("<option value=''>==선택==</option>");
				$("#aptList").append("<option value=''>==선택==</option>");
				
				
				for(var i=0; i<data.guList.length; i++){
					//console.log(data.guList[i].name);
					$("#guCode").append("<option value='"+data.guList[i].code+"'>"+data.guList[i].name+"</option>");
				}
			},
			error:function(request, status, error){
				console.log('error!!!'+error);
			}
		})
	}
	
	function guChange(val){
		console.log(val);
		
		//var dongList = null;
		
		$.ajax({
			type: 'get',
			url: '/guSelect',
		//	dataType: 'text',
			data : {guCode:val},
			success:function(data){
				
			//	console.log('success '+data.dongList);
				$("select[name='dongCode'] option").remove();
				$("select[name='aptList'] option").remove();
				
				$("#dongCode").append("<option value=''>==선택==</option>");
				$("#aptList").append("<option value=''>==선택==</option>");
				
				for(var i=0; i<data.dongList.length; i++){
			//		console.log(data.dongList[i].name);
					$("#dongCode").append("<option value='"+data.dongList[i].code+"'>"+data.dongList[i].name+"</option>");
				}
			},
			error:function(request, status, error){
				console.log('error!!!'+error);
			}
		})
	}
	
	function dongChange(val){
		console.log(val);
		
		//var dongList = null;
		
		$.ajax({
			type: 'get',
			url: '/dongSelect',
			data : {dongCode:val},
			success:function(data){
				
			//	console.log('success '+data.dongList);
				$("select[name='aptList'] option").remove();
				
				$("#aptList").append("<option value=''>==선택==</option>");
				
				for(var i=0; i<data.aptList.length; i++){
			//		console.log(data.dongList[i].name);
					$("#aptList").append("<option value='"+data.aptList[i].code+"'>"+data.aptList[i].name+"</option>");
				}
			},
			error:function(request, status, error){
				console.log('error!!!'+error);
			}
		})
	}
	
</script>

</head>
<body>

<select name="sidoCode" id="sidoCode" onchange="sidoChange(this.value);">
	<option value="">==선택==</option>
	<c:forEach items="${dongCdList}" var="dongCdList">
	<option value="<c:out value="${dongCdList.code }" />"><c:out value="${dongCdList.name }" /></option>
	</c:forEach>
</select>

<select name="guCode" id="guCode" onchange="guChange(this.value);">
<option value="">==선택==</option>
</select>

<select name="dongCode" id="dongCode" onchange="dongChange(this.value);">
<option value="">==선택==</option>
</select>

<select name="aptList" id="aptList" >
<option value="">==선택==</option>
</select>

</body>
</html>