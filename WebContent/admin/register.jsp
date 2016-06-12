<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Register</title>

<!-- include script -->
<%@ include file="include/head.jsp"%>
</head>
<body class="skin-green-light sidebar-mini fixed">
	<div class="wrapper">

		<!-- header -->
		<%@ include file="include/header.jsp"%>

		<!-- left-side -->
		<%@ include file="include/left_side.jsp"%>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="padding-top: 50px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Student <small>Management</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li><a href="register.jsp"><i class="fa fa-user-plus"></i>
							Student</a></li>
					<li class="active">Register</li>
				</ol>
			</section>

			<!-- content body -->
			<section class="content">
				<div class="row">
					<section class="col-lg-12 connectedSortable ui-sortable">
						<!-- register -->
						<div class="box box-primary">
							<div class="box-body">
								<div class="box box-solid">
									<div class="box-header ui-sortable-handle"
										style="cursor: move;">
										<i class="fa fa-edit"></i>
										<h3 class="box-title">Add Student's information</h3>
									</div>
									<div class="box-body border-radius-none"
										style="display: block;">
										<form action="javascript:;" method="post"
											enctype="multipart/form-data" id="addForm">
											<!-- photo -->
											<div class="row">
												<div class="col-md-3" style="float: right;">

													<div class="form-group center">
														<label for="photo">Select Profile Photo</label> <img
															class="profile-photo" id="img"
															src="../image/default-profile.png" />
													</div>

													<div class="form-group" style="display: none;">
														<label for="photo">Photo</label> <input type="file"
															name="photo" id="photo" accept="image/*">
													</div>

												</div>
											</div>
											<div class="box-header ui-sortable-handle"
												style="cursor: move;">
												<h3><span class="label label-success">Student's information</span></h3>
											</div>
											<!-- student name -->
											<div class="row">
												<div class="col-md-6">
													<div class="form-group required">
														<label class="control-label" for="first_name">First
															Name</label> <input type="text" class="form-control"
															name="first_name" id="first_name"
															placeholder="First name" />
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group required">
														<label class="control-label" for="last_name">Last
															Name</label> <input type="text" class="form-control"
															name="last_name" id="last_name" placeholder="Last name" />
													</div>
												</div>
											</div>

											<!-- gender and birth date -->
											<div class="row">
												<div class="col-md-6">
													<!-- gender -->
													<div class="form-group required">
														<label class="control-label">Gender</label>
														<div class="form-inline">
															<label> <input class="flat-red" type="radio"
																name="gender" value="Male"> Male
															</label> &nbsp; <label> <input class="flat-red"
																type="radio" name="gender" value="Female">
																Female
															</label>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group required">
														<label class="control-label" for="dob">Birth Date</label>
														<input type="text" class="form-control" name="dob"
															id="dob" placeholder="Birth date">
													</div>
												</div>
											</div>

											<!-- email and password -->
											<div class="row">
												<div class="col-md-6">
													<div class="form-group required">
														<label class="control-label" for="email">Email</label> <input
															type="email" class="form-control" name="email" id="email"
															placeholder="you@gmail.com">
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group required">
														<label class="control-label" for="password">Password</label>
														<input type="password" class="form-control"
															name="password" id="password" placeholder="Password">
													</div>
												</div>
											</div>


											<div class="form-group">
												<label for="address">Address</label> <input type="text"
													class="form-control" name="address" id="address"
													placeholder="Address">
											</div>

											<div class="row">
												<div class="col-md-4">
													<div class="form-group required">
														<label class="control-label" for="phone">Phone</label> <input
															type="text" class="form-control" name="phone" id="phone"
															placeholder="Phone"
															data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;"
															data-mask="" placeholder="012-345-6789">
													</div>
												</div>

												<div class="col-md-4">
													<div class="form-group">
														<label for="race">Nationality</label> <input type="text"
															class="form-control" name="race" id="race"
															placeholder="Nationality">
													</div>
												</div>

												<div class="col-md-4">
													<div class="form-group">
														<label for="social_id">Social ID</label> <input
															type="text" class="form-control" name="social_id"
															id="social_id" placeholder="Social id">
													</div>
												</div>
											</div>

											<div class="box-header ui-sortable-handle"
												style="cursor: move;">
												<h3><span class="label label-success">Parent's information</span></h3>
											</div>

											<!-- parent information -->
											<div class="row">
												<!-- father info -->
												<div class="col-md-6">
													<div class="form-group">
														<label for="father_name">Father's Name</label> <input
															type="text" class="form-control" name="father_name"
															id="father_name" placeholder="Father name">
													</div>
													<div class="form-group">
														<label for="father_phone">Father's Phone</label> <input
															type="text" class="form-control" name="father_phone"
															id="father_phone" placeholder="Father phone"
															data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;"
															data-mask="" placeholder="012-345-6789">
													</div>
												</div>

												<!-- mother info -->
												<div class="col-md-6">
													<div class="form-group">
														<label for="mother_name">Mother's Name</label> <input
															type="text" class="form-control" name="mother_name"
															id="mother_name" placeholder="Mother name">
													</div>
													<div class="form-group">
														<label for="mother_phone">Mother's Phone</label> <input
															type="text" class="form-control" name="mother_phone"
															id="mother_phone" placeholder="Mother phone"
															data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;"
															data-mask="" placeholder="012-345-6789">
													</div>
												</div>
											</div>

											<button type="button" class="btn btn-primary pull-right"
												id="add" onclick="insertStudent()">Add</button>
										</form>
									</div>

								</div>
								<!-- end register -->
							</div>
						</div>
					</section>

					<!-- <section class="col-lg-12 connectedSortable ui-sortable">
						register
						<div class="box box-primary">
							<div class="box-body">
								<div class="box box-solid">
									</form>
								</div>

							</div>
							end register
						</div> -->
				</div>
			</section>
		</div>
		</section>
	</div>
	<!-- /.content-wrapper -->

	<!-- footer -->
	<%@ include file="include/footer.jsp"%>

	<!-- ./wrapper -->

