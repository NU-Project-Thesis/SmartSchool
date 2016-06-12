<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enroll Management</title>

<!-- include script -->
<%@ include file="include/head.jsp"%>
<style type="text/css">
.form-group {
	margin-bottom: 10px !important;
}
</style>
</head>
<body class="skin-green-light sidebar-mini fixed">
	<div id="spinner" class="spinner" style="display: none">
		<img id="img-spinner" src="image/ajax-loader.gif" alt="Loading" />
	</div>
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
					Enroll <small>Management</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li><a href="#"><i class="glyphicon glyphicon-list-alt"></i>
							Enroll</a></li>
					<li class="active">Student Enroll</li>
				</ol>
			</section>

			<!-- content body -->
			<section class="content">
				<div class="row">
					<section class="col-lg-12 connectedSortable ui-sortable"
						ng-app="studentEnrollApp" ng-controller="studentEnrollCtrl">
						<!-- staff -->
						<div class="box box-success">
							<div class="box-header ui-sortable-handle" style="cursor: move;">
								<i class="glyphicon glyphicon-user"></i>
								<h3 class="box-title">Student Enrollment</h3>
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
								<!-- form search -->
								<div class="form-inline">
									<!-- show -->
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

									<!-- generation -->
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Generation</span>
											</div>
											<select class="form-control" id="genFilter"
												ng-change="showCourse=true" ng-model="genFilter">
												<option value="0">All Generation</option>
												<option ng-repeat="g in gen" value="{{g.gen_id}}">{{g.gen_name}}</option>
											</select>
										</div>
										<!-- /.input group -->
									</div>

									<!-- course -->
									<div class="form-group" ng-show="showCourse">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Course</span>
											</div>
											<select class="form-control" id="courseFilter"
												ng-change="showClass=true" ng-model="courseFilter">
												<option value="0">All Course</option>
												<option
													ng-repeat="c in filtered = (course | filter:{gen_id:genFilter} | orderBy:cou_name)"
													value="{{c.cou_id}}">{{c.cou_name}}</option>
											</select>
										</div>
										<!-- /.input group -->
									</div>

									<!-- class -->
									<div class="form-group" ng-show="showClass">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Class</span>
											</div>
											<select class="form-control" id="classFilter"
												ng-model="classFilter">
												<option value="0">All Class</option>
												<option
													ng-repeat="c in filtered = (class_ | filter:{cou_id:courseFilter} | orderBy:class_name)"
													value="{{c.class_id}}">{{c.class_name}}</option>
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
								</div>
								<!-- end form search -->
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
									<table class="table no-margin">
										<thead>
											<tr>
												<th>N&#186;</th>
												<th>Student&nbsp;<a ng-click="sort_by('first_name');"><i
														class="glyphicon glyphicon-sort"></i></a></th>
												<th>Class&nbsp;<a ng-click="sort_by('class_name');"><i
														class="glyphicon glyphicon-sort"></i></a></th>
												<!-- <th>Description&nbsp;<a
													ng-click="sort_by('description');"><i
														class="glyphicon glyphicon-sort"></i></a></th> -->
												<th class="center">Delete</th>
											</tr>
										</thead>
										<tbody>
											<tr
												ng-repeat="data in filtered = (list | filter:{first_name:search,gen_id:genFilter,cou_id:courseFilter, class_id:classFilter} | orderBy : predicate :reverse) | startFrom:(currentPage-1)*entryLimit | limitTo:entryLimit">
												<td>{{$index+1}}</td>
												<td><a href="#" ng-click="editUser(data.stu_enroll)"
													ng-if="data.is_finish==false" class="update"
													data-toggle="modal" id="editable-sample_new"
													title="Click to update" data-original-title="Update">{{data.first_name}}
														{{data.last_name}} </a> <!-- if the course that it related to is finished just show the normal name without link -->
													<span ng-if="data.is_finish==true">
														{{data.first_name}} {{data.last_name}}</span></td>
												<td>{{data.class_name}}</td>
												<!-- <td>{{data.description}}</td> -->
												<td class="center">
													<!-- enable button if course finish -->
													<button ng-if="data.is_finish==false"
														ng-click="del(data.stu_enroll, data.is_finish)"
														class="btn btn-danger btn-md">
														<i class="fa fa-trash-o"></i>
													</button> <!-- disable button if course finish -->
													<button ng-if="data.is_finish==true" disabled
														ng-click="del(data.stu_enroll, data.is_finish)"
														class="btn btn-danger btn-md">
														<i class="fa fa-trash-o"></i>
													</button>
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
										<h3 class="box-title" ng-show="edit">Add Student
											Enrollment</h3>
										<h3 class="box-title" ng-show="!edit">Update Student
											Enrollment</h3>
										<!-- change label -->
										<div class="box-tools pull-right" style="display: none;">
											<button class="btn btn-success btn-sm" data-widget="collapse"
												id="change-label" ng-click="loadData();">
												<i class="fa fa-plus"></i>
											</button>
										</div>
										<div class="box-tools pull-right">
											<button class="btn btn-success btn-sm" data-widget="collapse"
												style="display: none;" id="btn-collapse">
												<i id="collapse-status" class="fa fa-plus"></i>
											</button>
										</div>
										<div class="box-tools pull-right">
											<button class="btn btn-success btn-sm"
												ng-click="editUser('new')" id="btnadd">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
									<div class="box-body border-radius-none" style="display: none;">
										<form action="javascript:;" method="post" id="addForm">

											<div class="row">
												<div class="col-md-3">
													<div class="form-group required">
														<label for="clGen" class="control-label">Generation</label>
														<select ng-change="showCourse_=true" id="listGenClass"
															class="form-control" name="clGen" ng-model="gen_id">
															<option ng-repeat="g in activeGen" value="{{g.gen_id}}">{{g.gen_name}}</option>
														</select>
													</div>
												</div>

												<div class="col-md-3" ng-show="showCourse_">
													<div class="form-group required">
														<label for="clCourse" class="control-label">Course</label>
														<select ng-change="showClass_=true" class="form-control"
															name="clCourse" id="clCourse" ng-model="cou_id">
															<option
																ng-repeat="c in filtered = (activeCourse | filter:{gen_id:gen_id} | orderBy:cou_name)"
																value="{{c.cou_id}}">{{c.cou_name}}</option>
														</select>
													</div>
												</div>

												<div class="col-md-3" ng-show="showClass_">
													<div class="form-group required">
														<label for="clCourse" class="control-label">Class</label>
														<select ng-change="showStudent=true" class="form-control"
															name="class_id" id="class_id" ng-model="class_id">
															<option
																ng-repeat="cl in filtered = (class_ | filter:{cou_id:cou_id} | orderBy:class_name)"
																value="{{cl.class_id}}">{{cl.class_name}}</option>
														</select>
													</div>
												</div>
											</div>

											<div class="row" style="display: none;">
												<div class="col-md-12">
													<div class="form-group">
														<label>Description</label> <input type="text"
															class="form-control" id="description" name="description"
															placeholder="Description" />
													</div>
												</div>
											</div>

											<!-- student -->
											<div class="row" ng-show="showStudent">
												<div class="col-md-3" ng-show="temp_stu_show">
													<div class="form-group required">

														<!-- show input text for edit -->
														<label class="control-label">Student</label> <input
															class="form-control" type="text" id="temp_stu"
															ng-disabled="true" />
													</div>
													<!-- /.form-group -->
												</div>
												<div class="col-md-12" ng-show="stu_show">
													<div class="form-group required">
														<input type="hidden" id="stu_id" name="stu_id" /> <label
															class="control-label">Student</label> <select
															class="form-control select2" multiple="multiple"
															data-placeholder="Select students" id="stu">
															<option ng-repeat="stu in student" value="{{stu.stu_id}}">{{stu.first_name}}
																{{stu.last_name}}</option>
														</select>
													</div>
													<!-- /.form-group -->
												</div>
											</div>
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
<script type="text/javascript" src="js/angular/student_enroll.js"></script>
<script type="text/javascript">
	$(function() {
		//Initialize Select2 Elements
		$(".select2").select2();

		// set the filter combobox to select the first item
		$('#genFilter option:nth-child(1)').remove();
		setSelecteFirst('#genFilter');

		$('#courseFilter option:nth-child(1)').remove();
		setSelecteFirst('#courseFilter');

		// collapse box on btn cancel clicked
		$("#btncancel").click(function() {

			$("#btn-collapse").click();
			$("#change-label").click();

		});
	});
</script>
</html>



