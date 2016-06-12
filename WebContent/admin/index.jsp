<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SS | Dashboard</title>

<!-- include script -->
<%@ include file="include/head.jsp"%>
<!-- import script -->
<%@ include file="include/script.jsp"%>
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
				<h1>Dashboard</h1>
				<ol class="breadcrumb">
					<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">Dashboard</li>
				</ol>
			</section>

			<section class="content">

				<div class="row">
					<section class="col-lg-12 connectedSortable ui-sortable">
						<div class="box box-success">
							<div class="box-header">
								<h3 class="box-title"></h3>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
								</div>
							</div>
							<!-- box body -->
							<div class="box-body">
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<div style="max-width: 100%; text-align: center;">
												<img src="image/logohrd.png">
											</div>
										</div>
									</div>

									<div class="col-md-8">
										<div class="form-group">
											<div style="text-align: center;">
												<label class="control-label" style="text-align: center;">#12,
													St 323, Sangkat Boeung Kak II, Khan Toul Kork, Phnom Penh</label><br>
												<label class="control-label" style="text-align: center;">Tel:
													(855) 23 99 13 14, Fax (855) 23 99 14 15</label><br> <label
													class="control-label" style="text-align: center;">Email:
													info.kshrd@gmail.com, phirum.gm@gmail.com </label> <label
													class="control-label" style="text-align: center;">Website:
													www.kshrd.com.kh, Facebook:facebook.com/ksignhrd</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>

				<div class="row">
					<!-- calendar -->
					<section class="col-lg-8 connectedSortable ui-sortable">
						<div class="box box-success">
							<div class="box-header">
								<h3 class="box-title">Attendance</h3>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
								</div>
							</div>
							<!-- box body -->
							<div class="box-body no-padding">
								<!-- THE CALENDAR -->
								<div id="calendar"></div>
							</div>
						</div>
					</section>

					<!-- student summary -->
					<section class="col-lg-4 connectedSortable ui-sortable">
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">Student Summary</h3>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<!-- start each box -->
								<div class="info-box bg-aqua disabled color-palettet">
									<span class="info-box-icon"><i class="">1<sup>st</sup></i></span>
									<div class="info-box-content">
										<span class="info-box-text">1<sup>st</sup> Generation
										</span> <span class="info-box-number">48</span>
										<div class="progress">
											<div class="progress-bar" style="width: 48%"></div>
										</div>
										<div class="btn-group">
											<button type="button" class="btn btn-info btn-xs">
												Male <span class="badge">40</span>
											</button>
											<button type="button" class="btn btn-info btn-xs">
												Female <span class="badge">8</span>
											</button>
										</div>
									</div>
									<!-- /.info-box-content -->
								</div>
								<!-- end each box -->

								<!-- start each box -->
								<div class="info-box bg-green">
									<span class="info-box-icon"><i class="">2<sup>nd</sup></i></span>
									<div class="info-box-content">
										<span class="info-box-text">2<sup>nd</sup> Generation
										</span> <span class="info-box-number">68</span>
										<div class="progress">
											<div class="progress-bar" style="width: 68%"></div>
										</div>
										<div class="btn-group">
											<button type="button" class="btn btn-success btn-xs">
												Male <span class="badge">58</span>
											</button>
											<button type="button" class="btn btn-success btn-xs">
												Female <span class="badge">10</span>
											</button>
										</div>
									</div>
									<!-- /.info-box-content -->
								</div>
								<!-- end each box -->

								<!-- start each box -->
								<div class="info-box bg-orange disabled color-palette">
									<span class="info-box-icon"><i class="">3<sup>rd</sup></i></span>
									<div class="info-box-content">
										<span class="info-box-text">3<sup>rd</sup> Generation
										</span> <span class="info-box-number">60</span>
										<div class="progress">
											<div class="progress-bar" style="width: 60%"></div>
										</div>
										<div class="btn-group">
											<button type="button" class="btn btn-warning btn-xs">
												Male <span class="badge">52</span>
											</button>
											<button type="button" class="btn btn-warning btn-xs">
												Female <span class="badge">8</span>
											</button>
										</div>
									</div>
									<!-- /.info-box-content -->
								</div>
								<!-- end each box -->
							</div>
						</div>
					</section>
				</div>
			</section>
		</div>
		<!-- /.content-wrapper -->

		<!-- footer -->
		<%@ include file="include/footer.jsp"%>

		

		<script src="framework/plugins/fullcalendar/fullcalendar.min.js"
			type="text/javascript"></script>
	</div>
	<!-- ./wrapper -->
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
				events : 'listAttendance.hrd'
			});

		});
	</script>
</body>
</html>