</body>

<!-- import script -->
<%@ include file="include/script.jsp"%>
<script>
	$(function() {
		/* initialize date picker */
		$("#dob").datepicker();

		//iCheck for checkbox and radio inputs
		$('input[type="checkbox"].minimal, input[type="radio"].minimal')
				.iCheck({
					checkboxClass : 'icheckbox_minimal-blue',
					radioClass : 'iradio_minimal-blue'
				});
		//Red color scheme for iCheck
		$('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red')
				.iCheck({
					checkboxClass : 'icheckbox_minimal-red',
					radioClass : 'iradio_minimal-red'
				});
		//Flat red color scheme for iCheck
		$('input[type="checkbox"].flat-red, input[type="radio"].flat-red')
				.iCheck({
					checkboxClass : 'icheckbox_flat-green',
					radioClass : 'iradio_flat-green'
				});
		//Money Euro
		$("[data-mask]").inputmask();
	});

	function insertStudent() {
		var formData = new FormData($("#addForm")[0]);
		$.ajax({
			url : 'insertStudent.hrd',
			type : 'POST',
			data : formData,
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function(data) {
				if (data == 'Success') {
					swal("Congratulation!", "New student has been added!",
							"success");
					$('#addForm')[0].reset();
					// clear check from gender field
					$('#M').removeAttr('checked');
					$('#F').removeAttr('checked');
					// set image to default
					$('#img').attr('src', 'image/default-profile.png');
				}
			},
			error : function() {
				swal("Error!", "Cannot add new student!", "error");
			}
		});

	}

	// click on image
	$('#img').click(function() {
		// call photo for browse file
		$("#photo").click();
	});

	$("#photo").change(function(e) {
		readURL(this);
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#img').attr('src', e.target.result).fadeIn('slow');
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</html>