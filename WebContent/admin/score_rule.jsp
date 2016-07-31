<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Score Management</title>
<style>
.ui-datepicker-calendar {
	display: none;
}

.form-group {
	margin-bottom: 10px !important;
}
</style>
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
					Score <small>Management</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">Score</li>
				</ol>
			</section>

			<!-- content body -->
			<section class="content">
				<div class="row">
					<section class="col-lg-12 connectedSortable ui-sortable"
						ng-app="scoreApp" ng-controller="scoreCtrl">
						<!-- staff -->
						<div class="box box-primary">
							<div class="box-header ui-sortable-handle" style="cursor: move;">
								<i class="fa fa-pie-chart"></i>
								<h3 class="box-title">Score Rule</h3>
								<br> <br>
								<!-- form search -->
								<div class="form-inline">
									<!-- generation -->
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Generation</span>
											</div>
											<select class="form-control" id="genFilter"
												ng-change="showCourse=true" ng-model="genFilter">
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
												ng-change="showTable=true" ng-model="courseFilter">
												<option
													ng-repeat="c in filtered = (course | filter:{gen_id:genFilter} | orderBy:cou_name)"
													value="{{c.cou_id}}">{{c.cou_name}}</option>
											</select>
										</div>
										<!-- /.input group -->
									</div>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
									<table class="table no-margin" ng-show="showTable">
										<thead>
											<tr>
												<th class="center">Grade&nbsp;<a
													ng-click="sort_by('grade');"><i
														class="glyphicon glyphicon-sort"></i></a></th>
												<th class="center">Min Score&nbsp;<a
													ng-click="sort_by('rank_lower');"><i
														class="glyphicon glyphicon-sort"></i></a></th>
												<th class="center">Max Score&nbsp;<a
													ng-click="sort_by('rank_top');"><i
														class="glyphicon glyphicon-sort"></i></a></th>
												<th class="center">Grade Detail&nbsp;<a
													ng-click="sort_by('detail_grade');"><i
														class="glyphicon glyphicon-sort"></i></a></th>
												<th class="center">Delete</th>
											</tr>
										</thead>
										<tbody>
											<tr
												ng-repeat="data in filtered = (list | filter:{'cou_id':courseFilter} | orderBy:'grade')">
												<td class="center"><a href="#" ng-click="editUser(data.rule_id)"
												class="update" data-toggle="modal" id="editable-sample_new"
												title="Click to update" data-original-title="Update">{{data.grade}}</a></td>
												<td class="center">{{data.rank_lower}}</td>
												<td class="center">{{data.rank_top}}</td>
												<td class="center">{{data.detail_grade}}</td>
												<td>
													<div class="center">
														<button ng-click="del(data.rule_id)"
															class="btn btn-danger btn-md">
															<i class="fa fa-trash-o"></i>
														</button>
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
										<h3 class="box-title" ng-show="edit">Add Score</h3>
										<h3 class="box-title" ng-show="!edit">Update Score</h3>
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
										<form action="#" method="post" id="addForm" name="addForm">

											<div class="row">
												<!-- generation -->
												<div class="col-md-3">
													<div class="form-group required">
														<label for="clGen" class="control-label">Generation</label>
														<select id="listGenClass" class="form-control"
															name="clGen" ng-model="gen_Filter" ng-required="true">
															<option ng-repeat="g in gen" value="{{g.gen_id}}">{{g.gen_name}}</option>
														</select>
													</div>
												</div>

												<!-- course -->
												<div class="col-md-3">
													<div class="form-group required">
														<label for="clCourse" class="control-label">Course</label>
														<select class="form-control" name="clCourse" id="clCourse" ng-required="true"
															ng-model="cou_id">
															<option
																ng-repeat="data in filtered = (course | filter:{gen_id:gen_Filter} | orderBy:cou_name)"
																ng-value="{{data.cou_id}}">{{data.cou_name}}</option>
														</select>
													</div>
												</div>
											</div>

											<div class="row">
												<!-- grade -->
												<div class="col-md-3">
													<div class="form-group required">
														<label for="grade" class="control-label">Grade</label> <input
															type="text" class="form-control" name="grade" id="grade"
															ng-model="grade" placeholder="Grade" ng-required="true" ng-pattern="/^$|^[A-Z]+$/" ng-maxlength="1">
													</div>
													<span  ng-show="addForm.grade.$invalid&&addForm.grade.$dirty " style="color:red">*Please input only uppercase single character</span>
													
												</div>
												
												<!-- rank_lower -->
												<div class="col-md-3">
													<div class="form-group required">
														<label for="rank_lower" class="control-label">Min
															Score</label>
															 <input type="text" class="form-control"
															name="rank_lower" id="rank_lower" ng-model="rank_lower" 
											ng-maxlength="3" ng-pattern="/^[0-9][0-9]?$|^100$/" 
															placeholder="Min Score" ng-required="true" ng-keypress="filterValue($event)"">
													</div>
													<span style="color:red" ng-show="addForm.rank_lower.$error.maxlength||addForm.rank_lower.$invalid&&addForm.rank_lower.$dirty">*Please input from 1-100,maximum 3 digits</span>
<!-- 													<span style="color:red" ng-show="addForm.rank_lower.$invalid">*Score can not have more than 3 digits</span> -->
												 <span ng-show="addForm.min.$error.lowerThan"> Min cannot exceed max.</span>
												
												</div>

												<!-- rank_top -->
												<div class="col-md-3">
													<div class="form-group required">
														<label for="rank_top" class="control-label">Max
															Score</label> <input type="text" class="form-control"
															name="rank_top" id="rank_top" ng-model="rank_top" ng-pattern="/^[0-9][0-9]?$|^100$/"
															placeholder="Max Score" ng-required="true"  ng-keypress="filterValue($event)" ng-maxlength="3">
															
													</div>
														<span style="color:red" ng-show="addForm.rank_top.$error.maxlength||addForm.rank_top.$invalid&&addForm.rank_top.$dirty">*Please input from 0-100,maximum 3 digits</span>
										
												</div>

												<!-- grade detail -->
												<div class="col-md-3">
													<div class="form-group required">
														<label for="detail_grade" class="control-label">Grade
															Detail</label> <input type="text" class="form-control"
															name="detail_grade" id="detail_grade"
															ng-model="detail_grade" placeholder="Grade Detail">
													</div>
												</div>
											</div>
											<br> <br>
											<div class="btn-group pull-right">
												<button type="button" class="btn btn-success" id="addGen"
													ng-disabled="error || incomplete || addForm.$invalid" ng-click="save(edit)" >Save</button>
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

	<!-- import script -->
	<%@ include file="include/script.jsp"%>

	<script type="text/javascript" src="js/angular/score_rule.js"></script>
	<script type="text/javascript">
	//validate min and max score
	
		$(function() {
		
			
			
			// initialize searchable combobox
			$(".select2").select2();

			// collapse box on btn cancel clicked
			$("#btncancel").click(function() {

				$("#btn-collapse").click();
				$("#change-label").click();

			});

		});
	</script>
</body>
</html>
