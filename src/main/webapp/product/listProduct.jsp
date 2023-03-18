<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.model2.mvc.service.product.ProductService"%>
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*"  %>
<!DOCTYPE html>
<html>
<head>
<title>��ǰ �����ȸ</title>
<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
        
      img {
      	height : 350px;
      }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	function fncGetProductListOrder(currentPage, searchOrderType, menu) {
		
		$("#currentPage").val(currentPage);
		$("#menu").val(menu);
		$("#searchOrderType").val(searchOrderType);
	   	$("form").eq(0).attr('action','listProduct').attr('method','post').submit();		
	}
	//�̺�Ʈ ��Ʈ��
	$(function () {
		function fncGetProductList(currentPage, searchOrderType, menu) {
			
			$("#currentPage").val(currentPage);
			$("#menu").val(menu);
			$("#searchOrderType").val(searchOrderType);
		   	$("form").eq(0).attr('action','listProduct').attr('method','post').submit();		
		}
		$( "button:contains('�˻�')" ).on("click" , function() {
			fncGetProductList('1', '${search.searchOrderType}', '${param.menu}');
		});
	});
	
	
	
	$(function link() {
		if("${param.menu}"== "manage"){
			$('.thumbnail').on('click',function(){
				self.location="updateProduct?prodNo="+$(this).children('input:hidden').val();	
			});
		} else {
			$('.thumbnail').on('click',function(){
				self.location="getProduct?prodNo="+$(this).children('input:hidden').val();	
			});
		}
	});
	// �̺�Ʈ ��Ʈ�� ��
	
	
	
	//�˻� ����ǿ� ���� UI ���� �ϴ� �κ�
	$(function(){
		
		$('#searchPrice').hide();
		
		if($('#searchCondition').val()=='2') {
			$('#searchPrice').show();
			$('#searchKeyword').hide();
		}
		$('#searchCondition').on('change',function(){
			if($('#searchCondition').val()!='2') {
				$('#searchPrice').hide();
				$('#searchKeyword').show();
			} else {
				$('#searchPrice').show();
				$('#searchKeyword').hide();
			}
		});
	});
	//�˻� ����ǿ� ���� UI ���� �ϴ� �κ� end
	
	//����� ���� ���� ���
	function equalHeight(group) {    
	    var tallest = 0;    
	    group.each(function() {       
	        var thisHeight = $(this).height();       
	        if(thisHeight > tallest) {          
	            tallest = thisHeight;       
	        }    
	    });    
	    group.each(function() { $(this).height(tallest); });
	} 
	//����� ���� ���� ��� ��
	
	$(function() {   
	    equalHeight($(".thumbnail")); 
	});

	// ���� ��ũ�� ����
	var isEnd = false;
	
	var currentPage = 2;
	
	$(function () {
	
	var search = 	{
			"currentPage" : currentPage,
			"searchCondition" : $("#searchCondition").val(),
			"searchKeyword" : $("#searchKeyword").val(),
			"searchMinPrice" : $("#searchMinPrice").val(),
			"searchMaxPrice" : $("#searchMaxPrice").val(),
			"searchOrderType" : "orderByDateDESC"
		};
	 
	
	
	$(document).scroll(function() {
            
            if($(window).scrollTop() + $(window).height() +1 > $(document).height()){
	    	
	    	 	
		    	if(isEnd == true){
			      return;
			    }
	    	 	
		        $.ajax({
		            url:"../json/product/listProduct",
		            method : "POST",
		            contentType: 'application/json; charset=euc-kr',
		            data : JSON.stringify(search),
		            dataType: "json",
		            success: function(JSONData) {
		            	
		            	currentPage ++;
		            	search.currentPage=currentPage;
		                var length = JSONData.length;
		                
		                if( length < 6 ) {
		                    isEnd = true;
		                }
		                
		                
		                
		                $.each(JSONData, function(index, product){
		                	
		                    $('.row').eq(1).append('<div class="col-sm-6 col-md-4">'
				                      		+'<div class="thumbnail">'
				                      		+'<input type = "hidden" name = "prodNo" value = "'+product.prodNo+'"/>'
				                     		+'<a href="#">'
				                    		+'<img src="../images/uploadFiles/'+product.fileNames[0]+'" alt="..." />'
				                      		+'</a>'
				                    		+'</div>'
				                     		+'<div class="caption">'
			                          		+'<h5>'+product.prodName+'</h5>'
				                         	+'<p>'+product.price+'��</p>'
				                     		+'</div>'
				                   	   		+'</div>');
		                   
		                    equalHeight($(".thumbnail")); 
		                
		                });
		               
		               $(function link() {
		            		if("${param.menu}"== "manage"){
		            			$('.thumbnail').on('click',function(){
		            				self.location="updateProduct?prodNo="+$(this).children('input:hidden').val();	
		            			});
		            		} else {
		            			$('.thumbnail').on('click',function(){
		            				self.location="getProduct?prodNo="+$(this).children('input:hidden').val();	
		            			});
		            		}
		            	});
		               
		                $(function () {
	                		$('#currentPage').val(currentPage);
	                	});
		            }//end of ajax success part
		        });//end of ajax
	    	}// ��ũ�� ���ϴ� �Ǵ� if ��	
		});//��ũ�� ���� �̺�Ʈ;
	});//���ѽ�ũ�� ��
	
	//���� ���ø� ����
	autoComplete = function () {
		
		var availableTags = null
		
		$.ajax(
				{
					url : "/json/product/getProductNameList",
					method : "get",
					dataType : "json",
					headers : {
						"Accept" : "application/json" ,
						"Content-Type" : "application/json"
					},
					success : function (JSONData, status) {
						availableTags=JSONData;
						$( "#searchKeyword" ).autocomplete({
							   source: availableTags
						});
					}
				}
		);
	}	
	
	//��ġ ����ǿ� ���� �������ø� ���� ���� ����.	
	$(function () {
		
		if($('#searchCondition').val()=='1') {
			autoComplete();
		}
		
		$('#searchCondition').on('change',function(){
			if($('#searchCondition').val()=='1') {
				autoComplete();
			} else {
				$( "#searchKeyword" ).autocomplete({
					source: null
				});
			}
		});
	});
	//���� ���ø� ��
