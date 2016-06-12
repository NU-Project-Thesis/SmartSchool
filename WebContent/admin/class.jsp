<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Class</title>

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
					Study <small>Management</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li><a href="#"><i class="fa fa-credit-card"></i> Study
							Management</a></li>
					<li class="active">Class</li>
				</ol>
			</section>

			<!-- content body -->
			<section class="content">
				<div class="row">
					<section class="col-lg-12 connectedSortable ui-sortable"
						ng-app="classApp" ng-controller="classCtrl">

						<!-- class -->
						<div class="box box-warning">
							<div class="box-header ui-sortable-handle" style="cursor: move;">
								<i class="ion ion-clipboard"></i>
								<h3 class="box-title">Class</h3>
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
												ng-model="courseFilter">
												<option value="0">All Course</option>
												<option
													ng-repeat="c in filtered = (course | filter:{gen_id:genFilter} | orderBy:cou_name)"
													value="{{c.cou_id}}">{{c.cou_name}}</option>
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
												placeholder="Search class...">
										</div>
										<!-- /.input group -->
									</div>
								</div>
								<!-- end search -->

							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive">
								<table class="table no-margin">
									<thead>
										<tr>
											<th>N&#186;</th>
											<th>Class&nbsp;<a ng-click="sort_by('class_name');"><i
													class="glyphicon glyphicon-sort"></i></a></th>
											<th>Course&nbsp;<a ng-click="sort_by('cou_name');"><i
													class="glyphicon glyphicon-sort"></i></a></th>
											<th>Generation&nbsp;<a ng-click="sort_by('gen_name');"><i
													class="glyphicon glyphicon-sort"></i></a></th>
											<th class="center">Deactivate</th>
										</tr>
									</thead>
									<tbody>
										<tr
											ng-repeat="data in filtered = (list | filter:{class_name:search,gen_id:genFilter,cou_id:courseFilter} | orderBy : predicate :reverse) | startFrom:(currentPage-1)*entryLimit | limitTo:entryLimit">

											<td>{{$index+1}}</td>
											<td>
												<span ng-show="data.active==true"><a href="#" ng-click="editUser(data.class_id)"
												class="update" data-toggle="modal" id="editable-sample_new"
												title="Click to update" data-original-title="Update">{{data.class_name}}</a></span>
												<span ng-show="data.active==false">{{data.class_name}}</span>
											</td>
											<td>{{data.cou_name}}</td>
											<td>{{data.gen_name}}</td>
											<td>
												<div class="center">
													<button class="btn btn-success"
														ng-click="changeState(data.class_id, data.class_name, data.active)"
														ng-show="data.active==true">
														<i class="fa fa-check-circle"></i>
													</button>
													<span class="label bg-red" ng-show="data.active==false">Yes</span>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix no-border">
								<div class="box box-solid collapsed-box">
									<div class="box-header ui-sortable-handle"
										style="cursor: move;">
										<i class="fa fa-edit"></i>
										<h3 class="box-title" ng-show="edit">Add Class</h3>
										<h3 class="box-title" ng-show="!edit">Update Class</h3>
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
									</div>
									<div class="box-body border-radius-none" style="display: none;">
										<form method="post" id="addForm">
											<div class="row">
												<div class="col-md-4">
													<div class="form-group required">
														<label for="clGen" class="control-label">Generation</label>
														<select id="listGenClass" class="form-control"
															name="clGen" ng-model="gen_Filter"
															ng-change="addCourse()">
															<option ng-repeat="g in activeGen" value="{{g.gen_id}}">{{g.gen_name}}</option>
														</select>
													</div>
												</div>

												<div class="col-md-4">
													<div class="form-group required">
														<label for="clCourse" class="control-label">Course</label>
														<select class="form-control" name="clCourse" id="clCourse"
															ng-model="cou_id">
															<!-- <option
															ng-repeat="cou in filtered = (course | filter:{gen_id:gen_Filter} | orderBy:cou_name)"
															value="{{cou.cou_id}}">{{cou.cou_name}}</option> -->
														</select>
													</div>
												</div>

												<div class="col-md-4">
													<div class="form-group required">
														<label for="class_name" class="control-label">Class</label>
														<input type="text" class="form-control" name="class_name"
															id="class_name" ng-model="class_name" placeholder="Class" />
													</div>
												</div>
											</div>
											<input type="hidden" ng-model="status" />
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
						<!-- end class -->
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
<!-- script -->
<script type="text/javascript">
	/* document ready */
	$(function() {
		// collapse box on btn cancel clicked
		$("#btncancel").click(function() {

			$("#btn-collapse").click();
			$("#change-label").click();

		});

		// initialize date picker
		$("#start_date").datepicker();
		$("#end_date").datepicker();

		$("#cou_start_date").datepicker();
		$("#cou_end_date").datepicker();

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
		/* course */
		/* add generation list to combobox for course*/
		// remove first item from combobox generation
		$('#genFilter option:nth-child(1)').remove();
		$('#courseFilter option:nth-child(1)').remove();
		// set select first item
		setSelecteFirst('#genFilter');
		setSelecteFirst('#courseFilter');
		//listGenActive();
	});
	/* end document ready */
</script>

<script type="text/javascript" src="js/angular/class.js"></script>
</html>