<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student List</title>

<!-- include script -->
<%@ include file="include/head.jsp"%>
<style>
.avatar-frame, .avatar-frame img {
	width: 50px;
	height: 50px;
	-webkit-border-radius: 30px; /* Saf3+, Chrome */
	border-radius: 30px; /* Opera 10.5, IE 9 */
	/*-moz-border-radius: 30px;  Disabled for FF1+ */
}
</style>
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
					<li><a href="student_lis.jsp"><i class="fa fa-user"></i>
							Student</a></li>
					<li class="active">Student List</li>
				</ol>
			</section>

			<!-- content body -->
			<section class="content">
				<div class="row">
					<section class="col-lg-12 connectedSortable ui-sortable"
						ng-app="studentApp" ng-controller="studentCtrl">

						<!-- course -->
						<div class="box box-success">
							<div class="box-header ui-sortable-handle" style="cursor: move;">
								<i class="ion ion-clipboard"></i>
								<h3 class="box-title">Student List</h3>
								<!-- pagination -->
								<div class="box-tools pull-right">
									<div class="" ng-show="filteredItems > 0">
										<div pagination="" page="currentPage" max-size="10"
											on-select-page="setPage(page)" boundary-links="true"
											total-items="filteredItems" items-per-page="entryLimit"
											class="pagination-small" previous-text="«" next-text="»"></div>
									</div>
								</div>
								<br> <br>
								<!-- search -->
								<div class="form-inline">
									<!-- show -->

									<!-- limit entry -->
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th-list"></span>
											</div>
											<select id="entryLimit" class="form-control"
												ng-model="entryLimit">
												<option>5</option>
												<option>10</option>
												<option>15</option>
												<option>20</option>
											</select>
										</div>
										<!-- /.input group -->
									</div>

									<!-- search -->
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-search"></span>
											</div>
											<input type="text" class="form-control" name="search"
												id="search" ng-model="search" ng-change="filter()"
												placeholder="Search student...">
										</div>
										<!-- /.input group -->
									</div>

									<div class="btn-group">
										<button type="button" id="import" class="btn btn-success" style="display: none;">Import</button>
										<input type="file" id="fileImport" style="display: none;" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel">
										<button type="button" id="export" class="btn btn-danger" onclick="exportStudent()">Export</button>
									</div>
								</div>
								<!-- end search -->

							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive">
								<table class="table no-margin">
									<thead>
										<tr>
											<th class="center">Student ID&nbsp;<a
												ng-click="sort_by('stu_id');"><i
													class="glyphicon glyphicon-sort"></i></a></th>
											<th class="center">Photo&nbsp;<a><i></i></a></th>
											<th class="center">Name&nbsp;<a
												ng-click="sort_by('first_name');"><i
													class="glyphicon glyphicon-sort"></i></a></th>
											<th class="center">Gender&nbsp;<a
												ng-click="sort_by('gender');"><i
													class="glyphicon glyphicon-sort"></i></a></th>
											<th class="center">Birth Date&nbsp;<a
												ng-click="sort_by('dob');"><i
													class="glyphicon glyphicon-sort"></i></a></th>
											<th class="center">Address&nbsp;<a
												ng-click="sort_by('address');"><i
													class="glyphicon glyphicon-sort"></i></a></th>
											<th class="center">Telephone&nbsp;<a
												ng-click="sort_by('phone');"><i
													class="glyphicon glyphicon-sort"></i></a></th>
											<th class="center">Email&nbsp;<a
												ng-click="sort_by('email');"><i
													class="glyphicon glyphicon-sort"></i></a></th>
											<th class="center">Drop&nbsp;<a
												ng-click="sort_by('status');"><i
													class="glyphicon glyphicon-sort"></i></a></th>

										</tr>
									</thead>
									<tbody>
										<tr
											ng-repeat="data in filtered = (list | filter:{first_name:search} | orderBy : predicate :reverse) | startFrom:(currentPage-1)*entryLimit | limitTo:entryLimit">
											<td>{{data.stu_id}}</td>

											<td><img class="avatar-frame"
												src="../image/student/{{data.photo}}" /></td>

											<td><span ng-show="data.status!='drop'"><a
													href="#" ng-click="editUser(data.stu_id)" class="update"
													data-toggle="modal" id="editable-sample_new"
													title="Click to update" data-original-title="Update">{{
														data.first_name }} {{ data.last_name }}</a></span> <span
												ng-show="data.status=='drop'">{{data.first_name }} {{
													data.last_name }}</span></td>
											<td class="center">{{ data.gender }}</td>
											<td>{{ data.dob }}</td>
											<td>{{ data.address }}</td>
											<td>{{ data.phone }}</td>
											<td>{{ data.email }}</td>
											<td>
												<div class="center">
													<button class="btn btn-success"
														ng-click="changeState(data.stu_id, data.status, data.first_name, data.last_name)"
														ng-show="data.status!='drop'"
														title="Click to change student to drop!">
														<i class="fa fa-check-circle"></i>
													</button>
													<span class="label bg-red" ng-show="data.status=='drop'">Yes</span>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.box-body -->

							<!-- footer -->
							<div class="box-footer clearfix no-border">
								<div class="box box-solid collapsed-box">
									<div class="box-header ui-sortable-handle"
										style="cursor: move;">
										<i class="fa fa-edit" ng-show="!edit"></i>
										<h3 class="box-title" ng-show="!edit">Update Student</h3>
										<!-- change label -->
										<div class="box-tools pull-right" style="display: none;">
											<button class="btn btn-success btn-sm" data-widget="collapse"
												id="change-label" ng-click="loadData();">
												<i class="fa fa-plus"></i>
											</button>
										</div>

										<div class="box-tools pull-right">
											<button class="btn btn-primary btn-sm" data-widget="collapse"
												style="display: none;" id="btn-collapse">
												<i id="collapse-status" class="fa fa-plus"></i>
											</button>
										</div>
										<!-- <div class="box-tools pull-right">
											<button class="btn btn-success btn-sm"
												ng-click="editUser('new')" id="btnadd">
												<i class="fa fa-plus"></i>
											</button>
										</div> -->
									</div>
									<div class="box-body border-radius-none" style="display: none;">

										<form action="javascript:;" method="post"
											enctype="multipart/form-data" id="addForm">

											<div class="row">
												<div class="col-md-3">
													<div class="form-group" style="display: none;">
														<label for="photo">Photo</label> <input type="file"
															name="photo" id="photo" accept="image/*.jpg">
													</div>
													<div class="form-group center">
														<img class="profile-photo" id="img" src="" /> <input
															type="text" name="hide_img" id="hide_img"
															style="display: none;">
													</div>
												</div>
											</div>
											<div class="box-header ui-sortable-handle"
												style="cursor: move;">
												<i class="fa fa-asterisk"></i>
												<p class="box-title">Student's information</p>
											</div>
											<!-- student id -->
											<div class="row">
												<div class="col-md-6">
													<div class="form-group" style="clear: right;">
														<label for="stu_id">Student's ID</label> <input
															type="text" class="form-control" name="stu_id"
															id="stu_id" placeholder="Student's id" ng-model="stu_id"
															disabled="disabled"> <input type="text" name="id"
															id="id" style="display: none;">
													</div>
												</div>
											</div>

											<!-- student name -->
											<div class="row">
												<div class="col-md-6">
													<div class="form-group required">
														<label class="control-label" for="first_name">First
															Name</label> <input type="text" class="form-control"
															name="first_name" id="first_name"
															placeholder="First name" ng-model="first_name" />
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="control-label" for="last_name required">Last
															Name</label> <input type="text" class="form-control"
															name="last_name" id="last_name" placeholder="Last name"
															ng-model="last_name" />
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
															<label> <input id="M" class="flat-red"
																type="radio" name="gender" value="Male"> Male
															</label> &nbsp; <label> <input id="F" class="flat-red"
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
															id="dob" placeholder="Birth date" ng-model="dob">
													</div>
												</div>
											</div>

											<!-- email and password -->
											<div class="row">
												<div class="col-md-6">
													<div class="form-group required">
														<label class="control-label" for="email">Email</label> <input
															type="email" class="form-control" name="email" id="email"
															placeholder="you@gmail.com" ng-model="email">
													</div>
												</div>

												<div class="col-md-6" style="display: none;">
													<div class="form-group required">
														<label class="control-label" for="password">Password</label>
														<input type="password" class="form-control"
															name="password" id="password" placeholder="Password"
															ng-model="password">
													</div>
												</div>
											</div>


											<div class="form-group">
												<label for="address">Address</label> <input type="text"
													class="form-control" name="address" id="address"
													placeholder="Address" ng-model="address">
											</div>

											<div class="row">
												<div class="col-md-4">
													<div class="form-group">
														<label for="phone">Phone</label> <input type="text"
															class="form-control" name="phone" id="phone"
															ng-model="phone"
															data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;"
															data-mask="" placeholder="012-345-6789">
													</div>
												</div>

												<div class="col-md-4">
													<div class="form-group">
														<label for="race">Nationality</label> <input type="text"
															class="form-control" name="race" id="race"
															placeholder="Nationality" ng-model="race">
													</div>
												</div>

												<div class="col-md-4">
													<div class="form-group">
														<label for="social_id">Social ID</label> <input
															type="text" class="form-control" name="social_id"
															id="social_id" placeholder="Social id"
															ng-model="social_id">
													</div>
												</div>
											</div>

											<!-- parent's information -->
											<div class="box-header ui-sortable-handle"
												style="cursor: move;">
												<i class="fa fa-asterisk"></i>
												<p class="box-title">Parents's information</p>
											</div>
											<div class="row">
												<!-- father info -->
												<div class="col-md-6">
													<div class="form-group">
														<label for="father_name">Father's Name</label> <input
															type="text" class="form-control" name="father_name"
															id="father_name" placeholder="Father name"
															ng-model="father_name">
													</div>
													<div class="form-group">
														<label for="father_phone">Father's Phone</label> <input
															type="text" class="form-control" name="father_phone"
															id="father_phone" placeholder="Father phone"
															ng-model="father_phone"
															data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;"
															data-mask="" placeholder="012-345-6789">
													</div>
												</div>


												<!-- mother info -->
												<div class="col-md-6">
													<div class="form-group">
														<label for="mother_name">Mother's Name</label> <input
															type="text" class="form-control" name="mother_name"
															id="mother_name" placeholder="Mother name"
															ng-model="mother_name">
													</div>
													<div class="form-group">
														<label for="mother_phone">Mother's Phone</label> <input
															type="text" class="form-control" name="mother_phone"
															id="mother_phone" placeholder="Mother phone"
															ng-model="mother_phone"
															data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;"
															data-mask="" placeholder="012-345-6789">
													</div>
												</div>
											</div>

											<!-- button -->
											<div class="btn-group pull-right">
												<button type="button" class="btn btn-success" id="addGen"
													ng-disabled="error || incomplete" ng-click="save(edit)">Save</button>
												<button type="button" class="btn btn-danger" id="btncancel">Cancel</button>
											</div>
										</form>
									</div>
									<!-- /.box-body -->
								</div>
							</div>
						</div>
						<!-- end course -->

					</section>

				</div>
			</section>
		</div>
		<!-- /.content-wrapper -->

		<!-- footer -->
		<%@ include file="include/footer.jsp"%>


	</div>
	<!-- ./wrapper -->

</body>
<!-- import script -->
<%@ include file="include/script.jsp"%>
<script type="text/javascript" src="js/angular/student_list.js"></script>
<script type="text/javascript">
	$(function() {
		// collapse box on btn cancel clicked
		$("#btncancel").click(function() {

			$("#btn-collapse").click();
			$("#change-label").click();

		});

		$('#import').on('click', function(){
			$("#fileImport").click();
		});
		
		$("#dob").datepicker();

		//Money Euro
		$("[data-mask]").inputmask();

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
	});
	
	function exportStudent(){
		
		location.href='export-student.hrd';
	}
	
</script>
</html>


