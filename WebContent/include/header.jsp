<%@page import="model.dto.Student"%>
<header class="main-header">

	<!-- Logo -->
	<a href="#" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini"><b>S</b>S</span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><img
			style="margin-top: -5px; margin-left: -10px; width: 180px; height: 35px;"
			src="dist/img/logo.png"></span>
	</a>

	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top" role="navigation">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>
		<!-- Navbar Right Menu -->
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- Messages: style can be found in dropdown.less-->
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="image/student/<%=((Student) session.getAttribute("stu")).getPhoto()%>"
						class="user-image" alt="User Image"> <span class="hidden-xs"><%=((Student) session.getAttribute("stu")).getFirst_name()%>
							<%=((Student) session.getAttribute("stu")).getLast_name()%></span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header"><img
							src="image/student/<%=((Student) session.getAttribute("stu")).getPhoto()%>"
							class="img-circle" alt="User Image">
							<p><%=((Student) session.getAttribute("stu")).getEmail()%>
								<small><%=((Student) session.getAttribute("stu")).getPhone().replace('_', ' ')%></small>
							</p></li>

						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="#" onclick="openModalPassword.click();" class="btn btn-default btn-flat">Change Password</a>
							</div>
							<div class="pull-right">
								<a href="#" class="btn btn-default btn-flat" onclick="logout()">Sign
									out</a>
							</div>
						</li>
					</ul></li>
				<!-- Control Sidebar Toggle Button -->
				<!-- <li><a href="#" data-toggle="control-sidebar"><i
						class="fa fa-gears"></i></a></li> -->
			</ul>
		</div>

	</nav>
</header>

<!-- change password modal -->
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" id="openModalPassword"
	data-toggle="modal" style="display: none;" data-target="#modalPassword">Open
	Modal</button>

<!-- Modal -->
<div id="modalPassword" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content" style="width: 50%; margin: 0 auto;">
			<form action="javascript:;" id="changePasswordForm"
				enctype="multipart/form-data">
				<div class="modal-header">
					<button id="close" type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Change Password</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group required">
								<label class="control-label">Old Password</label> <input
									name="old_password" class="form-control" type="password"
									id="old_password">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group required">
								<label class="control-label">New Password</label> <input
									name="new_password" class="form-control" type="password"
									id="new_password">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group required">
								<label class="control-label">Confirm Password</label> <input
									name="confirm_password" class="form-control" type="password"
									id="confirm_password">
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button> -->
					<div class="btn-group pull-right">
						<button type="submit" class="btn btn-success">Save</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal"
							id="closeChangePassword">Cancel</button>
					</div>
				</div>
			</form>
		</div>

	</div>
</div>