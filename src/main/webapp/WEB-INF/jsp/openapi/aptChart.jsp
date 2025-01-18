<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js@4.4.7/dist/chart.umd.min.js"></script>
<script type="text/javascript" src="/js/utils2.js"></script>

<script type="text/javascript">

	function sidoChange(val){
		
		console.log( val );
		
		deletedraw();
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
		
		deletedraw();
		
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
		
		deletedraw();
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
	
	function aptChange(val){

		deletedraw();
		
		$.ajax({
			type: 'get',
			url: '/aptDealAmountList',
			data : {aptSeq:val},
			success:function(data){
				
				// line chart
				aptDealAmtLineChart.data.labels = data.dealDate2;
				
				const dataset2 = [];
				
				for(var i=0; i<data.excluUseAr.length; i++){
					
					dataset2.push({
					      label: data.excluUseAr[i] + '㎡ (' + Math.floor(data.excluUseAr[i]/3.3) + '평)',
					      data: data.dealAmount[i],
					      borderColor: 'rgb('+Math.floor(Math.random() * 250)+', '+Math.floor(Math.random() * 250)+', '+Math.floor(Math.random() * 250)+')',
					      fill: false,
					      tension: 0.9
					    });
				}
					
				aptDealAmtLineChart.data.datasets = dataset2;
				aptDealAmtLineChart.options.plugins.title.text = $("#aptList option:selected").text() + ' 아파트 실거래가';
				aptDealAmtLineChart.update();
				
				// bar chart
				aptDealCntChart.data.labels = data.dealDate2;
				aptDealCntChart.data.datasets = [{
				        label: $("#aptList option:selected").text() + ' 아파트 월별 거래량',
				        data: data.monthDealCnt,
				        borderWidth: 1
				      }];
				aptDealCntChart.update();
				
			},
			error:function(request, status, error){ 
				console.log('error!!!'+error);
			}
		})
		
		
	}
	
	
	function deletedraw(){
		
		aptDealAmtLineChart.options.plugins.title.text = '아파트 실거래가';
			
		aptDealAmtLineChart.data.labels = [];
		
		aptDealAmtLineChart.data.datasets = [];
		
		aptDealAmtLineChart.update();
		
		
		
		aptDealCntChart.data.labels = [];
		
		aptDealCntChart.data.datasets = [{label:'아파트 월별 거래량', data:[], borderWidth:1}];
		
		aptDealCntChart.update();
		
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

<select name="aptList" id="aptList" onchange="aptChange(this.value);">
<option value="">==선택==</option>
</select>


<canvas id="lineChart" height="70%"></canvas>

<canvas id="barChart" height="70%"></canvas>

			<script>
			const lineChart = document.getElementById('lineChart');
			
			const aptDealAmtLineChart = new Chart(lineChart, {
			    type: 'line',
			    data: {
			    	  labels: [],
			    	  datasets: []
			    	}
			    ,
			    options: {
			        responsive: true,
			        plugins: {
			          title: {
			            display: true,
			            text: '아파트 실거래가'
			          },
			        },
			        interaction: {
			          intersect: false,
			        },
			        scales: {
			          x: {
			            display: true,
			            title: {
			              display: true
			            }
			          },
			          y: {
			            display: true,
			            title: {
			              display: true,
			              text: '만원'
			            },
			            suggestedMin: 0,
			            suggestedMax: 200
			          }
			        }
			      }
			  });
			
		//	redraw(aptDealAmtLineChart);
			
			</script>
			
			
			<script>
  const ctx = document.getElementById('barChart');

  const aptDealCntChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: [],
      datasets: [{label:'아파트 월별 거래량', data:[], borderWidth:1}]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>			
</body>
</html>