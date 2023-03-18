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
	$(()=>{
		$('.btn-primary').on('click', ()=>{
			$('form').attr('action','addMultiplePurchase').attr('method','get').submit();
		});
	})
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>��ٱ���</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    	    <%--
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
		  --%>
		
      <!--  table Start /////////////////////////////////////-->
      <form>
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="left">No</th>
            <th align="left">��ǰ��</th>
            <th align="left">����</th>
            <th align="left">���� ����</th>
          </tr>
        </thead>
       
		<tbody>
			
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items = "${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left">${i }</td>
			  <td align="left">${product.prodName}</td>
			  <td align="left">${product.price }</td>
			  <td align="left">
			  	${product.cartQuantity}
			  	
			  	</td>
			  <td>
			  	<input type="hidden" name="prodNo" value ="${product.prodNo }"/>
			  	<input type="hidden" name="cartTranNo" value = "${search.cartTranNo }"/>
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
      </form>
	  <!--  table End /////////////////////////////////////-->
	  <button type="button" class="btn btn-primary">����</button>
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<%--<jsp:include page="../common/pageNavigator_new.jsp"/> --%>
	<!-- PageNavigation End... -->
	
</body>

</html>