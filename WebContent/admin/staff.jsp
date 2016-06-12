<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff Management</title>

<!-- include script -->
<%@ include file="include/head.jsp"%>

<style>
.spinner {
	position: fixed;
	top: 50%;
	left: 50%;
	margin-left: -50px; /* half width of the spinner gif */
	margin-top: -50px; /* half height of the spinner gif */
	text-align: center;
	z-index: 1234;
	overflow: auto;
	width: 140px; /* width of the spinner gif */
	height: 102px; /*hight of the spinner gif +2px to fix IE8 issue */
}
</style>
<style>
.avatar-frame, .avatar-frame img {
	width: 60px !important;
	height: 60px !important;
	-webkit-border-radius: 100% !important; /* Saf3+, Chrome */
	-moz-border-radius: 100%; /* for firefox */
	border-radius: 100% !important; /* Opera 10.5, IE 9 */
}
</style>

</head>
<body class="skin-green-light sidebar-mini fixed">
	<div id="spinner" class="spinner" style="display: none">
		<img id="img-spinner" src="image/ajax-loader.gif" alt="Loading" />
	</div>

	<div class="wrapper" ng-app="StaffApp" ng-controller="staffCtrl">

		<!-- header -->
		<%@ include file="include/header.jsp"%>

		<!-- left-side -->
		<%@ include file="include/left_side.jsp"%>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="padding-top: 50px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Staff <small>Management</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">Staff</li>
				</ol>
			</section>

			<!-- content body -->
			<section class="content">
				<div class="row">
					<section class="col-lg-9 connectedSortable ui-sortable">
						<!-- staff -->
						<div class="box box-primary">
							<div class="box-header ui-sortable-handle" style="cursor: move;">
								<i class="glyphicon glyphicon-user"></i>
								<h3 class="box-title">Staff List</h3>
								<div class="box-tools pull-right">
									<div class="" ng-show="filteredItems > 0">
										<div pagination="" page="currentPage" max-size="10"
											on-select-page="setPage(page)" boundary-links="true"
											total-items="filteredItems" items-per-page="entryLimit"
											class="pagination-small" previous-text="«" next-text="»"></div>
									</div>
								</div>
								<br> <br>
								<!-- form search -->
								<div class="form-inline">
									<!-- show -->

									<!-- limit entry -->
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th-list"></span>
											</div>
											<select class="form-control" id="entryLimit"
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
												placeholder="Search Staff...">
										</div>
										<!-- /.input group -->
									</div>
								</div>
								<!-- end form search -->
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
									<table class="table no-margin">
										<thead>
											<tr>
												<th>Staff ID</th>
												<th>Full Name&nbsp;<a ng-click="sort_by('first_name');"><i
														class="glyphicon glyphicon-sort"></i></a></th>
												<th>Gender&nbsp;<a ng-click="sort_by('gender');"><i
														class="glyphicon glyphicon-sort"></i></a></th>
												<th>Position&nbsp;<a ng-click="sort_by('position');"><i
														class="glyphicon glyphicon-sort"></i></a></th>
												<th>Email &nbsp;<a ng-click="sort_by('email');"><i
														class="glyphicon glyphicon-sort"></i></a></th>
												<th class="center">Drop&nbsp;<a
													ng-click="sort_by('status');"><i
														class="glyphicon glyphicon-sort"></i></a></th>
											</tr>
										</thead>
										<tbody>
											<tr
												ng-repeat="data in filtered = (list | filter:{first_name:search} | orderBy : predicate :reverse) | startFrom:(currentPage-1)*entryLimit | limitTo:entryLimit">
												<td>{{data.staff_id}}</td>
												<td><a href="#" ng-click="editUser(data.staff_id)"
													class="update" data-toggle="modal" id="editable-sample_new"
													title="Click to update" data-original-title="Update">{{data.first_name}}
														{{data.last_name}} </a></td>
												<td><span class="label label-danger"
													ng-show="{{data.gender=='F'}}">{{data.gender}}</span> <span
													class="label label-primary" ng-show="{{data.gender=='M'}}">{{data.gender}}</span>
												</td>
												<td><span class="label label-success"
													ng-show="{{data.position=='Admin'}}">{{data.position}}</span>
													<span class="label label-warning"
													ng-show="{{data.position=='Instructor'}}">{{data.position}}</span>
												</td>
												<td>{{data.email}}</td>
												<td>
													<!-- <span class="css3-metro-dropdown"> <select
														class="btn-default" id="status{{data.staff_id}}"
														ng-model="status"
														ng-change="changeState(data.staff_id, this)">
															<option value="available"
																ng-selected="{{data.status=='available'}}">Available</option>
															<option value="unavailable"
																ng-selected="{{data.status=='unavailable'}}">Unavailable</option>
															<option value="drop"
																ng-selected="{{data.status=='drop'}}">Drop</option>
														</select>
													</span> -->
													<div class="center">
														<button class="btn btn-success"
															ng-click="changeState(data.staff_id, data.status, data.first_name, data.last_name)"
															ng-show="data.status!='drop'"
															title="Click to change staff to drop!">
															<i class="fa fa-check-circle"></i>
														</button>
														<span class="label bg-red" ng-show="data.status=='drop'">Yes</span>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix no-border">
								<div class="box box-solid collapsed-box">
									<div class="box-header ui-sortable-handle"
										style="cursor: move;">
										<i class="fa fa-edit"></i>
										<!-- <h3 class="box-title">Add Staff</h3>
										<div class="box-tools pull-right"> -->
										<!-- <i class="fa fa-plus"></i> -->
										<h3 class="box-title" ng-show="edit">Add Staff</h3>
										<h3 class="box-title" ng-show="!edit">Update Staff</h3>
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
										<div class="box-tools pull-right">
											<button class="btn btn-primary btn-sm"
												ng-click="editUser('new')" id="btnadd">
												<i class="fa fa-plus"></i>
											</button>
										</div>
										<!-- </div> -->
									</div>
									<div class="box-body border-radius-none" style="display: none;">
										<form action="javascript:;" method="post"
											enctype="multipart/form-data" id="addForm">

											<!-- photo -->
											<div class="row">
												<div class="col-md-3" style="float: right;">

													<div class="form-group center">
														<label for="photo">Select Profile Photo</label> <img
															class="profile-photo" id="img"
															src="../image/default-profile.png" /> <input type="text"
															name="hide_img" id="hide_img" style="display: none;">
													</div>

													<div class="form-group" style="display: none;">
														<label for="photo">Photo</label> <input type="file"
															name="photo" id="photo" accept="image/*">
													</div>

												</div>
											</div>
											<input type="text" name="id" id="id" style="display: none;">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label for="first_name">First Name</label>
														<div class="input-group">
															<div class="input-group-addon">
																<span class="glyphicon glyphicon-user"></span>
															</div>
															<input type="text" class="form-control" name="first_name"
																id="first_name" ng-model="first_name"
																placeholder="First Name">
														</div>
														<!-- /.input group -->
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group">
														<label for="last_name">Last Name</label>
														<div class="input-group">
															<div class="input-group-addon">
																<span class="glyphicon glyphicon-user"></span>
															</div>
															<input type="text" class="form-control" name="last_name"
																id="last_name" ng-model="last_name"
																placeholder="Last Name">
														</div>
														<!-- /.input group -->
													</div>
												</div>
											</div>

											<!-- gender -->
											<div class="form-group">
												<label>Gender</label>
												<div class="form-inline">
													<label> <input class="flat-red" type="radio" id="M"
														name="gender" value="Male"> Male
													</label> &nbsp; <label> <input class="flat-red" id="F"
														type="radio" name="gender" value="Female"> Female
													</label>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label for="position">Position</label>
														<div class="input-group">
															<div class="input-group-addon">
																<span class="glyphicon glyphicon-cog"></span>
															</div>
															<select class="form-control" name="position"
																ng-model="position" id="position">
																<option value="Admin">Admin</option>
																<option value="Instructor">Instructor</option>
															</select>
														</div>
														<!-- /.input group -->
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group">
														<label>Phone</label>
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-phone"></i>
															</div>
															<input name="phone" id="phone" type="text"
																ng-model="phone" class="form-control"
																data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;"
																data-mask="" placeholder="012-345-6789">
														</div>
														<!-- /.input group -->
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Email</label>
														<div class="input-group">
															<div class="input-group-addon">@</div>
															<input type="email" name="email" id="email"
																ng-model="email" class="form-control"
																placeholder="Email">
														</div>
														<!-- /.input group -->
													</div>
												</div>

												<div class="col-md-6" id="passField">
													<div class="form-group">
														<label>Password</label>
														<div class="input-group">
															<div class="input-group-addon">
																<span class="glyphicon glyphicon-lock"></span>
															</div>

															<span style="float: left;"><input type="password"
																name="password" id="password" ng-model="password"
																class="form-control" placeholder="Password"></span> <span
																style="float: right;">
																<!-- <input type="password"
																name="confirmPassword" id="confirmPassword"
																ng-model="confirmPassword" class="form-control"
																placeholder="Confirm Password"> -->
															</span>
														</div>
														<!-- /.input group -->
													</div>
												</div>
											</div>

											<!-- photo -->
											<!-- <div class="form-group">
												<label for="photo">Photo</label> <input type="file" ng-model="photo"
													name="photo" id="photo" accept="image/*">
												<p class="help-block">Please upload profile picture</p>
											</div> -->

											<!-- button -->
											<div class="btn-group pull-right">
												<button type="button" class="btn btn-success" id="addGen"
													ng-click="save(edit)">Save</button>
												<button type="button" class="btn btn-danger" id="btncancel">Cancel</button>
											</div>
										</form>
									</div>
									<!-- /.box-body -->

								</div>
							</div>
						</div>
						<!-- end staff list -->

					</section>

					<section class="col-lg-3 connectedSortable ui-sortable">

						<!-- Admin block -->
						<div class="box box-danger">
							<div class="box-header with-border">
								<h3 class="box-title">Admin</h3>
								<div class="box-tools pull-right">
									<!-- <span class="label label-danger">8 Members</span> -->
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<!-- <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body no-padding">
								<ul class="users-list clearfix">
									<li
										ng-repeat="s in filtered = (list | filter:{position:'Admin'} | orderBy : predicate :reverse) | startFrom:(currentPage-1)*entryLimit | limitTo:entryLimit">
										<img class="avatar-frame" src="../image/staff/{{s.photo}}"
										alt="User Image"> <a href="#"
										ng-click="editUser(s.staff_id)" class="update users-list-name"
										data-toggle="modal" id="editable-sample_new"
										title="Click to update" data-original-title="Update">{{s.last_name}}</a>
										<span class="users-list-date">{{s.staff_id}}</span>
									</li>
								</ul>
								<!-- /.users-list -->
							</div>
							<!-- /.box-body -->
						</div>
						<!-- end admin block -->

						<!-- instructor block -->
						<div class="box box-success">
							<div class="box-header with-border">
								<h3 class="box-title">Instructor</h3>
								<div class="box-tools pull-right">
									<!-- <span class="label label-success">8 Members</span> -->
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<!-- <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body no-padding">
								<ul class="users-list clearfix">
									<li
										ng-repeat="s in filtered = (list | filter:{position:'Instructor'} | orderBy : predicate :reverse)">
										<img class="avatar-frame" src="../image/staff/{{s.photo}}"
										alt="User Image"> <a href="#"
										ng-click="editUser(s.staff_id)" class="update users-list-name"
										data-toggle="modal" id="editable-sample_new"
										title="Click to update" data-original-title="Update">{{s.last_name}}</a>
										<span class="users-list-date">{{s.staff_id}}</span>
									</li>
								</ul>
								<!-- /.users-list -->
							</div>
							<!-- /.box-body -->
						</div>
						<!-- end instructor block -->
					</section>
				</div>
			</section>
		</div>
		<!-- /.content-wrapper -->

		<!-- footer -->
		<%@ include file="include/footer.jsp"%>


	</div>
	<!-- ./wrapper -->

	<!-- import script -->
	<%@ include file="include/script.jsp"%>
	<script type="text/javascript">
		$(function() {
			//Money Euro
			$("[data-mask]").inputmask();

			// collapse box on btn cancel clicked
			$("#btncancel").click(function() {
				$("#btn-collapse").click();
				$("#change-label").click();

			});

		});
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
	<script type="text/javascript" src="js/angular/staff.js"></script>
</body>
</html>