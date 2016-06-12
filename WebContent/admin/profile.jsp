<!DOCTYPE html>
<%@page import="model.dto.StaffDTO"%>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<style type="text/css">
.modal-content {
	width: 50% !important;
	margin: 0 auto !important;
}
</style>
<%
	StaffDTO dto = (StaffDTO) session.getAttribute("user");
%>
<!-- include script -->
<%@ include file="include/head.jsp"%>
<link rel="stylesheet" href="framework/dist/css/bootstrapValidator.css" />
<!-- import script -->
<%@ include file="include/script.jsp"%>
<script type="text/javascript"
	src="framework/dist/js/bootstrapValidator.js"></script>
</head>
<body class="skin-green-light sidebar-mini fixed">
	<div class="wrapper" ng-app="profileApp" ng-controller="profileCtrl"
		id="profileCtrl">

		<!-- header -->
		<%@ include file="include/header.jsp"%>

		<!-- left-side -->
		<%@ include file="include/left_side.jsp"%>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="padding-top: 50px;">
			<!-- Content Header (Page header) -->
			<!-- <section class="content-header">
				<h1>User Profile</h1>
				<ol class="breadcrumb">
					<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">Dashboard</li>
				</ol>
			</section> -->

			<section class="content">
				<div class="row">

					<!-- student summary -->
					<section class="col-lg-12 connectedSortable ui-sortable"
						ng-repeat="data in list">
						<input type="hidden" id="usrId" value="{{data.staff_id}}">
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">
									<%-- <%=dto.getFirstName()%>
									<%=dto.getLastName()%> --%>
									{{data.first_name}} {{data.last_name}} : Profile
								</h3>
								<div class="box-tools pull-right">
									<button id="save" class="btn btn-box-tool"
										ng-click="editUser(data.staff_id)">Edit Profile</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="col-md-2">
									<form action="javascript:;" enctype="multipart/form-data"
										id="imgForm">
										<img class="profile-photo" id="img"
											style="margin-bottom: 10px;"
											alt="{{data.first_name}} {{data.last_name}}"
											onclick="imgProfile()" src="../image/staff/{{data.photo}}" />
										<input type="file" name="photoBrowse" id="photoBrowse"
											style="display: none;" accept="image/*"
											onchange="readURL(this);">
									</form>
								</div>

								<div class="col-md-10">
									<ul class="timeline">
										<!-- timeline time label -->
										<li class="time-label"><span class="bg-red">Contact
												Information</span></li>
										<!-- /.timeline-label -->
										<!-- timeline item -->
										<li><i class="fa fa-envelope bg-red"></i>
											<div class="timeline-item">
												<h3 class="timeline-header">
													<a href="#">Email: </a> {{data.email}}
												</h3>
											</div></li>
										<!-- END timeline item -->
										<!-- timeline item -->
										<li><i class="fa fa-phone bg-red"></i>
											<div class="timeline-item">
												<h3 class="timeline-header no-border">
													<a href="#">Phone</a> {{data.phone}}
												</h3>
											</div></li>
										<!-- END timeline item -->

										<!-- timeline time label -->
										<li class="time-label"><span class="bg-green">General
												Information</span></li>
										<!-- /.timeline-label -->
										<!-- timeline item -->
										<li><i class="fa bg-green">#</i>
											<div class="timeline-item">
												<h3 class="timeline-header">
													<a href="#">ID: </a> {{data.staff_id}}
												</h3>
											</div></li>
										<!-- END timeline item -->
										<!-- timeline item -->
										<li><i class="fa fa-user bg-green"></i>
											<div class="timeline-item">
												<h3 class="timeline-header">
													<a href="#">Name: </a> {{data.first_name}}
													{{data.last_name}}
												</h3>
											</div></li>
										<!-- END timeline item -->
										<!-- timeline item -->
										<li><i class="fa fa-transgender bg-green"></i>
											<div class="timeline-item">
												<h3 class="timeline-header">
													<a href="#">Gender: </a>
													<%-- <%
														if (dto.getGender() == 'M') {
															out.print("Male");
														} else {
															out.print("Female");
														}
													%> --%>
													<span ng-show="data.gender=='M'">Male</span> <span
														ng-show="data.gender=='F'">Female</span>
												</h3>
											</div></li>
										<!-- END timeline item -->

										<!-- timeline item -->
										<li><i class="fa bg-green">P</i>
											<div class="timeline-item">
												<h3 class="timeline-header">
													<a href="#">Position: </a> {{data.position}}
												</h3>
											</div></li>
										<!-- END timeline item -->

										<!-- <li><i class="fa fa-clock-o bg-gray"></i></li> -->
										<!-- timeline item -->
										<li><i class="fa fa-key bg-green"></i>
											<div class="timeline-item">
												<h3 class="timeline-header">
													<a href="#" onclick="openModalPassword.click();">Change
														Password</a>
												</h3>
											</div></li>
										<!-- END timeline item -->
									</ul>
								</div>
							</div>
						</div>
					</section>
				</div>
			</section>
		</div>
		<!-- /.content-wrapper -->

		<!-- footer -->
		<%@ include file="include/footer.jsp"%>

		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" id="openmodal"
			data-toggle="modal" style="display: none;" data-target="#myModal">Open
			Modal</button>

		<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button id="close" type="button" class="close"
							data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Edit Profile</h4>
					</div>
					<div class="modal-body">
						<form action="javascript:;" id="addForm"
							enctype="multipart/form-data">
							<div class="row">

								<div class="col-md-6">
									<div class="form-group required">
										<label class="control-label">First Name</label> <input
											name="first_name" class="form-control" type="text"
											id="first_name">
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group required">
										<label class="control-label">Last Name</label> <input
											name="last_name" class="form-control" type="text"
											id="last_name">
									</div>
								</div>

								<div class="col-md-12">
									<!-- gender -->
									<div class="form-group required">
										<label class="control-label">Gender</label>
										<div class="form-inline">
											<label> <input class="flat-red" type="radio" id="M"
												name="gender" value="Male"> Male
											</label> &nbsp; <label> <input class="flat-red" id="F"
												type="radio" name="gender" value="Female"> Female
											</label>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="form-group required">
										<label class="control-label">Phone</label> <input name="phone"
											class="form-control" type="text" id="phone">
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<!-- <button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button> -->
						<div class="btn-group pull-right">
							<button type="button" class="btn btn-success" id="addAtten"
								ng-click="save(edit)">Save</button>
							<button type="button" class="btn btn-danger" id="btncancel"
								data-dismiss="modal">Cancel</button>
						</div>
					</div>

				</div>

			</div>
		</div>

		<!-- change password modal -->
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg"
			id="openModalPassword" data-toggle="modal" style="display: none;"
			data-target="#modalPassword">Open Modal</button>

		<!-- Modal -->
		<div id="modalPassword" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<form action="javascript:;" id="changePasswordForm"
						enctype="multipart/form-data">
						<div class="modal-header">
							<button id="close" type="button" class="close"
								data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Change Password</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group required">
										<label class="control-label">Old Password</label> <input
											name="old_password" class="form-control" type="password"
											id="old_password">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group required">
										<label class="control-label">New Password</label> <input
											name="new_password" class="form-control" type="password"
											id="new_password">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group required">
										<label class="control-label">Confirm Password</label> <input
											name="confirm_password" class="form-control" type="password"
											id="confirm_password">
									</div>
								</div>
							</div>

						</div>
						<div class="modal-footer">
							<!-- <button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button> -->
							<div class="btn-group pull-right">
								<button type="submit" class="btn btn-success">Save</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal" id="closeChangePassword">Cancel</button>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>

	</div>
	<!-- ./wrapper -->

	<script type="text/javascript">
		$(function() {
			$('#changePasswordForm')
					.bootstrapValidator(
							{
								message : 'This value is not valid',
								feedbackIcons : {
									valid : 'glyphicon glyphicon-ok',
									invalid : 'glyphicon glyphicon-remove',
									validating : 'glyphicon glyphicon-refresh'
								},
								fields : {
									old_password : {
										validators : {
											notEmpty : {
												message : 'The password is required and can\'t be empty'
											},
											different : {
												field : 'username',
												message : 'The password can\'t be the same as username'
											},
											callback : {
												callback : function(value,
														validator) {
													// Check the password strength
													if (value.length < 6) {
														return {
															valid : false,
															message : 'The password must be more than 6 characters'
														}
													}

													if (value === value
															.toLowerCase()) {
														return {
															valid : false,
															message : 'The password must contain at least one upper case character'
														}
													}
													if (value === value
															.toUpperCase()) {
														return {
															valid : false,
															message : 'The password must contain at least one lower case character'
														}
													}
													if (value.search(/[0-9]/) < 0) {
														return {
															valid : false,
															message : 'The password must contain at least one digit'
														}
													}

													return true;
												}
											}
										}
									},
									new_password : {
										validators : {
											notEmpty : {
												message : 'The password is required and can\'t be empty'
											},
											different : {
												field : 'username',
												message : 'The password can\'t be the same as username'
											},
						                    identical: {
						                        field: 'confirm_password',
						                        message: 'The password and its confirm are not the same'
						                    },
											callback : {
												callback : function(value,
														validator) {
													// Check the password strength
													if (value.length < 6) {
														return {
															valid : false,
															message : 'The password must be more than 6 characters'
														}
													}

													if (value === value
															.toLowerCase()) {
														return {
															valid : false,
															message : 'The password must contain at least one upper case character'
														}
													}
													if (value === value
															.toUpperCase()) {
														return {
															valid : false,
															message : 'The password must contain at least one lower case character'
														}
													}
													if (value.search(/[0-9]/) < 0) {
														return {
															valid : false,
															message : 'The password must contain at least one digit'
														}
													}

													return true;
												}
											}
										}
									},
									confirm_password : {
										validators : {
											notEmpty : {
												message : 'The password is required and can\'t be empty'
											},
											different : {
												field : 'username',
												message : 'The password can\'t be the same as username'
											},
						                    identical: {
						                        field: 'new_password',
						                        message: 'The password and its confirm are not the same'
						                    },
											callback : {
												callback : function(value,
														validator) {
													// Check the password strength
													if (value.length < 6) {
														return {
															valid : false,
															message : 'The password must be more than 6 characters'
														}
													}

													if (value === value
															.toLowerCase()) {
														return {
															valid : false,
															message : 'The password must contain at least one upper case character'
														}
													}
													if (value === value
															.toUpperCase()) {
														return {
															valid : false,
															message : 'The password must contain at least one lower case character'
														}
													}
													if (value.search(/[0-9]/) < 0) {
														return {
															valid : false,
															message : 'The password must contain at least one digit'
														}
													}

													return true;
												}
											}
										}
									}
								}
							}).on('success.form.bv', function(e) {
						// Prevent form submission
						e.preventDefault();
						changePassword();
					});
		});

		function changePassword() {
			var data = {
				'staff_id' : $('#usrId').val(),
				'old_password' : $('#old_password').val(),
				'new_password' : $('#new_password').val()
			}

			$.post('changeUserPassword.hrd', data, function(d) {
				if (d === 'Success') {
					swal("Congratulation!", "Your password has been changed!",
							"success");
					changePasswordForm.reset();
					$('#changePasswordForm').data('bootstrapValidator').resetForm(true);
					closeChangePassword.click();
				} else {
					swal("Error!", "Old password didn't matched!", "error");
				}
			});
		}

		// click on imag

		function imgProfile() {
			$("#photoBrowse").click();
		}

		$("#photoBrowse").change(function(e) {
			readURL(this);
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#img').attr('src', e.target.result).fadeIn('slow');
				};
				reader.readAsDataURL(input.files[0]);
				/* alert(reader.readAsDataURL(input.files[0])); */
				angular.element(document.getElementById('profileCtrl')).scope()
						.update();
			}
		}
	</script>
	<script type="text/javascript" src="js/angular/profile.js"></script>
</body>
</html>
