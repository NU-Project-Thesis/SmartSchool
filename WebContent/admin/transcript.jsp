<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transcript</title>

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
	height: 45px !important;
	-webkit-border-radius: 100% !important; /* Saf3+, Chrome */
	-moz-border-radius: 100%; /* for firefox */
	border-radius: 100% !important; /* Opera 10.5, IE 9 */
}

iframe{
	/* border: none; */
	width: 100% !important;
	height: 500px !important;
}
.form-group{
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
					Student <small>Documents</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">Documents</li>
				</ol>
			</section>

			<!-- content body -->
			<section class="content" ng-app="docApp" ng-controller="docCtrl">
				<div class="row">
					<section class="col-lg-12 connectedSortable ui-sortable">
						<!-- staff -->
						<div class="box box-primary">
							<div class="box-header ui-sortable-handle" style="cursor: move;">
								<i class="fa fa-book"></i>
								<h3 class="box-title">Transcript</h3>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
								</div>
								<br> <br>

								<!-- form search -->
								<form class="form-inline" role="form">
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
												ng-change="showClass=true" ng-model="courseFilter">
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
											<select class="form-control" id="classFilter" ng-change="showStudent=true"
												ng-model="classFilter">
												<option
													ng-repeat="c in filtered = (class_ | filter:{cou_id:courseFilter} | orderBy:class_name)"
													value="{{c.class_id}}">{{c.class_name}}</option>
											</select>
										</div>
										<!-- /.input group -->
									</div>
									<div class="form-group" ng-show="showStudent">
										<div class="form-inline">
											<div class="input-group">
												<select id="stu_id" class="form-control select2">
													<option value="0">Select Student</option>
													<option
														ng-repeat="data in filtered = (student | filter:{gen_id:genFilter,cou_id:courseFilter, class_id:classFilter} | orderBy : first_name)" value="{{data.stu_id}}">ID:
														{{data.stu_id}} Name: {{data.first_name}}
														{{data.last_name}}</option>
												</select>
												<div class="input-group-btn">
													<button type="button" class="btn btn-warning"
														id="btn-preview">Preview</button>
													<!-- <button type="button" class="btn btn-success"
														id="btn-print">Print</button> -->
												</div>
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

					<section class="col-lg-12 connectedSortable ui-sortable">
						<!-- staff -->
						<div class="box box-success">
							<div class="box-header ui-sortable-handle" style="cursor: move;">
								<i class="fa fa-book"></i>
								<h3 class="box-title">Certificate</h3>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
								</div>
								<br> <br>
								<!-- form search -->
								<div class="form-inline">
									<!-- generation -->
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Generation</span>
											</div>
											<select class="form-control" id="genFilter_"
												ng-change="showCourse_=true" ng-model="genFilter_">
												<option ng-repeat="g in gen" value="{{g.gen_id}}">{{g.gen_name}}</option>
											</select>
										</div>
										<!-- /.input group -->
									</div>

									<!-- course -->
									<div class="form-group" ng-show="showCourse_">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Course</span>
											</div>
											<select class="form-control" id="courseFilter_"
												ng-change="showClass_=true" ng-model="courseFilter_">
												<option
													ng-repeat="c in filtered = (course | filter:{gen_id:genFilter_} | orderBy:cou_name)"
													value="{{c.cou_id}}">{{c.cou_name}}</option>
											</select>
										</div>
										<!-- /.input group -->
									</div>

									<!-- class -->
									<div class="form-group" ng-show="showClass_">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Class</span>
											</div>
											<select class="form-control" id="classFilter_" ng-change="showStudent_=true"
												ng-model="classFilter_">
												<option
													ng-repeat="c in filtered = (class_ | filter:{cou_id:courseFilter_} | orderBy:class_name)"
													value="{{c.class_id}}">{{c.class_name}}</option>
											</select>
										</div>
										<!-- /.input group -->
									</div>
									<div class="form-group" ng-show="showStudent_">
										<div class="form-inline">
											<div class="input-group">
												<select id="stu_id_" class="form-control select2">
													<option value="0">Select Student</option>
													<option
														ng-repeat="data in filtered = (student | filter:{gen_id:genFilter_,cou_id:courseFilter_, class_id:classFilter_} | orderBy : first_name)" value="{{data.stu_id}}">ID:
														{{data.stu_id}} Name: {{data.first_name}}
														{{data.last_name}}</option>
												</select>
												<div class="input-group-btn">
													<button type="button" class="btn btn-warning"
														id="btn-preview_">Preview</button>
													<!-- <button type="button" class="btn btn-success"
														id="btn-print_">Print</button> -->
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<!-- <div class="form-inline">
									<div class="input-group">
										<select id="stu_id_" class="form-control select2">
											<option>1010</option>
										</select>
										<div class="input-group-btn">
											<button type="button" class="btn btn-warning"
												id="btn-preview_">Preview</button>
											<button type="button" class="btn btn-success" id="btn-print_">Print</button>
										</div>
									</div>
								</div> -->
								<!-- end form search -->
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
									<iframe id="box-preview_"> </iframe>
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
	<script type="text/javascript" src="js/angular/transcript.js"></script>
	<script type="text/javascript">
		$(function() {

			//Initialize Select2 Elements
			$(".select2").select2();
			
			// hide iframe
			$("#box-preview").hide();
			$("#box-preview_").hide();

			$('#btn-preview').on('click', function() {
				preview();
			});

			$('#btn-preview_').on('click', function() {
				preview_();
			});
		});

		function preview() {
			//$.post('reportTranscirpt.hrd', {id: $('#stu_id').val()}, function(data){
			/* OpenPopupCenter('reportTranscirpt.hrd?id=' + $('#stu_id').val(),
					"Transcript", 800, 768); */
			//});
			$("#box-preview").show();
			$("#box-preview").attr("src", "reportTranscirpt.pdf?id="+ $('#stu_id').val() + "&cou_id="+$('#courseFilter').val());
		}

		function preview_() {
			//$.post('reportTranscirpt.hrd', {id: $('#stu_id').val()}, function(data){
			/* OpenPopupCenter('reportCertificate.hrd?id=' + $('#stu_id_').val(),
					"Transcript", 768, 1024); */
			//});
			$("#box-preview_").show();
			$("#box-preview_").attr("src", "reportCertificate.pdf?id=" + $('#stu_id_').val() + "&cou_id="+$('#courseFilter_').val());
		}

		function OpenPopupCenter(pageURL, title, w, h) {
			var left = (screen.width - w) / 2;
			var top = (screen.height - h) / 4; // for 25% - devide by 4  |  for 33% - devide by 3
			var targetWin = window
					.open(
							pageURL,
							title,
							'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='
									+ w
									+ ', height='
									+ h
									+ ', top='
									+ top
									+ ', left=' + left);

		}
	</script>
</body>
</html>