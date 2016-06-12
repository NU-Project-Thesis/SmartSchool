/*declare app*/
var app = angular.module('studentApp', [ 'ui.bootstrap' ]);

/* filter */
app.filter('startFrom', function() {
	return function(input, start) {
		if (input) {
			start = +start; // parse to int
			return input.slice(start);
		}
		return [];
	};
});

/* app scope */
app
		.controller(
				'studentCtrl',
				function($scope, $http, $timeout) {

					$http.get('listStudent.hrd').success(function(data) {

						$scope.list = data;
						$scope.currentPage = 1; // current page
						$scope.entryLimit = 5; // max no of items to display in
												// a page
						$scope.filteredItems = $scope.list.length; // Initially
																	// for no
																	// filter
						$scope.totalItems = $scope.list.length;
						$scope.edit = true;
						$scope.error = false;
						$scope.incomplete = false;
						$scope.editid = 0;
						// re-style the pagination
						restylePG();
					});

					$scope.loadData = function() {
						$http.get('listStudent.hrd').success(function(data) {

							$scope.list = data;
							$scope.currentPage = 1; // current page
							$scope.entryLimit = $('#entryLimit').val(); // max
																		// no of
																		// items
																		// to
							// display in a page
							$scope.filteredItems = $scope.list.length; // Initially
																		// for
																		// no
							// filter
							$scope.totalItems = $scope.list.length;
							$scope.edit = true;
							$scope.error = false;
							$scope.incomplete = false;
							$scope.editid = 0;
							// re-style the pagination
							restylePG();
						});
					};

					/* set page for pagination */
					$scope.setPage = function(pageNo) {
						$scope.currentPage = pageNo; // current page

					};
					/* filter (search) */
					$scope.filter = function() {
						$timeout(function() {
							$scope.filteredItems = $scope.filtered.length;
						}, 10);
					};
					/* sort */
					$scope.sort_by = function(predicate) {
						$scope.predicate = predicate;
						$scope.reverse = !$scope.reverse;
					};

					$scope.editUser = function(id) {
						if ($("#collapse-status").attr('class') == "fa fa-plus")
							$("#btn-collapse").click();
						$scope.editid = id;
						if (id == 'new') {
							$scope.edit = true;
							$scope.incomplete = true;

						} else {
							$scope.edit = false;
							for (var i = 0; i < $scope.list.length; i++)
								if ($scope.list[i].stu_id == id)
									x = i;
							$('#stu_id').val(id);
							$('#id').val(id);
							$('#first_name').val($scope.list[x].first_name);
							$('#last_name').val($scope.list[x].last_name);
							$('#img').attr('src',
									'../image/student/' + $scope.list[x].photo);
							$('#hide_img').val($scope.list[x].photo);
							/* set value to gender field */
							if ($scope.list[x].gender == 'M') {
								$('#F').prop('checked', false);
								$('#M').prop('checked', true);
							} else {
								$('#M').prop('checked', false);
								$('#F').prop('checked', true);
							}

							$("#dob").datepicker("setDate",
									new Date($scope.list[x].dob));
							$('#last_name').val($scope.list[x].last_name);
							$('#email').val($scope.list[x].email);
							$('#password').val($scope.list[x].password);
							$('#address').val($scope.list[x].address);
							$('#phone').val($scope.list[x].phone);
							$('#race').val($scope.list[x].race);
							$('#social_id').val($scope.list[x].social_id);
							$('#father_name').val($scope.list[x].father_name);
							$('#father_phone').val($scope.list[x].father_phone);
							$('#mother_name').val($scope.list[x].mother_name);
							$('#mother_phone').val($scope.list[x].mother_phone);
						}
					};

					/* change status */
					$scope.changeState = function(e, status, first_name,
							last_name) {

						/* if student is already drop so return */
						if (status === 'drop') {
							swal("Warning!", "This student is already drop!");
							return;
						}

						/* confirm before change */
						swal(
								{
									title : "Warning!",
									text : "If you make change to this you will no longer to change again. To make sure please type the name of student to make confirm. '"
											+ first_name + " "+ last_name +"'",
									type : "input",
									showCancelButton : true,
									closeOnConfirm : false,
									animation : "slide-from-top",
									inputPlaceholder : "Write something"
								},
								function(inputValue) {
									if (inputValue === false)
										return false;
									if (inputValue !== (first_name + " "+ last_name)) {
										swal
												.showInputError("You need to write: "
														+ (first_name + " "+ last_name));
										$scope.loadData();
										return false;
									}
									if (inputValue === (first_name + " "+ last_name)) {
										var data = {
											'stu_id' : e,
											'status' : 'drop'
										};
										$("#spinner").show();
										$
												.post("updateStudentState.hrd",
														data)
												.success(
														function(data, status,
																headers) {
															if (data == "Success") {
																swal(
																		"Congratulation!",
																		first_name + " "+ last_name +" has been changed to drop!",
																		"success");
																$scope
																		.loadData();
																$("#spinner")
																		.hide();
															}
														});
									}

								});

					};

					$scope.save = function(e) {
						$("#spinner").show();
						var formData = new FormData($("#addForm")[0]);
						$.ajax({
							url : 'updateStudent.hrd',
							type : 'POST',
							data : formData,
							/* async : false, */
							cache : false,
							contentType : false,
							processData : false,
							success : function(data) {
								if (data == 'Success') {
									swal("Congratulation!",
											"Student has been updated!",
											"success");
									$('#addForm')[0].reset();
									// set image to default
									$('#img').attr('src',
											'../image/default-profile.png');
									addForm.reset();
									$("#btn-collapse").click();
									$scope.loadData();
								}
							},
							error : function() {
								swal("Error!", "Cannot add update student!",
										"error");
							}
						});

						$("#spinner").hide();
					};

				});

// select combobox
// Set selected
function setSelectedValue(selectObj, valueToSet) {
	for (var i = 0; i < selectObj.options.length; i++) {
		if (selectObj.options[i].text == valueToSet) {
			selectObj.options[i].selected = true;
			return;
		}
	}
}
// re-style the pagination
function restylePG() {
	$(".pagination").removeClass("pagination-small").addClass(
			'pagination-sm inline');
}
