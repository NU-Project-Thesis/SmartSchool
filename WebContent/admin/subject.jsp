<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subject</title>

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
	<!-- code to copy -->
	<div id="spinner" class="spinner" style="display: none">
		<img id="img-spinner" src="image/ajax-loader.gif" alt="Loading" />
	</div>
	<!-- end copy -->
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
					<li class="active">Subject</li>
				</ol>
			</section>

			<!-- content body -->
			<section class="content">
				<div class="row">
					<!-- copy -->
					<section class="col-lg-12 connectedSortable ui-sortable"
						ng-app="subjectApp" ng-controller="subjectCtrl">
						<!-- subject -->
						<div class="box box-danger">
							<div class="box-header ui-sortable-handle" style="cursor: move;">
								<i class="ion ion-clipboard"></i>
								<h3 class="box-title">Subject</h3>
								<!-- copy -->
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
									<!-- copy -->
									<!-- search -->
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-search"></span>
											</div>
											<input type="text" class="form-control" name="search"
												id="search" ng-model="search" ng-change="filter()"
												placeholder="Search subject...">
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
											<!-- copy -->
											<th>N&#186;</th>
											<th>Subject&nbsp;<a ng-click="sort_by('sub_name');"><i
													class="glyphicon glyphicon-sort"></i></a></th>
											<th>Description&nbsp;<a
												ng-click="sort_by('description');"><i
													class="glyphicon glyphicon-sort"></i></a></th>
											<th class="center">Delete</th>
										</tr>
									</thead>
									<tbody>
										<!-- copy -->
										<tr
											ng-repeat="data in filtered = (list | filter:search | orderBy : predicate :reverse) | startFrom:(currentPage-1)*entryLimit | limitTo:entryLimit" ng-show="data.active==true">
											<td>{{$index+1}}</td>
											<td><a href="#" ng-click="editUser(data.sub_id)"
												class="update" data-toggle="modal" id="editable-sample_new"
												title="Click to update" data-original-title="Update">{{data.sub_name}}</a></td>
											<td>{{data.description}}</td>
											<td class="center">
												<div class="form-group">
													<label style="display: block; text-align: center;">
														<button ng-click="changeState(data.sub_id, data.sub_name, data.active)"
														type="button" class="btn btn-danger btn-md"
														><i class="fa fa-trash-o"></i></button> 
													</label>
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
										<!-- copy -->
										<h3 class="box-title" ng-show="edit">Add Subject</h3>
										<h3 class="box-title" ng-show="!edit">Update Subject</h3>
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
										<form action="#" method="post" id="addForm">
											<div class="row">
												<div class="col-md-4">
													<div class="form-group required">
														<label for="sub_name" class="control-label">Subject</label>
														<input type="text" class="form-control" name="sub_name"
															id="sub_name" placeholder="Subject" ng-model="sub_name" ng-required="true">
													</div>
												</div>

												<div class="col-md-8">
													<div class="form-group">
														<label for="sub_description">Description</label> <input
															type="text" class="form-control" name="sub_description"
															id="sub_description" placeholder="Subject Description"
															ng-model="description">
													</div>
												</div>
											</div>

											<!-- copy -->
											<input type="hidden" ng-model="active" />
											<div class="btn-group pull-right">
												<button type="button" class="btn btn-success" id="addGen"
													ng-click="save(edit)" ng-disabled="!sub_name.length">Save</button>
												<button type="button" class="btn btn-danger" id="btncancel">Cancel</button>
											</div>
										</form>
									</div>
									<!-- /.box-body -->

								</div>
							</div>
						</div>
						<!-- end subject -->
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

	});
	/* end document ready */
</script>

<script type="text/javascript" src="js/angular/subject.js"></script>
</html>