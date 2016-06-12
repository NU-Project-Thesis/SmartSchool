<%@page import="model.dto.Student"%>
<%
	if (session.getAttribute("stu") != null) {
		response.sendRedirect("../index.jsp");
	}
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">

<title>HRD | Center</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link type="text/css" rel="stylesheet" href="sweetalert/sweetalert.css" />

<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="dist/css/bootstrapValidator.css" />


<!-- <script src="js/jquery.js"></script> -->
<!-- -->
<style>
#li1 {
	margin-top: 6px;
	color: white;
}

@media ( max-width :304px) {
	#title {
		font-size: 8px;
	}
}

@media ( max-width :44px) {
	#title {
		font-size: 13px;
	}
}

@media ( max-width :561px) {
	#title {
		font-size: 17px;
	}
}

@media ( max-width :586px) {
	#title {
		font-size: 17px;
	}
}

@media ( max-width :597px) {
	#title {
		font-size: 17px;
	}
}

@media ( max-width :243px) {
	#title {
		font-size: 15px;
	}
	.form-control {
		width: 443px;
	}
}

body {
	background-color: #383737;
}

#title {
	color: white;
}

.panel-body {
	background-color: #383737;
	color: white;
	border-color: #656D78;
}

.panel {
	border-color: #656D78;
}

ul li a {
	margin-left: -15px;
}
</style>

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"
		style="background-color: #4AAF51;">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header" style="background-color: #4AAF51;">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"> <label
					style="margin-top: 6px; color: white;">HRD Management</label>
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<form id="defaultForm" method="post" action="javascript:;">
					<ul class="nav navbar-nav navbar-right">

						<li><a> <label style="color: white; margin-top: 8px;">Email:</label>
						</a></li>
						<li><a> <input type="email" class="form-control"
								placeholder="Enter email" name="usrname" id="usrname" />
						</a></li>
						<li><a> <label style="color: white; margin-top: 8px;">Password:</label>
						</a></li>
						<li><a> <input type="password" class="form-control"
								placeholder="Enter password" name="password" id="psw" />
						</a></li>
						<li><a>

								<button type="submit" id="login" class="btn btn-info">Sig
									In</button>

						</a></li>

					</ul>
				</form>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Header Carousel -->
	<header id="myCarousel" class="carousel slide">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<div class="fill" style="background-image: url('img/im1.jpg');"></div>
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<div class="fill" style="background-image: url('img/im2.jpg');"></div>
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<div class="fill" style="background-image: url('img/im3.jpg');"></div>
				<div class="carousel-caption"></div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</header>

	<!-- Page Content -->
	<div class="container">

		<!-- Marketing Icons Section -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header" style="border-color: #656D78;">
					<img src="img/logo.png" height="80px" /><label id="title">Korea
						Software HRD Center </label>
				</h1>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading"
						style="background-color: #383737; color: #7EB446; border-color: #656D78;">
						<h4>
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span><b>
								ABOUT US</b>
						</h4>
					</div>
					<div class="panel-body" style="border-color: #656D78;">
						<p>Korea Software HRD Center is an IT academy for training SW
							professionals established by Korea International Cooperation
							Agency (KOICA) and Webcash Co., Ltd in April, 2013. Our mission
							is to train SW experts, provide job opportunities for them, and
							improve SW technologies in Cambodia.</p>

					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading"
						style="background-color: #383737; color: #7EB446; border-color: #656D78;">
						<h4>
							<span class=" glyphicon glyphicon-phone-alt"></span><b>
								CONTACT US</b>
						</h4>
					</div>
					<div class="panel-body">
						<p>Address: #12, St 323, Sangkat Boeung Kak II, KhanToul Kork,
							Phnom Penh, Cambodia. Tel: (855)23 99 13 14 (855)77 77 12 36
							(Khmer, English) (855)15 4 5555 2 (Khmer, English) (855)17 52 81
							69(Korean, English) Email: info.kshrd@gmail.com
							phirum.gm@gmail.com</p>


					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading"
						style="background-color: #383737; color: #7EB446; border-color: #656D78;">
						<h4>
							<span class="glyphicon glyphicon-log-out"></span> <b>FOLLOW
								US ON FACEBOOK</b>
						</h4>
					</div>
					<div class="panel-body">
						<p>Address: #12, St 323, Sangkat Boeung Kak II, KhanToul Kork,
							Phnom Penh, Cambodia. Tel: (855)23 99 13 14 (855)77 77 12 36
							(Khmer, English) (855)15 4 5555 2 (Khmer, English) (855)17 52 81
							69(Korean, English) Email: info.kshrd@gmail.com
							phirum.gm@gmail.com</p>


					</div>
				</div>
			</div>
		</div>
		<hr style="border-color: #656D78;">
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p style="color: white;">Copyright &copy; 2015 Korea Software
						HRD Center. All right reserved.</p>
				</div>
			</div>
		</footer>

	</div>
	<script type="text/javascript" src="vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>
	<script type="text/javascript">
	/* $(document).ready(function() {
    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            /* usrname: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'The username is required and can\'t be empty'
                    },
                    remote: {
                        url: 'remote2.php'
                    },
                    different: {
                        field: 'password',
                        message: 'The username and password can\'t be the same as each other'
                    }
                }
            }, 
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required and can\'t be empty'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    },
                    remote: {
                        url: 'remote2.php'
                    }
                }
            },
			email: {
                validators: {
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and can\'t be empty'
                    },
                    different: {
                        field: 'username',
                        message: 'The password can\'t be the same as username'
                    },
                    callback: {
                        callback: function(value, validator) {
                            // Check the password strength
                            if (value.length < 6) {
                                return {
                                    valid: false,
                                    message: 'The password must be more than 6 characters'
                                }
                            }

                            if (value === value.toLowerCase()) {
                                return {
                                    valid: false,
                                    message: 'The password must contain at least one upper case character'
                                }
                            }
                            if (value === value.toUpperCase()) {
                                return {
                                    valid: false,
                                    message: 'The password must contain at least one lower case character'
                                }
                            }
                            if (value.search(/[0-9]/) < 0) {
                                return {
                                    valid: false,
                                    message: 'The password must contain at least one digit'
                                }
                            }

                            return true;
                        }
                    }
                }
            }
        }
    }).on('success.form.bv', function(e) {
        // Prevent form submission
        e.preventDefault();
        login();
    });
}); */
</script>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- Script to Activate the Carousel -->
	<script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>
	<script type="text/javascript" src="sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript">

	$(function(){
		$('#login').on('click', function(){
			login();
		});
	});
	
	function login(){
			var data = {
					'email': $('#usrname').val(),
					'password': $('#psw').val()
			}
			$.post('studentLoginProcess.hrd', data, function(data){
				if(data==='Fail'){
					sweetAlert("Login failed!", "Invalid email or password!", "error");
				}else if(data==='Success'){
					//$(location).attr('href', '../index.jsp');
					window.location.href='../index.jsp';
				}else{
					sweetAlert("Login failed!", "This user has been droped!", "error");
				}
			});
		}
	</script>

</body>

</html>
