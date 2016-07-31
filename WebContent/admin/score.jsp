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
	<div class="wrapper" ng-app="scoreApp" ng-controller="scoreCtrl">

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
					<section class="col-lg-12 connectedSortable ui-sortable">
						<!-- staff -->
						<div class="box box-primary">
							<div class="box-header ui-sortable-handle" style="cursor: move;">
								<i class="fa fa-pie-chart"></i>
								<h3 class="box-title">Score List</h3>
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
												ng-model="genFilter" ng-change="showcourse=true">
												<option ng-repeat="data in per | unique:'gen_name'"
													ng-model="genid" value="{{data.gen_id}}">{{data.gen_name}}</option>
											</select>
										</div>
										<!-- /.input group -->
									</div>

									<!-- course -->
									<div class="form-group" ng-show="showcourse">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Course</span>
											</div>
											<select class="form-control" id="courseFilter"
												ng-change="showclass=true" ng-model="courseFilter">
												<option
													ng-repeat="data in per | unique:'cou_name'|filter:{'gen_id':genid}"
													ng-model="couid" value="{{data.cou_id}}">{{data.cou_name}}</option>
											</select>
										</div>
										<!-- /.input group -->
									</div>

									<!-- class -->
									<div class="form-group" ng-show="showclass">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Class</span>
											</div>
											<select class="form-control" id="classFilter"
												ng-change="showsub=true" ng-model="classFilter">
												<option
													ng-repeat="data in per | unique:'class_name'|filter:{'cou_id':couid}"
													value="{{data.class_id}}">{{data.class_name}}</option>
											</select>
										</div>
										<!-- /.input group -->
									</div>

									<!-- subject -->
									<div class="form-group" ng-show="showsub">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Subject</span>
											</div>
											<select class="form-control" ng-model="subFilter">
												<option
													ng-repeat="data in per | unique:'sub_name'|filter:{'class_id':classid}"
													value="{{data.sub_id}}">{{data.sub_name}}</option>
												<!-- <option ng-repeat="data in per | unique:'sub_name'|filter:{'class_id':classFilter}" value="sub_id">{{data.sub_name}}</option> -->
											</select>
										</div>
										<!-- /.input group -->
									</div>

									<!-- date -->
									<div class="form-group" ng-show="showsub">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Date</span>
											</div>
											<input ng-change="showbtn=true" type="text"
												class="form-control monthYearPicker" name="date" id="date"
												placeholder="Select date" ng-model="dateFilter">
										</div>
									</div>

									<!-- show -->
									<div class="form-group" ng-show="showbtn">
										<div class="input-group">
											<button id="btn-show" type="button" class="btn btn-success"
												ng-click="showStudentList(); showtable=true;">Show</button>
										</div>
										<!-- /.input group -->
									</div>
								</div>

								<!-- <div style="display: block; margin-top: 1%;"></div> -->

								<div class="form-inline">

									<!-- search -->
									<div class="form-group" ng-show="showtable">
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
									<table class="table no-margin" ng-show="showtable">
										<thead>
											<tr>
												<th>N&#186;</th>
												<th>Student ID&nbsp;<a ng-click="sort_by('stu_id');"><i
														class="glyphicon glyphicon-sort"></i></a></th>
												<th>Full Name&nbsp;<a ng-click="sort_by('first_name');"><i
														class="glyphicon glyphicon-sort"></i></a></th>
												<th class="center">Gender&nbsp;<a
													ng-click="sort_by('gender');"><i
														class="glyphicon glyphicon-sort"></i></a></th>
												<th class="center">Score&nbsp;<a
													ng-click="sort_by('score');"><i
														class="glyphicon glyphicon-sort"></i></a></th>
											</tr>
										</thead>
										<tbody>
											<tr
												ng-repeat="s in filtered = (studentScore | filter:{'class_id':classFilter, 'sub_id':subFilter} |  orderBy : predicate :reverse)">
												<td>{{$index+1}}</td>
												<td>{{s.stu_id}}</td>
												<td><a href="#" ng-click="editScore(s.score_id)"
													class="update" title="Click to update"
													data-original-title="Update">{{s.first_name}}
														{{s.last_name}}</a></td>
												<td class="center">{{s.gender}}</td>
												<td class="center">
													<!-- <!-- show input box if not score --> <!-- <div class="input-group" ng-show="s.score==''">
														<input id="score{{s.stu_id}}" type="text">
														<div class="input-group-btn">
															<button type="button" class="btn btn-success">Print</button>
														</div> 
													</div> --> <!-- show score if exist --> <span
													class="label label-success" ng-show="s.score!=''">{{s.score}}</span>
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

											<div class="form-inline">

												<!-- date -->
												<div class="form-group">
													<div class="input-group">
														<div class="input-group-addon">
															<span>Date</span>
														</div>
														<input type="text" class="form-control monthYearPicker"
															name="date_" id="date_" placeholder="Select date"
															ng-focus="showGen=true">
													</div>
												</div>
												<!-- generation -->
												<div class="form-group" ng-show="showGen">
													<div class="input-group">
														<div class="input-group-addon">
															<span>Generation</span>
														</div>
														<select class="form-control" id="genFilter_"
															ng-model="genFilter_" ng-change="showcourse_=true">
															<option ng-repeat="data in per | unique:'gen_name'"
																ng-model="genid_" value="{{data.gen_id}}">{{data.gen_name}}</option>
														</select>
													</div>
													<!-- /.input group -->
												</div>

												<!-- course -->
												<div class="form-group" ng-show="showcourse_">

													<div class="input-group">
														<div class="input-group-addon">
															<span>Course</span>
														</div>
														<select class="form-control" id="courseFilter_"
															ng-change="showclass_=true" ng-model="courseFilter_">
															<option
																ng-repeat="data in per | unique:'cou_name'|filter:{'gen_id':genid_}"
																ng-model="couid" value="{{data.cou_id}}">{{data.cou_name}}</option>
														</select>
													</div>
													<!-- /.input group -->
												</div>

												<!-- class -->
												<div class="form-group" ng-show="showclass_">
													<div class="input-group">
														<div class="input-group-addon">
															<span>Class</span>
														</div>
														<select class="form-control" id="classFilter_"
															ng-change="showsub_=true" ng-model="classFilter_">
															<option
																ng-repeat="data in per | unique:'class_name'| filter:{'cou_id':couid_}"
																value="{{data.class_id}}">{{data.class_name}}</option>
														</select>
													</div>
													<!-- /.input group -->
												</div>
												<!-- <div ng-init="showTable=true;showStudent();"></div> -->
												<!-- subject -->
												<div class="form-group" ng-show="showsub_">
													<div class="input-group">
														<div class="input-group-addon">
															<span>Subject</span>
														</div>
														<select class="form-control" id="sub_id">
															<option
																ng-repeat="data in per | unique:'sub_name'|filter:{'class_id':classid_}"
																value="{{data.sub_id}}">{{data.sub_name}}</option>
															<!-- <option ng-repeat="data in per | unique:'sub_name'|filter:{'class_id':classFilter_}" value="sub_id">{{data.sub_name}}</option> -->
														</select>
													</div>
													<!-- /.input group -->
												</div>

												<!-- query -->
												<div class="form-group" ng-show="showsub_">
													<div class="input-group">
														<button type="button" class="btn btn-success" id="list"
															ng-click="showList=true">Show</button>
													</div>
													<!-- /.input group -->
												</div>
											</div>
											<br> <br>
											<div class="table-responsive">
												<table class="table no-margin" ng-show="showList">
													<thead>
														<tr>
															<th>N&#186;</th>
															<th>Student ID&nbsp;<a ng-click="sort_by('stu_id');"><i
																	class="glyphicon glyphicon-sort"></i></a></th>
															<th>Full Name&nbsp;<a
																ng-click="sort_by('first_name');"><i
																	class="glyphicon glyphicon-sort"></i></a></th>
															<th>Gender&nbsp;<a ng-click="sort_by('gender');"><i
																	class="glyphicon glyphicon-sort"></i></a></th>
															<th>Score</th>
														</tr>
													</thead>
													<tbody>
														<tr
															ng-repeat="st in filtered = (studentNoScore | filter:{'class_id':classFilter_} | orderBy : predicate :reverse)">
															<td>{{$index+1}}</td>
															<td>{{st.stu_id}}</td>
															<td>{{st.first_name}} {{st.last_name}}</td>
															<td>{{st.gender}}</td>
															<td><input id="score{{st.stu_id}}" name="score[]"
																type="text" only-digits ng-required="true"
																ng-model="score"
																ng-pattern="/^[1-9][0-9]?$|^100$/"> <input
																type="hidden" name="id[]" value="{{st.stu_id}}"></td>
														</tr>
													</tbody>
												</table>
											</div>
											<br> <br>
											<div class="btn-group pull-right">
												<button type="button" class="btn btn-success" id="addGen"
													ng-click="save(edit)" ng-disabled="error || incomplete || addForm.$invalid">Save</button>
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

			<!-- Trigger the modal with a button -->
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
				id="openModal" data-target="#myModal" style="display: none;">Open
				Modal</button>

			<!-- Modal -->
			<div id="myModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Edit Score</h4>
						</div>
						<div class="modal-body">
							<form action="javascript:;" id="editScoreForm">
								<input type="hidden" id="stu_id">
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>Student: </label> <input type="text"
												class="form-control" id="stu_name" disabled="disabled">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group required">
											<label for="score" class="control-label">Score: </label> <input
												type="text" class="form-control" name="stu_score"
												id="stu_score">
										</div>
									</div>
								</div>


							</form>
						</div>
						<div class="modal-footer">
							<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
							<div class="btn-group pull-right">
								<button type="button" class="btn btn-success" id="updateScore"
									ng-click="saveUpdateScore()">Save</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal" id="btnclose">Cancel</button>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
		<!-- /.content-wrapper -->



		<!-- footer -->
		<%@ include file="include/footer.jsp"%>


	</div>
	<!-- ./wrapper -->

	<!-- import script -->
	<%@ include file="include/script.jsp"%>

	<script type="text/javascript" src="js/angular/score.js"></script>
	<script type="text/javascript">
		$(function() {
			// initialize searchable combobox
			$(".select2").select2();

			// collapse box on btn cancel clicked
			$("#btncancel").click(function() {

				$("#btn-collapse").click();
				$("#change-label").click();

			});

			$.fn.monthYearPicker = function(options) {
				options = $.extend({
					dateFormat : "MM yy",
					changeMonth : true,
					changeYear : true,
					showButtonPanel : true,
					showAnim : ""
				}, options);
				function hideDaysFromCalendar() {
					var thisCalendar = $(this);
					$('.ui-datepicker-calendar').detach();
					// Also fix the click event on the Done button.
					$('.ui-datepicker-close')
							.unbind("click")
							.click(
									function() {
										var month = $(
												"#ui-datepicker-div .ui-datepicker-month :selected")
												.val();
										var year = $(
												"#ui-datepicker-div .ui-datepicker-year :selected")
												.val();
										thisCalendar.datepicker('setDate',
												new Date(year, month, 1));
									});
				}
				$(this).datepicker(options).focus(hideDaysFromCalendar);
			}

			$('input.monthYearPicker').monthYearPicker();

		});
	</script>
</body>
</html>
