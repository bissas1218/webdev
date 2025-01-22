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

<style type="text/css">

#loading_spinner{
    display: none;
    position: absolute;
    left: 50%;
    top: 50%;
    z-index: 99;
}
.cv_spinner{
    height: 100%;
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    align-content: stretch;
    justify-content: center;
    align-items: baseline;
    position: relative;
}
.spinner {
  width: 100px;
  height: 100px;
  border: 15px #ddd solid;
  border-top: 15px #2e93e6 solid;
  border-radius: 50%;
  animation: sp-anime 0.8s infinite linear;
}
@keyframes sp-anime {
  100% {
    transform: rotate(360deg);
  }
}

</style>

<script type="text/javascript">

	// 시도변경
	function sidoChange(val){
		
		//console.log( val );
		
		deletedraw();

		if(val == ''){
			
			$("select[name='guCode'] option").remove();
			$("select[name='dongCode'] option").remove();
			$("select[name='aptList'] option").remove();
			
			$("#guCode").append("<option value=''>==선택==</option>");
			$("#dongCode").append("<option value=''>==선택==</option>");
			$("#aptList").append("<option value=''>==선택==</option>");
			
			$("select[name='leeCode'] option").remove();
			$("#leeCode").append("<option value=''>==선택==</option>");
			$("#leeCode").hide();
			
		}else{
			
			// 구에 데이터삽입
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
					
					$("select[name='leeCode'] option").remove();
					$("#leeCode").append("<option value=''>==선택==</option>");
					$("#leeCode").hide();
					
					for(var i=0; i<data.guList.length; i++){
						//console.log(data.guList[i].name);
						$("#guCode").append("<option value='"+data.guList[i].code+"'>"+data.guList[i].name+"</option>");
					}
				},
				error:function(request, status, error){
					console.log('error!!!'+error);
				}
			});
			
			// 시도 거래금액 조회
			$.ajax({
				type: 'get',
				url: '/sidoDealAmount',
			//	dataType: 'text',
				data : {sidoCode:val},
				beforeSend:function(){
					$('#loading_spinner').show();
				},
				success:function(data){
					
					// line chart
					aptDealAmtLineChart.data.labels = data.dealDate2;
					
					const dataset2 = [{
					      label: $("#sidoCode option:selected").text(),
					      data: data.dealAmountSum,
					      borderColor: 'rgb('+Math.floor(Math.random() * 250)+', '+Math.floor(Math.random() * 250)+', '+Math.floor(Math.random() * 250)+')',
					      fill: false,
					      tension: 0.4
					    }];
					
					aptDealAmtLineChart.data.datasets = dataset2;
					aptDealAmtLineChart.options.plugins.title.text = $("#sidoCode option:selected").text() + ' 아파트 실거래가';
					aptDealAmtLineChart.update();
					
					/* bar chart */
					aptDealCntChart.data.labels = data.dealDate2;
					aptDealCntChart.data.datasets = [{
					        label: $("#sidoCode option:selected").text() + ' 아파트 월별 거래량',
					        data: data.monthDealCnt,
					        borderWidth: 1
					      }];
					aptDealCntChart.update();
					
				},
				error:function(request, status, error){
					console.log('error!!!'+error);
				},
				complete:function(){
					$('#loading_spinner').hide();
				}
			});
			
		}
		
	}
	
	// 구변경
	function guChange(val){
		//console.log(val);
		
		deletedraw();
		
		if(val == ''){
			
			$("select[name='dongCode'] option").remove();
			$("select[name='aptList'] option").remove();
			
			$("#dongCode").append("<option value=''>==선택==</option>");
			$("#aptList").append("<option value=''>==선택==</option>");
			
			$("select[name='leeCode'] option").remove();
			$("#leeCode").append("<option value=''>==선택==</option>");
			$("#leeCode").hide();
			
		}else{
			
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
					
					$("select[name='leeCode'] option").remove();
					$("#leeCode").append("<option value=''>==선택==</option>");
					$("#leeCode").hide();
					
					for(var i=0; i<data.dongList.length; i++){
				//		console.log(data.dongList[i].name);
						$("#dongCode").append("<option value='"+data.dongList[i].code+"'>"+data.dongList[i].name+"</option>");
					}
				},
				error:function(request, status, error){
					console.log('error!!!'+error);
				}
			});
			
			// 구 거래금액 조회
			$.ajax({
				type: 'get',
				url: '/guDealAmount',
			//	dataType: 'text',
				data : {guCode:val},
				beforeSend:function(){
					$('#loading_spinner').show();
				},
				success:function(data){
					
					// line chart
					aptDealAmtLineChart.data.labels = data.dealDate2;
					
					const dataset2 = [{
					      label: $("#sidoCode option:selected").text() + ' ' + $("#guCode option:selected").text(),
					      data: data.dealAmountSum,
					      borderColor: 'rgb('+Math.floor(Math.random() * 250)+', '+Math.floor(Math.random() * 250)+', '+Math.floor(Math.random() * 250)+')',
					      fill: false,
					      tension: 0.4
					    }];
					
					aptDealAmtLineChart.data.datasets = dataset2;
					aptDealAmtLineChart.options.plugins.title.text = $("#sidoCode option:selected").text() + ' ' + $("#guCode option:selected").text() + ' 아파트 실거래가';
					aptDealAmtLineChart.update();
					
					/* bar chart */
					aptDealCntChart.data.labels = data.dealDate2;
					aptDealCntChart.data.datasets = [{
					        label: $("#sidoCode option:selected").text() + ' ' + $("#guCode option:selected").text() + ' 아파트 월별 거래량',
					        data: data.monthDealCnt,
					        borderWidth: 1
					      }];
					aptDealCntChart.update();
					
				},
				error:function(request, status, error){
					console.log('error!!!'+error);
				},
				complete:function(){
					$('#loading_spinner').hide();
				}
			});
			
		}
	}
	
	// 동선택
	function dongChange(val){
		//console.log(val+', '+$("#dongCode option:selected").text());
		
		deletedraw();
		//var dongList = null;
		
		if(val == ''){
			
			$("select[name='aptList'] option").remove();
			$("#aptList").append("<option value=''>==선택==</option>");
			
			$("select[name='leeCode'] option").remove();
			$("#leeCode").append("<option value=''>==선택==</option>");
			$("#leeCode").hide();
			
		}else{
			
			$.ajax({
				type: 'get',
				url: '/dongSelect',
				data : {dongCode:val, dongNm:$("#dongCode option:selected").text()},
				success:function(data){
					
				//	console.log('success '+data.leeList.length);
					
					// 리가 존재할 경우
					if(data.leeList != null){
						
						$("#leeCode").show();
						
						//console.log('success '+data.leeList.length);
						$("select[name='leeCode'] option").remove();
						$("#leeCode").append("<option value=''>==선택==</option>");
						
						$("select[name='aptList'] option").remove();
						$("#aptList").append("<option value=''>==선택==</option>");
						
						for(var i=0; i<data.leeList.length; i++){
					//		console.log(data.dongList[i].name);
							$("#leeCode").append("<option value='"+data.leeList[i].code+"'>"+data.leeList[i].name+"</option>");
						}
				
						// 읍,면 거래금액 조회
						$.ajax({
							type: 'get',
							url: '/eupDealAmount',
							data : {eupCode:val},
							beforeSend:function(){
								$('#loading_spinner').show();
							},
							success:function(data){
								
								console.log(data);
								
								/* line chart*/
								aptDealAmtLineChart.data.labels = data.dealDate2;
								
								const dataset2 = [{
								      label: $("#sidoCode option:selected").text() + ' ' + $("#guCode option:selected").text() + ' ' + $("#dongCode option:selected").text(),
								      data: data.dealAmountSum,
								      borderColor: 'rgb('+Math.floor(Math.random() * 250)+', '+Math.floor(Math.random() * 250)+', '+Math.floor(Math.random() * 250)+')',
								      fill: false,
								      tension: 0.4
								    }];
								
								aptDealAmtLineChart.data.datasets = dataset2;
								aptDealAmtLineChart.options.plugins.title.text = $("#sidoCode option:selected").text() + ' ' + $("#guCode option:selected").text() + ' ' + $("#dongCode option:selected").text() + ' 아파트 실거래가';
								aptDealAmtLineChart.update(); 
								
								/* bar chart */
								aptDealCntChart.data.labels = data.dealDate2;
								aptDealCntChart.data.datasets = [{
								        label: $("#sidoCode option:selected").text() + ' ' + $("#guCode option:selected").text() + ' ' + $("#dongCode option:selected").text() + ' 아파트 월별 거래량',
								        data: data.monthDealCnt,
								        borderWidth: 1
								      }];
								aptDealCntChart.update();
								
							},
							error:function(request, status, error){
								console.log('error!!!'+error);
							},
							complete:function(){
								$('#loading_spinner').hide();
							}
						});
						
					}else{
						
						$("select[name='leeCode'] option").remove();
						$("#leeCode").append("<option value=''>==선택==</option>");
						$("#leeCode").hide();
						
						$("select[name='aptList'] option").remove();
						$("#aptList").append("<option value=''>==선택==</option>");
						
						for(var i=0; i<data.aptList.length; i++){
					//		console.log(data.dongList[i].name);
							$("#aptList").append("<option value='"+data.aptList[i].code+"'>"+data.aptList[i].name+"</option>");
						}
						
						// 동 거래금액 조회
						$.ajax({
							type: 'get',
							url: '/dongDealAmount',
							data : {dongCode:val},
							beforeSend:function(){
								$('#loading_spinner').show();
							},
							success:function(data){
								
								console.log(data);
								
								/* line chart*/
								aptDealAmtLineChart.data.labels = data.dealDate2;
								
								const dataset2 = [{
								      label: $("#sidoCode option:selected").text() + ' ' + $("#guCode option:selected").text() + ' ' + $("#dongCode option:selected").text(),
								      data: data.dealAmountSum,
								      borderColor: 'rgb('+Math.floor(Math.random() * 250)+', '+Math.floor(Math.random() * 250)+', '+Math.floor(Math.random() * 250)+')',
								      fill: false,
								      tension: 0.4
								    }];
								
								aptDealAmtLineChart.data.datasets = dataset2;
								aptDealAmtLineChart.options.plugins.title.text = $("#sidoCode option:selected").text() + ' ' + $("#guCode option:selected").text() + ' ' + $("#dongCode option:selected").text() + ' 아파트 실거래가';
								aptDealAmtLineChart.update(); 
								
								/* bar chart */
								aptDealCntChart.data.labels = data.dealDate2;
								aptDealCntChart.data.datasets = [{
								        label: $("#sidoCode option:selected").text() + ' ' + $("#guCode option:selected").text() + ' ' + $("#dongCode option:selected").text() + ' 아파트 월별 거래량',
								        data: data.monthDealCnt,
								        borderWidth: 1
								      }];
								aptDealCntChart.update();
								
							},
							error:function(request, status, error){
								console.log('error!!!'+error);
							},
							complete:function(){
								$('#loading_spinner').hide();
							}
						});
					}
					
				},
				error:function(request, status, error){
					console.log('error!!!'+error);
				}
			});
			
		}
		
	}
	
	function leeChange(val){
		//console.log(val);
		
		deletedraw();
		
		if(val == ''){
			
			$("select[name='aptList'] option").remove();
			$("#aptList").append("<option value=''>==선택==</option>");
			
		}else{
			
			$.ajax({
				type: 'get',
				url: '/dongSelect',
				data : {dongCode:val},
				success:function(data){
					
					$("select[name='aptList'] option").remove();
					
					$("#aptList").append("<option value=''>==선택==</option>");
					
					if(data.aptList != null){
						for(var i=0; i<data.aptList.length; i++){
							$("#aptList").append("<option value='"+data.aptList[i].code+"'>"+data.aptList[i].name+"</option>");
						}
					}
					
				},
				error:function(request, status, error){
					console.log('error!!!'+error);
				}
			});
		}
		
	}
	
	function aptChange(val){

		deletedraw();
		
		if(val == ''){
			
		}else{
			
			$.ajax({
				type: 'get',
				url: '/aptDealAmountList',
				data : {aptSeq:val},
				beforeSend:function(){
					$('#loading_spinner').show();
				},
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
				},
				complete:function(){
					$('#loading_spinner').hide();
				}
			});
			
		}
		
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

<div id="loading_spinner">
    <div class="cv_spinner">
        <span class="spinner"></span>
    </div>
</div>

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

<select name="leeCode" id="leeCode" onchange="leeChange(this.value);" style="display:none;">
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