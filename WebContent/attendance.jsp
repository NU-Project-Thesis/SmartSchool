<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Attendance</title>
<%@include file="include/head.jsp"%>
<style>
.input-group .form-control {
	position: relative;
	z-index: 2;
	float: left;
	width: 100%;
	margin-bottom: 0;
	font-size: 16px;
}

.input-group .input-group-addon {
	background: #fff;
}

.input-group-addon:first-child {
	border-right: 0;
}

@media only screen and (min-width: 600px) {
	.col-m-2 {
		float: left;
	}
}
</style>
</head>
<body class="skin-green-light sidebar-mini fixed">
	<div class="wrapper">

		<%@include file="include/header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="include/left_side.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Dashboard</h1>
				<ol class="breadcrumb">
					<li><a href="attendance.jsp"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">Attendance</li>
				</ol>
			</section>

			<section class="content" ng-repeat="data in list">
				<div class="row">
					<section class="col-lg-12 connectedSortable ui-sortable">
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">Attendance</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="box-body no-padding">
									<!-- THE CALENDAR -->
									<div id="calendar"></div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</section>
		</div>

	</div>
	<!-- /.content-wrapper -->
	<!-- footer -->
	<%@include file="include/footer.jsp"%>

	<!-- /.control-sidebar -->
	<!-- Add the sidebar's background. This div must be placed -->
	<div class="control-sidebar-bg"></div>
	
	<!-- ./wrapper -->
	<%@include file="include/script.jsp"%>
	<script src="framework/plugins/fullcalendar/fullcalendar.min.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {

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

			var calendar = $('#calendar').fullCalendar({
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
				select : function(start, end, allDay) {
					/* if (start.add('days', 1).date() != end.date())
						$scope.eventCal.fullCalendar('unselect');
					openmodal.click();

					// assign date to modal
					var d = new Date(start);
					d.setDate(d.getDate() - 1);
					$("#att_date").datepicker("setDate", d); */

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
					calendar.fullCalendar('unselect');
				},
				/*
					editable: true allow user to edit events.
				 */
				editable : true,
				/*
					events is the main option for calendar.
					for demo we have added predefined events in json object.
				 */
				events : 'ListAttendanceById.hrd'

			});
		});
	</script>
</body>
</html>