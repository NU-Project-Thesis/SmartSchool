<!DOCTYPE html>
<%
	if (session.getAttribute("user") != null) {
		response.sendRedirect("../admin/index.jsp");
	}
%>
<html >

    <head>

        <meta charset="utf-8">
      	<title>Login</title>
        <!-- CSS -->
		<link type="text/css" href="assets/bootstrap/css/bootstrap.min"/>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
	
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" href="dist/css/bootstrapValidator.css"/>
		<link type="text/css" rel="stylesheet" href="sweetalert/sweetalert.css"/>
		
        <script type="text/javascript" src="vendor/jquery/jquery.min.js"></script>
    	<script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
    	<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>
    <style>
    #label2{
	  padding-top:7px;
	   }
    label{
	  color:black;
	  font-size:15px;
	   }
	   #hrd{
	    font-size:28px;
	   }
	   #header{ 
	   font-size:18px;
	    }
 </style>
	</head>
 <body style="overflow: hidden;">
<!-- Top content -->
        <div class="top-content">
        	<div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <strong id="hrd"></strong><h1>Smart School</h1>
                           </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        		    <img src="img/hrd_logo.png"  ><strong id="header">&nbsp;&nbsp;&nbsp;&nbsp;Account Sign in</strong>
                            		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key" style="color:azure;"></i>
                        		</div>
                            </div>
                            <div class="form-bottom" id="content">
			              <div class="modal-body" style="padding:40px 50px;">
                              <form role="form" id="defaultForm" method="post"  action="javascript:;"><!--Form Control -->
                                  <div class="form-group">
                                        <label for="usrname"><span class="glyphicon glyphicon-user" ></span> Email</label>
                                      <input type="text" class="form-control" id="usrname" placeholder="Enter email"  name="email">
                                  </div>
                           <div class="form-group">
                             <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
                             <input type="password" class="form-control" id="psw" placeholder="Enter password" name="">
                           </div>
                           <div class="checkbox" style="display: none;">
                            <label><input type="checkbox" value="" checked>Remember me</label>
                           </div>
                       <button type="submit" class="btn btn-success btn-block" id="btnSignin"><span class="glyphicon glyphicon-off"></span> SigIn</button>
                       </form>
                             </div>
			             </div><!--form-bottom-->
                      </div>
            </div><!-- end row -->
                  
                </div><!--end container -->
            </div><!--end inner-bg --> 
            
        </div><!--End Top Content-->
		
<!--script validators From Control -->
<script type="text/javascript">
$(document).ready(function() {
    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
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
});
</script>
  
        <!-- Javascript load Image -->
     <script src="assets/js/jquery.backstretch.min.js"></script>-->
        <script src="assets/js/scripts.js"></script>
         <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
    <script type="text/javascript" src="sweetalert/sweetalert.min.js"></script>
 	<script type="text/javascript">
		function login(){
			var data = {
					'email': $('#usrname').val(),
					'password': $('#psw').val()
			}
			$.post('userLoginProcess.hrd', data, function(data){
				if(data==='Fail'){
					sweetAlert("Login failed!", "Invalid email or password!", "error");
					$('#btnSignin').removeAttr("disabled");
				}else if(data==='Success'){
					//$(location).attr('href', '../index.jsp');
					window.location.href='../admin/index.jsp';
				}else{
					sweetAlert("Login failed!", "This user has been droped!", "error");
					
				}
			});
		}
	</script> 
    </body>

</html>