<!-- jQuery 2.1.4 -->
<script src="framework/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<!-- jQuery UI 1.11.4 -->
<!-- <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"
	type="text/javascript"></script> -->
<script src="js/jquery-ui.min.js" type="text/javascript"></script>

<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script type="text/javascript">
	$.widget.bridge('uibutton', $.ui.button);
</script>

<!-- Bootstrap 3.3.2 JS -->
<script src="framework/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>

<!-- Select2 -->
<script src="framework/plugins/select2/select2.full.min.js"
	type="text/javascript"></script>

<!-- InputMask -->
<script src="framework/plugins/input-mask/jquery.inputmask.js"
	type="text/javascript"></script>
<script
	src="framework/plugins/input-mask/jquery.inputmask.date.extensions.js"
	type="text/javascript"></script>
<script
	src="framework/plugins/input-mask/jquery.inputmask.extensions.js"
	type="text/javascript"></script>

<!-- Morris.js charts -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script> -->
<script src="js/raphael-min.js"></script>
<script src="framework/plugins/morris/morris.min.js"
	type="text/javascript"></script>

<!-- Sparkline -->
<script src="framework/plugins/sparkline/jquery.sparkline.min.js"
	type="text/javascript"></script>

<!-- SlimScroll 1.3.0 -->
<script src="framework/plugins/slimScroll/jquery.slimscroll.min.js"
	type="text/javascript"></script>

<!-- iCheck 1.0.1 -->
<script src="framework/plugins/iCheck/icheck.min.js"
	type="text/javascript"></script>

<!-- FastClick -->
<script src="framework/plugins/fastclick/fastclick.min.js"
	type="text/javascript"></script>

<!-- AdminLTE App -->
<script src="framework/dist/js/app.min.js" type="text/javascript"></script>

<!-- jvectormap -->
<script
	src="framework/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"
	type="text/javascript"></script>
<script
	src="framework/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"
	type="text/javascript"></script>

<!-- jQuery Knob Chart -->
<script src="framework/plugins/knob/jquery.knob.js"
	type="text/javascript"></script>

<!-- daterangepicker -->
<script src="framework/plugins/daterangepicker/moment.min.js"
	type="text/javascript"></script>
<script src="framework/plugins/daterangepicker/daterangepicker.js"
	type="text/javascript"></script>

<!-- datepicker -->
<script src="framework/plugins/datepicker/bootstrap-datepicker.js"
	type="text/javascript"></script>

<!-- jquery searchable combobox -->
<script src="js/jquery-searchable-combobox.js" type="text/javascript"></script>

<!-- sweet alert -->
<script src="js/sweetalert.min.js"></script>
<!--angular-->
<script type="text/javascript" src="js/angular.min.js"></script>
<script type="text/javascript" src="js/ui-bootstrap-tpls-0.10.0.min.js"></script>
<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>
<script type="text/javascript">
	function logout() {
		swal({
			title : "Are you sure want to log out?",
			//text : "You will not be able to recover this imaginary file!",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "Logout",
			closeOnConfirm : false
		}, function() {
			/* swal("Deleted!", "Your imaginary file has been deleted.",
					"success"); */
			$.post('LogOutStudent.hrd', function(data) {
				if (data == "Success") {
					window.location.href = 'student/index.jsp';
				}
			});
		});
	}

	$(function() {
		$('#changePasswordForm')
				.bootstrapValidator(
						{
							message : 'This value is not valid',
							feedbackIcons : {
								valid : 'glyphicon glyphicon-ok',
								invalid : 'glyphicon glyphicon-remove',
								validating : 'glyphicon glyphicon-refresh'
							},
							fields : {
								old_password : {
									validators : {
										notEmpty : {
											message : 'The password is required and can\'t be empty'
										},
										different : {
											field : 'username',
											message : 'The password can\'t be the same as username'
										},
										callback : {
											callback : function(value,
													validator) {
												// Check the password strength
												if (value.length < 6) {
													return {
														valid : false,
														message : 'The password must be more than 6 characters'
													}
												}

												if (value === value
														.toLowerCase()) {
													return {
														valid : false,
														message : 'The password must contain at least one upper case character'
													}
												}
												if (value === value
														.toUpperCase()) {
													return {
														valid : false,
														message : 'The password must contain at least one lower case character'
													}
												}
												if (value.search(/[0-9]/) < 0) {
													return {
														valid : false,
														message : 'The password must contain at least one digit'
													}
												}

												return true;
											}
										}
									}
								},
								new_password : {
									validators : {
										notEmpty : {
											message : 'The password is required and can\'t be empty'
										},
										different : {
											field : 'username',
											message : 'The password can\'t be the same as username'
										},
										identical : {
											field : 'confirm_password',
											message : 'The password and its confirm are not the same'
										},
										callback : {
											callback : function(value,
													validator) {
												// Check the password strength
												if (value.length < 6) {
													return {
														valid : false,
														message : 'The password must be more than 6 characters'
													}
												}

												if (value === value
														.toLowerCase()) {
													return {
														valid : false,
														message : 'The password must contain at least one upper case character'
													}
												}
												if (value === value
														.toUpperCase()) {
													return {
														valid : false,
														message : 'The password must contain at least one lower case character'
													}
												}
												if (value.search(/[0-9]/) < 0) {
													return {
														valid : false,
														message : 'The password must contain at least one digit'
													}
												}

												return true;
											}
										}
									}
								},
								confirm_password : {
									validators : {
										notEmpty : {
											message : 'The password is required and can\'t be empty'
										},
										different : {
											field : 'username',
											message : 'The password can\'t be the same as username'
										},
										identical : {
											field : 'new_password',
											message : 'The password and its confirm are not the same'
										},
										callback : {
											callback : function(value,
													validator) {
												// Check the password strength
												if (value.length < 6) {
													return {
														valid : false,
														message : 'The password must be more than 6 characters'
													}
												}

												if (value === value
														.toLowerCase()) {
													return {
														valid : false,
														message : 'The password must contain at least one upper case character'
													}
												}
												if (value === value
														.toUpperCase()) {
													return {
														valid : false,
														message : 'The password must contain at least one lower case character'
													}
												}
												if (value.search(/[0-9]/) < 0) {
													return {
														valid : false,
														message : 'The password must contain at least one digit'
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
					changePassword();
				});
	});

	function changePassword() {
		var data = {
			'old_password' : $('#old_password').val(),
			'new_password' : $('#new_password').val()
		}

		$.post('changeStudentPassword.hrd', data, function(d) {
			if (d === 'Success') {
				swal("Congratulation!", "Your password has been changed!",
						"success");
				changePasswordForm.reset();
				$('#changePasswordForm').data('bootstrapValidator').resetForm(
						true);
				closeChangePassword.click();
			} else {
				swal("Error!", "Old password didn't matched!", "error");
			}
		});
	}
</script>