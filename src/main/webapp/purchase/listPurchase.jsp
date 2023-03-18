<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
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
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetPurchseList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "listPurchase").submit();
		}
		
		
		
		//============= tranNo �� ������������ Event ó��(Click) =============
		$(function() {
			
			
			
			$( "td:nth-child(1)" ).on("click" , function() {
				
				var tranCode = $(this).children('input:hidden').val()
				
				if(tranCode <= 3){
					self.location ="getPurchase?tranNo="+$(this).text().trim();
				} else if(tranCode >= 6) {
					self.location ="listMultiplePurchaseProd?cartTranNo="+$(this).text().trim();
				}
				
			});
						
			$( "td:nth-child(1)" ).css("color" , "blue");
			
			
			
		});	
		//============= userId �� ȸ���������� Event ó��(Click) =============	
		$(function() {
		
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/user/getUser?userId="+$(this).text().trim();
			});
						
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	
		
		
			
			//============= "���"  Event  ó�� =============	
			 $(function() {
				 $( "td:contains('����ϱ�')" ).on("click" , function() {
						self.location ="updateTranCode?tranNo="+$(this).children('input:hidden').val()+"&tranCode=2&page=${resultPage.currentPage}";
				 });
					
				 $( "td:contains('���ǵ���')" ).on("click" , function() {
						self.location ="updateTranCode?tranNo="+$(this).children('input:hidden').val()+"&tranCode=3&page=${resultPage.currentPage}";
				 });
			 });
			
		
		
		
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>���ų�����ȸ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0" ${ search.searchCondition == 0 ?" selected":""}>�ֹ���ȣ</option>
						<c:if test = "${user.role eq 'admin'}">
							<option value="1" ${ search.searchCondition == 1 ?" selected":""}>����ID</option>
						</c:if>
						<option value="2" ${ search.searchCondition == 2 ?" selected":""}>�����ڸ�</option>
						<option value="3" ${ search.searchCondition == 3 ?" selected":""}>�ֹ���¥</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="left">�ֹ���ȣ</th>
            <th align="left">ȸ�� ID</th>
            <th align="left">�����ڸ�</th>
            <th align="left">��ȭ��ȣ</th>
            <th align="left">�����Ȳ</th>
            <th align="left">��������</th>
          </tr>
        </thead>
       
		<tbody>
			
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center" title="Click : �ֹ����� Ȯ��" class = "code${purchase.tranCode}">
			  <input type="hidden" value= "${purchase.tranCode}" />
			  	${purchase.tranNo}
			  </td>
			  <td align="left"  title="Click : ȸ������ Ȯ��">${purchase.buyer.userId}</td>
			  <td align="left">${purchase.receiverName}</td>
			  <td align="left">${purchase.receiverPhone}</td>
			  <td align="left">
			  	<c:if test="${!(purchase.tranCode eq '0')}">
				����
				<c:choose>
					<c:when test ="${purchase.tranCode eq '1' || purchase.tranCode eq '8'}">
						���ſϷ�
					</c:when>
				
					<c:when test ="${purchase.tranCode eq '2' || purchase.tranCode eq '7'}">
						�����
					</c:when>
					
					<c:when test ="${purchase.tranCode eq '3' || purchase.tranCode eq '6'}">
						��ۿϷ�
					</c:when>
				</c:choose>
				 ���� �Դϴ�.
				</c:if>
			  </td>
			  
			  <td align="left">
			  	
			  <c:if test = "${(purchase.tranCode eq '1' || purchase.tranCode eq '8' )&& user.role eq 'admin' }">
					<input type="hidden" value= "${purchase.tranNo}"/>
					����ϱ�
				</c:if>
				
				<c:if test = "${(purchase.tranCode eq '2' || purchase.tranCode eq '7') && user.role eq 'user'}">
					<input type="hidden" value= "${purchase.tranNo}"/>
					���ǵ���
				</c:if>
				
			  </td>
			  
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>