<!-- Left side column. contains the logo and sidebar -->
<%@page import="model.dto.StaffDTO"%>
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">


		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<!-- <li class="header">User Options</li> -->
			<li><a href="index.jsp"> <i class="fa fa-dashboard"></i> <span>Dashboard</span>
			</a></li>
			<% 
				String pos = ((StaffDTO) session.getAttribute("user")).getPosition();
				if(pos.equals("Admin")){
				
			%>
			
			<li class="treeview"><a href="#"> <i class="fa fa-user"></i>
					<span>Student</span> <i class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="register.jsp"><i class="fa fa-circle"></i>
							Register</a></li>
					<li><a href="student_list.jsp"><i class="fa fa-circle"></i>
							Student List</a></li>
				</ul></li>

			<li class="treeview"><a href="#"> <i
					class="fa fa-credit-card"></i> <span>Study Management</span> <i
					class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="generation.jsp"><i class="fa fa-circle"></i>
							Generation</a></li>
					<li><a href="course.jsp"><i class="fa fa-circle"></i>
							Course</a></li>
					<li><a href="class.jsp"><i class="fa fa-circle"></i>
							Class</a></li>
					<li><a href="subject.jsp"><i class="fa fa-circle"></i>
							Subject</a></li>
				</ul></li>

			<li><a href="staff.jsp"> <i class="glyphicon glyphicon-user"></i>
					<span>Staff</span>
			</a></li>
			
			<li class="treeview"><a href="#"> <i class="glyphicon glyphicon-list-alt"></i>
					<span>Enroll</span> <i class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="staff_enroll.jsp"><i class="fa fa-circle"></i>
							Instructor Enroll</a></li>
					<li><a href="student_enroll.jsp"><i class="fa fa-circle"></i>
							Student Enroll</a></li>
				</ul></li>
			
			<li><a href="attendance.jsp"> <i class="fa fa-calendar"></i>
					<span>Attendance</span> <small class="label pull-right bg-red"></small>
			</a></li>
			
			<% } 
			
				if(pos.equals("Instructor")){
					
				
			%>
			<li><a href="score.jsp"> <i class="fa fa-pie-chart"></i> <span>Score</span>
			</a></li>
			
			<% }%>
			<% if(pos.equals("Admin")){ %>
			<li><a href="score_rule.jsp"> <i class="fa fa-pie-chart"></i> <span>Score</span>
			</a></li>
			<li><a href="result.jsp"> <i class="fa fa-bar-chart"></i> <span>Monthly Result</span>
			</a></li>
			<li><a href="transcript.jsp"> <i class="fa fa-book"></i> <span>Document</span>
			</a></li>
			
			<%} %>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>