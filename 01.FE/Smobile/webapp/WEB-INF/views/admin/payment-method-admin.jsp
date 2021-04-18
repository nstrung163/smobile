<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/common/taglib.jsp" %>
<h1 class="mt-4">Kopiko</h1>
<ol class="breadcrumb mb-4">
	<li class="breadcrumb-item"><a href="index.html">Management</a></li>
	<li class="breadcrumb-item active">Payment Method</li>
</ol>


<div id="announcemnet" role="alert" aria-live="assertive" aria-atomic="true" class="toast" data-animation="true" data-autohide="true" data-delay="3000" style="position: absolute; top: 70px; right: 30px; z-index: 100000;">
  <div class="toast-header alert-success">
    <strong class="mr-auto text-success">Announcement</strong>
    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="toast-body">
    <strong id="notification">Success</strong>
  </div>
</div>

<!-- Alert -->



<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> Payment Method Management
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered table-striped" id="dataTable"
				width="100%">
				<thead data-detail-formatter="detailFormatter">
					<tr id="list-header">
						<th>No</th>
						<th>Payment Method Name</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- The Modal -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Add New Payment Method</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<form action="" method="POST" id="paymentMethodInfoForm">
					<div class="form-group">
						<label for="paymentMethodId">Payment Method Id: </label>
						<input type="number" class="form-control" id="paymentMethodId" name="paymentMethodId" readonly="readonly" required="required">
					</div>
					<div class="form-group">
						<label for="paymentMethodName">Payment Method Name:</label>
						<input type="text" class="form-control" placeholder="Enter payment method name" id="paymentMethodName" name="paymentMethodName" required="required">
					</div>
					<button type="submit" class="btn btn-primary" id="btnSubmitPaymentMethod">Submit</button>
				</form>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>
<!-- Delete category -->
<div class="modal fade" id="confirmDeleteModal" >
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Delete Payment Method</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>Do you want to delete <b id="deletePaymentMethodName"></b>?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<button type="button" class="btn btn-primary" id="btnSubmitDelete">OK</button>
			</div>
		</div>
	</div>
</div>
<script src="<c:url value='/template/web/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/template/web/plugins/jquery/jquery.validate.min.js'/>"></script>
<script src="<c:url value='/template/web/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/template/web/plugins/datatables/js/jquery.dataTables.min.js'/>"></script>
<script src="<c:url value='/template/web/plugins/datatables/js/dataTables.buttons.min.js'/>"></script>
<script src="<c:url value='/template/web/plugins/datatables/js/dataTables.bootstrap4.min.js'/>"></script>
<script src="<c:url value='/template/admin/dist/js/scripts.js'/>"></script>
<script src="<c:url value='/template/admin/dist/assets/demo/payment-method.js'/>"></script> 

