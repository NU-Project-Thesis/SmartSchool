<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendance</title>

<!-- include script -->
<%@ include file="include/head.jsp"%>
<style type="text/css">
iframe {
	/* border: none; */
	width: 100% !important;
	height: 500px !important;
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
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="padding-top: 50px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Attendance <small>Management</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">Attendance</li>
				</ol>
			</section>

			<!-- content body -->
			<section class="content" id="attendanceCtrl" ng-app="attendanceApp"
				ng-controller="attendanceCtrl">
				<!-- Trigger the modal with a button -->
				<button type="button" class="btn btn-info btn-lg" id="openmodal"
					data-toggle="modal" style="display: none;" data-target="#myModal">Open
					Modal</button>

				<!-- Modal -->
				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button id="close" type="button" class="close"
									data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Attendance</h4>
							</div>
							<div class="modal-body">
								<form action="javascript:;" id="addForm">
									<div class="row">

										<div class="col-md-4">
											<div class="form-group required">
												<label class="control-label">Date</label> <input
													class="form-control" type="text" id="att_date"
													placeholder="Select date">
											</div>
										</div>

										<div class="col-md-4">
											<div class="form-group required">
												<label class="control-label">Generation</label> <select
													class="form-control" id="gen_id" name="gen_id"
													ng-model="genFilter">
													<option ng-repeat="g in activeGen" value="{{g.gen_id}}">{{g.gen_name}}</option>
												</select>
											</div>
										</div>

										<div class="col-md-4">
											<div class="form-group required">
												<label class="control-label">Course</label> <select
													class="form-control" id="cou_id" name="cou_id"
													ng-model="courseFilter">
													<option
														ng-repeat="c in filtered = (activeCourse | filter:{gen_id:genFilter} | orderBy:cou_name)"
														value="{{c.cou_id}}">{{c.cou_name}}</option>
												</select>
											</div>
										</div>
									</div>

									<!-- shift -->
									<div class="form-group required">
										<label class="control-label">Shift</label>
										<div class="form-inline">
											<label> <input id="am" class="flat-red" type="radio"
												name="shift" value="am"> Morning
											</label> &nbsp; <label> <input id="pm" class="flat-red"
												type="radio" name="shift" value="pm"> Afternoon
											</label>
										</div>
									</div>

									<div class="form-group required">
										<label class="control-label">Student</label> <select
											id="stu_id" class="form-control select2" multiple="multiple"
											data-placeholder="Select students">
											<option
												ng-repeat="stu in filtered = (student | orderBy:first_name)"
												value="{{stu.stu_id}}">{{stu.first_name}}
												{{stu.last_name}}</option>
										</select>
									</div>

									<div class="form-group">
										<label class="control-label">Description</label>
										<select class="form-control" id="description">
											<option value="Permission">Permission</option>
											<option value="No Permission">No Permission</option>
											<option value="Late">Late</option>
										</select>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<!-- <button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button> -->
								<div class="btn-group pull-right">
									<button type="button" class="btn btn-success" id="addAtten"
										ng-click="save(edit)">Save</button>
									<button type="button" class="btn btn-danger" id="btncancel"
										data-dismiss="modal">Cancel</button>
								</div>
							</div>

						</div>

					</div>
				</div>
				<div class="row">
					<section class="col-lg-8 connectedSortable ui-sortable">
						<!-- staff -->
						<div class="box box-primary">
							<div class="box-body no-padding">
								<!-- THE CALENDAR -->
								<div id="calendar"></div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- end staff list -->

					</section>

					<section class="col-lg-4 connectedSortable ui-sortable">
						<!-- staff -->
						<div class="box box-primary">
							<div class="box-body">
								<div class="box-header">
									<i class="ion ion-clipboard"></i>
									<h3 class="box-title">Daily Attendance</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<ul class="todo-list">
										<li ng-repeat="data in list">
											<!-- drag handle --> <span class="handle"> <i
												class="fa fa-ellipsis-v"></i> <i class="fa fa-ellipsis-v"></i></span>
											<!-- checkbox --> <!-- todo text --> <span class="text">{{data.first_name}}
												{{data.last_name}}</span> <!-- Emphasis label --> <small
											class="label label-danger"><i class="fa fa-clock-o"></i>
												{{data.description}}</small> <!-- shift --> <small
											class="label label-warning"><i class="fa fa-clock-o"></i>
												{{data.shift}}</small>
										</li>

									</ul>
								</div>
								<!-- /.box -->
							</div>
							<!-- /.box-body -->
						</div>
						<!-- end staff list -->

					</section>

				</div>


				<!-- print attendance -->
				<div class="row">
					<section class="col-lg-12 connectedSortable ui-sortable">
						<!-- staff -->
						<div class="box box-primary">
							<div class="box-header ui-sortable-handle" style="cursor: move;">
								<i class="fa fa-book"></i>
								<h3 class="box-title">Attendance List</h3>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
								</div>
								<br> <br>

								<form class="form-inline" role="form">
									<!-- date -->
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Start Date</span>
											</div>
											<input type="text" class="form-control" name="start_date"
												id="start_date" placeholder="Select date">

											<div class="input-group-addon">
												<span>End Date</span>
											</div>
											<input type="text" class="form-control" name="end_date"
												id="end_date" placeholder="Select date">

											<div class="input-group-addon">
												<span>Create By</span>
											</div>
											<input type="text" class="form-control" name="create_by"
												id="create_by" placeholder="Full Name">

											<div class="input-group-btn">
												<button type="button" class="btn btn-warning"
													id="btn-preview">Preview</button>

											</div>
										</div>
									</div>
								</form>

								<!-- end form search -->
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
									<iframe id="box-preview"> </iframe>
								</div>
							</div>
						</div>
						<!-- end staff list -->

					</section>
				</div>

			</section>
		</div>
		<!-- /.content-wrapper -->
		<!-- /.content-wrapper -->

		<!-- footer -->
		<%@ include file="include/footer.jsp"%>
	</div>
	<!-- ./wrapper -->


	<!-- import script -->
	<%@ include file="include/script.jsp"%>
	<!-- fullCalendar 2.2.5 -->
	<!-- <script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"
		type="text/javascript"></script> -->
	<script src="framework/plugins/fullcalendar/fullcalendar.min.js"
		type="text/javascript"></script>
	<script type="text/javascript" src="js/angular/attendance.js"></script>
	<script type="text/javascript">
		/*
			jQuery document ready
		 */

		$(document)
				.ready(
						function() {

							$("#start_date").datepicker();
							$("#end_date").datepicker();

							$("#box-preview").hide();

							$('#btn-preview').on(
									'click',
									function() {
										$("#box-preview").show();
										$("#box-preview").attr(
												"src",
												"ReportAttendance.pdf?fromDate="+ $('#start_date').val() + "&toDate="+$('#end_date').val()+"&createBy="+$('#create_by').val());
									});

							// initialize multiple combobox
							$(".select2").select2();

							// initialize date picker
							$("#att_date").datepicker();

							//iCheck for checkbox and radio inputs
							$(
									'input[type="checkbox"].minimal, input[type="radio"].minimal')
									.iCheck(
											{
												checkboxClass : 'icheckbox_minimal-blue',
												radioClass : 'iradio_minimal-blue'
											});
							//Red color scheme for iCheck
							$(
									'input[type="checkbox"].minimal-red, input[type="radio"].minimal-red')
									.iCheck(
											{
												checkboxClass : 'icheckbox_minimal-red',
												radioClass : 'iradio_minimal-red'
											});
							//Flat red color scheme for iCheck
							$(
									'input[type="checkbox"].flat-red, input[type="radio"].flat-red')
									.iCheck({
										checkboxClass : 'icheckbox_flat-green',
										radioClass : 'iradio_flat-green'
									});

							var x;
							/*
								date store today date.
								d store today date.
								m store current month.
								y store current year.
							 */
							var date = new Date();
							var d = date.getDate();
							var m = date.getMonth();
							var y = date.getFullYear();

							/*
								Initialize fullCalendar and store into variable.
								Why in variable?
								Because doing so we can use it inside other function.
								In order to modify its option later.
							 */

							var calendar = $('#calendar')
									.fullCalendar(
											{
												/*
													header option will define our calendar header.
													left define what will be at left position in calendar
													center define what will be at center position in calendar
													right define what will be at right position in calendar
												 */
												header : {
													left : 'prev,next today',
													center : 'title',
													right : 'month,agendaWeek,agendaDay'
												},
												/*
													defaultView option used to define which view to show by default,
													for example we have used agendaWeek.
												 */
												defaultView : 'month',
												/*
													selectable:true will enable user to select datetime slot
													selectHelper will add helpers for selectable.
												 */
												selectable : true,
												selectHelper : true,
												/*
													when user select timeslot this option code will execute.
													It has three arguments. Start,end and allDay.
													Start means starting time of event.
													End means ending time of event.
													allDay means if events is for entire day or not.
												 */
												select : function(start, end,
														allDay) {
													if (start.add('days', 1)
															.date() != end
															.date())
														$scope.eventCal
																.fullCalendar('unselect');
													openmodal.click();

													// assign date to modal
													var d = new Date(start);
													d.setDate(d.getDate() - 1);
													$("#att_date").datepicker(
															"setDate", d);

													/*
														after selection user will be promted for enter title for event.
													 */

													/*
														if title is enterd calendar will add title and event into fullCalendar.
													 */
													/* if (title) {
														calendar.fullCalendar('renderEvent', {
															title : title,
															start : start,
															end : end,
															allDay : allDay
														}, true // make the event "stick"
														);
													} */
													calendar
															.fullCalendar('unselect');
												},
												/*
													editable: true allow user to edit events.
												 */
												editable : true,
												/*
													events is the main option for calendar.
													for demo we have added predefined events in json object.
												 */
												events : 'listAttendance.hrd',

												eventClick : function(calEvent,
														jsEvent, view) {

													var id = calEvent.title
															.split(' ');
													/* delete attendance */
													/*  del(id[0]); */
													angular.element(
															'#attendanceCtrl')
															.scope().del(id[0]);
													// change the border color just for fun
													$(this).css('border-color',
															'red');

												}
											});

						});
	</script>

</body>
</html>