</script>

</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">


	
<div class="page-header text-info">
    <h3>��ǰ ��� ��ȸ</h3>
</div>

<div class="row">
<div class="col-md-12 text-right">
			    <form class="form-inline" name="detailForm">
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" id="searchCondition" >
						<c:if test = "${user.role eq 'admin'}">
							<option value="0" ${ search.searchCondition == 0 ?" selected":""}>��ǰ��ȣ</option>
						</c:if>
						<option value="1" ${ search.searchCondition == 1 ?" selected":""}>��ǰ��</option>
						<option value="2" ${ search.searchCondition == 2 ?" selected":""}>��ǰ����	</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				    <span id='searchPrice'>
					    <label for="searchMinPrice" class="control-label">&nbsp;�ּҰ�</label>
						<input type="text" class = 'form-control' name="searchMinPrice" id="searchMinPrice" 
							   value="${! empty search.searchMinPrice ? search.searchMinPrice : 0}" />
						
						<label for="searchMaxPrice" class="control-label">&nbsp;�ִ밡</label>
						<input type="text" class = 'form-control' name="searchMaxPrice" id="searchMaxPrice" 
							   value="${! empty search.searchMaxPrice ? search.searchMaxPrice : 0}" />
					</span>	   
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  <input type="hidden" id="menu" name="menu" value=""/>
				</form>
	    	</div>
	    </div>
	    
	    
	    
	   <div class="col-md-12 text-right">
	   	<a href = "javascript:fncGetProductListOrder('1', 'orderByDateDESC','${param.menu }')" >�ֱ� ��ϼ�</a>&nbsp;&nbsp;&nbsp;
	   	<a href = "javascript:fncGetProductListOrder('1', 'orderByDateASC','${param.menu }')">������ ��ϼ�</a>&nbsp;&nbsp;&nbsp;
	   	<a href = "javascript:fncGetProductListOrder('1', 'orderByPriceDESC','${param.menu }')">���� ������</a>&nbsp;&nbsp;&nbsp;
	   	<a href = "javascript:fncGetProductListOrder('1', 'orderByPriceASC','${param.menu }')">���� ������</a>
	   	<br/><br/>
	   </div>

	    

<form name="productForm">
<div class="row">
<c:set var="i" value="0"/>
	<c:forEach var="product" items = "${list}">
		<c:set var="i" value="${i+1}"/>
 		<div class="col-sm-6 col-md-4">
   		 <div class="thumbnail">
   		 
	   		<input type = "hidden" name = "prodNo" value = "${product.prodNo}"/>
    		
    		<a href="#">
   			   <img src="../images/uploadFiles/${product.fileNames[0]}" alt="...">
     		</a>
      
   		 </div>
    	<div class="caption">
        	<h5>${product.prodName }</h5>
        	<p>${product.price}��</p>
    	</div>
  	   </div>
  </c:forEach>
</div>
</form>

</div>
</body>
</html>
