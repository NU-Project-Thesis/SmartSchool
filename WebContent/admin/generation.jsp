<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Generation</title>

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

	<!-- spinning -->
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
					<li class="active">Generation</li>
				</ol>
			</section>

			<!-- content body -->
			<section class="content">
				<div class="row">
					<section class="col-lg-12 connectedSortable ui-sortable"
						ng-app="genApp" ng-controller="genCtrl">
						<!-- generation -->
						<div class="box box-primary">
							<div class="box-header ui-sortable-handle" style="cursor: move;">
								<i class="ion ion-clipboard"></i>
								<h3 class="box-title">Generations</h3>
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
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th-list"></span>
											</div>
											<select class="form-control" id="limitEntry"
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
												placeholder="Search generation...">
										</div>
										<!-- /.input group -->
									</div>
								</div>
								<!-- end search -->

							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive">
								<div>
									<table class="table no-margin">
										<tr>
											<th>N&#186;</th>
											<th>Generation&nbsp;<a ng-click="sort_by('gen_name');"><i
													class="glyphicon glyphicon-sort"></i></a></th>
											<th>Start Date&nbsp;<a ng-click="sort_by('start_date');"><i
													class="glyphicon glyphicon-sort"></i></a></th>
											<th>End Date&nbsp;<a ng-click="sort_by('end_date');"><i
													class="glyphicon glyphicon-sort"></i></a></th>
											<th class="center">Finish</th>
										</tr>
										<tr
											ng-repeat="data in filtered = (list | filter:search | orderBy : predicate :reverse) | startFrom:(currentPage-1)*entryLimit | limitTo:entryLimit">
											<td>{{$index+1}}</td>
											<td><a href="#" ng-click="editUser(data.gen_id)"
												class="update" data-toggle="modal" id="editable-sample_new"
												title="Click to update" data-original-title="Update">{{data.gen_name}}</a></td>
											<td>{{data.start_date}}</td>
											<td>{{data.end_date}}</td>
											<td>
												<div class="form-group">
													<label style="display: block; text-align: center;">
														<button ng-click="changeState(data.gen_id, data.gen_name, data.is_finish)"
														class="btn btn-success" ng-disabled="data.is_finish==true" ng-show="data.is_finish==false"><i class="fa fa-check-circle"></i></button>
														<span class="label bg-red" ng-show="data.is_finish==true">Yes</span> 
													</label>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix no-border">
								<div class="box box-solid collapsed-box">
									<div class="box-header ui-sortable-handle"
										style="cursor: move;">
										<i class="fa fa-edit"></i>
										<h3 class="box-title" ng-show="edit">Add Generation</h3>
										<h3 class="box-title" ng-show="!edit">Update Generation</h3>
										<!-- change label -->
										<div class="box-tools pull-right" style="display: none;">
											<button class="btn btn-success btn-sm" data-widget="collapse"
												id="change-label" ng-click="loadData();">
												<i class="fa fa-plus"></i>
											</button>
										</div>
										<div class="box-tools pull-right">
											<button class="btn btn-primary btn-sm" data-widget="collapse"
												style="display: none;" id="genform-collapse">
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
										<form action="#" method="post" id="genform">
											<div class="row">
												<div class="col-md-4">
													<div class="form-group required">
														<label for="gen_name" class="control-label">Generation</label>
														<input type="text" class="form-control" name="gen_name"
															id="gen_name" placeholder="Generation"
															ng-model="generation" ng-focus="showStartDate=true">
													</div>
												</div>

												<div class="col-md-4" ng-show="showStartDate">
													<div class="form-group required">
														<label for="start_date" class="control-label">Start
															Date</label> <input type="text" class="form-control"
															name="start_date" id="start_date"
															placeholder="Click here to select date"
															ng-model="startdate" ng-focus="showEndDate=true"/>
													</div>
												</div>

												<div class="col-md-4" ng-show="showEndDate">
													<div class="form-group required">
														<label for="end_date" class="control-label">End
															Date</label> <input type="text" class="form-control"
															name="end_date" id="end_date"
															placeholder="Click here to select date"
															ng-model="enddate" />
													</div>
												</div>
											</div>
											<input type="hidden" ng-model="is_finish" />
											<div class="btn-group pull-right">
												<button type="button" class="btn btn-success" id="addGen"
													ng-disabled="error || incomplete" ng-click="save(edit)">Save</button>
												<button type="button" class="btn btn-danger" id="btncancel">Cancel</button>
											</div>
										</form>
									</div>
								</div>
								<!-- /.box-body -->

							</div>
						</div>
						<!-- end generation -->
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
		$("#btncancel").click(function() {

			$("#genform-collapse").click();
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
	});
</script>

<script type="text/javascript" src="js/angular/gen.js"></script>
</html>