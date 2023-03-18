<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>��ǰ��ȸ</title>
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
<!--
function fncUpdateProduct(){
	//Form ��ȿ�� ����
	var name = document.detailForm.prodName.value;
	var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value;

	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
		

	$('form').attr('action','updateProduct').attr('method','post').attr('enctype','multipart/form-data').submit();
}


function resetData(){
	$('form').reset();
}
-->
//attr('enctype','multipart/form-data');
$(function () {
	
	
	$('.btn-primary:contains("����")').on('click',function(){
		self.location='updatePurchaseView?tranNo=${purchase.tranNo}'
	});
	
	
	$('.btn-default:contains("Ȯ��")').on('click',function(){
		$(self.location).attr("href","listPurchase");
	});
	
})
</script>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">���� ������ȸ</h3>
	       <h5 class="text-muted">��ǰ 
	       
	       <strong class="text-danger">
	       
	       <c:if test="${addChecker}">
		       ��� ���
		   </c:if> 
		   
		   <c:if test="${updateChecker}">
		       ���� ���
		   </c:if>		       
	       
	       <c:if test="${param.menu eq 'search' }">
		       ����ȸ
		   </c:if>		       
	       
	       </strong>
	       
	       ������ �Դϴ�.</h5>
	    </div>
		
		<c:if test = "${updateChecker || (param.menu eq 'search' && user.role eq 'admin')}">
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>�� ǰ ��ȣ</strong></div>
				<div class="col-xs-8 col-md-4">${product.prodNo}</div>
			</div>
			
			<hr/>
		</c:if>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� ǰ ��</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ �̹���</strong></div>
			<div class="col-xs-8 col-md-4">
				<c:forEach var="imgfileName" items="${purchase.purchaseProd.fileNames}">
					<img src="../images/uploadFiles/${imgfileName }" width="200" height="200" />
				</c:forEach>
			</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>������ ���̵�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>���� ���</strong></div>
			<div class="col-xs-8 col-md-4">
					<c:if test="${purchase.paymentOption eq '1' }">
						���ݱ���
					</c:if>
					<c:if test="${purchase.paymentOption eq '2' }">
						�ſ뱸��
					</c:if>
				
			</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ����</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.quantity}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ �̸�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ ����ó</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ �ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ��û����</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�ֹ���</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>
		
		<hr/>
		
		
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
		  		<c:if test="${purchase.tranCode eq '1' }">
		  			<button type="button" class="btn btn-primary">����</button>
		  		</c:if>
	  		
	  			<button type="button" class="btn btn-default">Ȯ��</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
</body>
</html>