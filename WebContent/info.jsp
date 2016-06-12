<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>My Profile</title>
<%@include file="include/head.jsp"%>
<style>
.input-group .form-control {
	position: relative;
	z-index: 2;
	float: left;
	width: 100%;
	margin-bottom: 0;
	font-size: 16px;
}

.input-group .input-group-addon {
	background: #fff;
}

.input-group-addon:first-child {
	border-right: 0;
}

@media only screen and (min-width: 600px) {
	.col-m-2 {
		float: left;
	}
}
</style>
</head>
<body class="skin-green-light sidebar-mini fixed">
	<div class="wrapper" ng-app="studentApp" ng-controller="studentCtrl" id="studentCtrl">

		<%@include file="include/header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="include/left_side.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Dashboard</h1>
				<ol class="breadcrumb">
					<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">My Profile</li>
				</ol>
			</section>

			<section class="content" ng-repeat="data in list">
				<div class="row">
					<section class="col-lg-12 connectedSortable ui-sortable">
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">{{data.first_name}}
									{{data.last_name}} : Profile</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">


								<!-- info header block -->
								<div class="row">

									<div class="col-md-3">
										<div class="form-group">
											<div style="max-width: 100%; text-align: center;">
												<img src="dist/img/logohrd.png">
											</div>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<div style="text-align: center;">
												<label class="control-label" style="text-align: center;">#12,
													St 323, Sangkat Boeung Kak II, Khan Toul Kork, Phnom Penh</label><br>
												<label class="control-label" style="text-align: center;">Tel:
													(855) 23 99 13 14, Fax (855) 23 99 14 15</label><br> <label
													class="control-label" style="text-align: center;">Email:
													info.kshrd@gmail.com, phirum.gm@gmail.com </label> <label
													class="control-label" style="text-align: center;">Website:
													www.kshrd.com.kh, Facebook:facebook.com/ksignhrd</label>
											</div>
										</div>
									</div>

									<div class="col-md-3">
										<div class="form-group center">
											<img id="photo" class="profile-photo" alt="Profile Photo"
												onclick="clickPhoto();" src="image/student/{{data.photo}}">

										</div>
									</div>
								</div>

								<form id="profileForm">

									<!-- browse image -->
									<input type="file" id="browsePhoto" style="display: none;"
										onchange="readURL(this);"> <input type="text"
										name="hide_img" id="hide_img" style="display: none;"
										value="{{data.photo}}">

									<div class="panel panel-default">
										<div class="panel-heading">Personal Information</div>
										<div class="panel-body">
											<div class="row">
												<div class="col-md-3">
													<div class="form-group">
														<label for="first_name">Student ID</label> <input
															type="text" class="form-control" placeholder="Student ID"
															value="{{data.stu_id}}" disabled="disabled"> <input
															type="hidden" id="stu_id" name="stu_id"
															value="{{data.stu_id}}">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-4">
													<div class="form-group">
														<label for="first_name">First Name</label> <input
															type="text" class="form-control" name="first_name"
															id="first_name" placeholder="First Name"
															value="{{data.first_name}}">
													</div>
												</div>

												<div class="col-md-4">
													<div class="form-group">
														<label for="last_name">Last Name</label> <input
															type="text" class="form-control" name="last_name"
															id="last_name" placeholder="Last Name"
															value="{{data.last_name}}">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-4">
													gender
													<div class="form-group required">
														<label class="control-label">Gender</label>
														<div class="form-inline">
															<label> <input ng-checked="data.gender=='M'"
																id="M" class="flat-red" type="radio" name="gender"
																value="Male"> Male
															</label> &nbsp; <label> <input
																ng-checked="data.gender=='F'" id="F" class="flat-red"
																type="radio" name="gender" value="Female">
																Female
															</label>
														</div>
													</div>
												</div>

												<div class="col-md-4">
													<div class="form-group required">
														<label class="control-label" for="dob">Birth Date</label>
														<input type="text" class="form-control" name="dob"
															id="dob" placeholder="Birth date" value="{{data.dob}}">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-4">
													<div class="form-group required">
														<label class="control-label" for="email">Email</label> <input
															type="email" class="form-control" name="email" id="email"
															placeholder="you@gmail.com" value="{{data.email}}">
													</div>
												</div>
												<div class="col-md-8">
													<div class="form-group">
														<label for="address">Address</label> <input type="text"
															class="form-control" name="address" id="address"
															placeholder="Address" value="{{data.address}}">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-4">
													<div class="form-group">
														<label for="phone">Phone</label> <input type="text"
															class="form-control" name="phone" id="phone"
															value="{{data.phone}}"
															data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;"
															data-mask="" placeholder="012-345-6789">
													</div>
												</div>

												<div class="col-md-4">
													<div class="form-group">
														<label for="race">Nationality</label> <input type="text"
															class="form-control" name="race" id="race"
															placeholder="Nationality" value="{{data.race}}">
													</div>
												</div>

												<div class="col-md-4">
													<div class="form-group">
														<label for="social_id">Social ID</label> <input
															type="text" class="form-control" name="social_id"
															id="social_id" placeholder="Social id"
															value="{{data.social_id}}">
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="panel panel-default">
										<div class="panel-heading">Parent's Informations</div>
										<div class="panel-body">
											<div class="row">
												father info
												<div class="col-md-6">
													<div class="form-group">
														<label for="father_name">Father's Name</label> <input
															type="text" class="form-control" name="father_name"
															id="father_name" placeholder="Father name"
															value="{{data.father_name}}">
													</div>
													<div class="form-group">
														<label for="father_phone">Father's Phone</label> <input
															type="text" class="form-control" name="father_phone"
															id="father_phone" placeholder="Father phone"
															value="{{data.father_phone}}"
															data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;"
															data-mask="" placeholder="012-345-6789">
													</div>
												</div>


												mother info
												<div class="col-md-6">
													<div class="form-group">
														<label for="mother_name">Mother's Name</label> <input
															type="text" class="form-control" name="mother_name"
															id="mother_name" placeholder="Mother name"
															value="{{data.mother_name}}">
													</div>
													<div class="form-group">
														<label for="mother_phone">Mother's Phone</label> <input
															type="text" class="form-control" name="mother_phone"
															id="mother_phone" placeholder="Mother phone"
															value="{{data.mother_phone}}"
															data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;"
															data-mask="" placeholder="012-345-6789">
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="btn-group pull-right">
										<button type="button" class="btn btn-success" id="addGen"
											onclick="update()">Update</button>
									</div>

								</form>
							</div>
						</div>
					</section>
				</div>
			</section>
		</div>

	</div>
	<!-- /.content-wrapper -->
	<!-- footer -->
	<%@include file="include/footer.jsp"%>

	<!-- /.control-sidebar -->
	<!-- Add the sidebar's background. This div must be placed -->
	<div class="control-sidebar-bg"></div>

	<!-- ./wrapper -->
	<%@include file="include/script.jsp"%>
	<script type="text/javascript" src="js/angular/info.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#dob").datepicker();

			//Money Euro
			$("[data-mask]").inputmask();

		});

		function clickPhoto() {
			$("#browsePhoto").click();
		}

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#photo').attr('src', e.target.result).fadeIn('slow');
				};
				reader.readAsDataURL(input.files[0]);
			}
		}

		function update() {
			
			var formData = new FormData($("#profileForm")[0]);
			$.ajax({
				url : 'UpdateStudentProfile.hrd',
				type : 'POST',
				data : formData,
				/* async : false, */
				cache : false,
				contentType : false,
				processData : false,
				success : function(data) {
					if (data == 'Success') {
						swal("Congratulation!", "Student has been updated!",
								"success");
						/* $scope.loadData(); */
						angular.element('#studentCtrl').scope().loadData(); 
					}
				},
				error : function() {
					swal("Error!", "Cannot update student!", "error");
				}
			});
		}
	</script>
</body>
</html>