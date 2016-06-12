<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enroll Management</title>

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
					Enroll <small>Management</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Enroll</li>
				</ol>
			</section>

			<!-- content body -->
			<section class="content">
				<div class="row">
					<section class="col-lg-12 connectedSortable ui-sortable">
						<!-- staff -->
						<div class="box box-primary">
							<div class="box-header ui-sortable-handle" style="cursor: move;">
								<i class="glyphicon glyphicon-user"></i>
								<h3 class="box-title">Staff Enrollment</h3>
								<div class="box-tools pull-right">
									<ul class="pagination pagination-sm inline">
										<li><a href="#">«</a></li>
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">»</a></li>
									</ul>
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
											<select class="form-control">
												<option>5</option>
												<option>10</option>
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
											<select class="form-control">
												<option>All</option>
												<option>1st Generation</option>
												<option>2nd Generation</option>
												<option>3rd Generation</option>
											</select>
										</div>
										<!-- /.input group -->
									</div>

									<!-- course -->
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Course</span>
											</div>
											<select class="form-control">
												<option>All</option>
												<option>Basic</option>
												<option>Advanced</option>
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
												id="search" placeholder="Search...">
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
												<th>Staff</th>
												<th>Subject</th>
												<th>Class</th>
												<th>Delete</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td><a href="pages/examples/invoice.jsp">Ly
														Pichponreay</a></td>
												<td>Java</td>
												<td>Battambang</td>
												<td class="center"><button class="btn btn-danger btn-md">
													<i class="fa fa-trash-o"></i>
												</button></td>
											</tr>
											<tr>
												<td>2</td>
												<td><a href="pages/examples/invoice.jsp">Heak
														Menghok</a></td>
												<td>Web</td>
												<td>Battambang</td>
												<td class="center"><button class="btn btn-danger btn-md">
													<i class="fa fa-trash-o"></i>
												</button></td>
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
										<h3 class="box-title">Add Staff Enrollment</h3>
										<div class="box-tools pull-right">
											<button class="btn btn-primary btn-sm" data-widget="collapse">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
									<div class="box-body border-radius-none" style="display: none;">
										<form action="#" method="post">

											<div class="row">
												<div class="col-md-4">
													<div class="form-group">
														<label for="sGen">Generation</label> <select
															class="form-control" name="sGen" id="sGen">

														</select>
													</div>
												</div>

												<div class="col-md-4">
													<div class="form-group">
														<label for="sCourse">Course</label> <select
															class="form-control" name="sCourse" id="sCourse">
															<option>Basic</option>
															<option>Advance</option>
														</select>
													</div>
												</div>

												<div class="col-md-4">
													<div class="form-group">
														<label for="sClass">Class</label> <select
															class="form-control" name="sClass" id="sClass">
															<option>Battambang</option>
															<option>Phnom Penh</option>
														</select>
													</div>
												</div>
											</div>

											<div class="row">
												<!-- staff -->
												<div class="col-md-4">
													<div class="form-group">
														<label>Staff</label> <select class="form-control"
															name="sStaff_id" id="sStaff_id">
															<option>Alabama</option>
															<option>Alaska</option>
															<option>California</option>
															<option>Delaware</option>
															<option>Tennessee</option>
															<option>Texas</option>
															<option>Washington</option>
														</select>
													</div>
												</div>

												<!-- subject -->
												<div class="col-md-4">
													<div class="form-group">
														<label>Subject</label> <select class="form-control"
															name="sSub_id" id="sSub_id">
															<option selected="selected">Alabama</option>
															<option>Alaska</option>
															<option>California</option>
															<option>Delaware</option>
															<option>Tennessee</option>
															<option>Texas</option>
															<option>Washington</option>
														</select>
													</div>
												</div>
											</div>

											<button type="button" class="btn btn-primary pull-right"
												id="addStaffEnroll">Add</button>
										</form>
									</div>
									<!-- /.box-body -->

								</div>
							</div>
						</div>
						<!-- end staff list -->

					</section>

					<!-- end staff enroll -->

					<section class="col-lg-12 connectedSortable ui-sortable">
						<!-- staff -->
						<div class="box box-success">
							<div class="box-header ui-sortable-handle" style="cursor: move;">
								<i class="glyphicon glyphicon-user"></i>
								<h3 class="box-title">Student Enrollment</h3>
								<div class="box-tools pull-right">
									<ul class="pagination pagination-sm inline">
										<li><a href="#">«</a></li>
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">»</a></li>
									</ul>
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
											<select class="form-control">
												<option>5</option>
												<option>10</option>
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
											<select class="form-control">
												<option>All</option>
												<option>1st Generation</option>
												<option>2nd Generation</option>
												<option>3rd Generation</option>
											</select>
										</div>
										<!-- /.input group -->
									</div>

									<!-- course -->
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Course</span>
											</div>
											<select class="form-control">
												<option>All</option>
												<option>Basic</option>
												<option>Advanced</option>
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
												id="search" placeholder="Search...">
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
												<th>Staff</th>
												<th>Subject</th>
												<th>Class</th>
												<th>Delete</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td><a href="pages/examples/invoice.jsp">Ly
														Pichponreay</a></td>
												<td>Java</td>
												<td>Battambang</td>
												<td class="center"><button class="btn btn-danger btn-md">
													<i class="fa fa-trash-o"></i>
												</button></td>
											</tr>
											<tr>
												<td>2</td>
												<td><a href="pages/examples/invoice.jsp">Heak
														Menghok</a></td>
												<td>Web</td>
												<td>Battambang</td>
												<td class="center"><button class="btn btn-danger btn-md">
													<i class="fa fa-trash-o"></i>
												</button></td>
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
										<h3 class="box-title">Add Student Enrollment</h3>
										<div class="box-tools pull-right">
											<button class="btn btn-success btn-sm" data-widget="collapse">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
									<div class="box-body border-radius-none" style="display: none;">
										<form action="#" method="post">

											<div class="row">
												<div class="col-md-3">
													<div class="form-group">
														<label for="sGen">Generation</label> <select
															class="form-control" name="sGen" id="sGen">

														</select>
													</div>
												</div>

												<div class="col-md-3">
													<div class="form-group">
														<label for="sCourse">Course</label> <select
															class="form-control" name="sCourse" id="sCourse">
															<option>Basic</option>
															<option>Advance</option>
														</select>
													</div>
												</div>

												<div class="col-md-3">
													<div class="form-group">
														<label for="sClass">Class</label> <select
															class="form-control" name="sClass" id="sClass">
															<option>Battambang</option>
															<option>Phnom Penh</option>
														</select>
													</div>
												</div>

												<div class="col-md-3">
													<div class="form-group">
														<label for="sSubject">Subject</label> <select
															class="form-control" name="sSubject" id="sSubject">
															<option>Alabama</option>
															<option>Alaska</option>
															<option>California</option>
															<option>Delaware</option>
															<option>Tennessee</option>
															<option>Texas</option>
															<option>Washington</option>
														</select>
													</div>
												</div>
											</div>
											<button type="button" class="btn btn-success pull-right"
												id="addStaffEnroll">Add</button>
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
<script type="text/javascript">
	$(function() {
		//Initialize Select2 Elements
		//$(".select2").select2();
	});
</script>
</html>



