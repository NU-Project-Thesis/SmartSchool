/*declare app*/
var app = angular.module('StaffApp', [ 'ui.bootstrap' ]);

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
				'staffCtrl',
				function($scope, $http, $timeout) {

					$http.get('SelectListStaff.hrd').success(function(data) {
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
						$http.get('SelectListStaff.hrd').success(
								function(data) {

									$scope.list = data;
									$scope.currentPage = 1; // current page
									$scope.entryLimit = $('#entryLimit').val(); // max
																				// no
																				// of
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
							$('#img').attr('src', '../image/default-profile.png');
							addForm.reset();
							$('#passField').attr('style', 'display:block;');

						} else {
							$scope.edit = false;
							// alert(id);
							for (var i = 0; i < $scope.list.length; i++)
								if ($scope.list[i].staff_id == id)
									x = i;
							$('#id').val(id);
							$("#first_name").val($scope.list[x].first_name);
							$("#last_name").val($scope.list[x].last_name);
							$('#img').attr('src',
									'../image/staff/' + $scope.list[x].photo);
							$('#hide_img').val($scope.list[x].photo);
							// alert($scope.list[x].last_name);
							if ($scope.list[x].gender == 'M') {
								$('#F').prop('checked', false);
								$('#M').prop('checked', true);
							} else {
								$('#M').prop('checked', false);
								$('#F').prop('checked', true);
							}
							setSelectedValue(position, $scope.list[x].position);
							$("#phone").val($scope.list[x].phone);

							$("#email").val($scope.list[x].email);
							// $("#password").val($scope.list[x].pasword);
							// $("#photo").val($scope.list[x].photo);
							$('#passField').attr('style', 'display:none;');

						}
					};
					/* change status */
					$scope.changeState = function(e, status, first_name,
							last_name) {

						/* if staff is already drop so return */
						if (status === 'drop') {
							swal("Warning!", "This staff is already drop!");
							return;
						}

						/* confirm before change */
						swal(
								{
									title : "Warning!",
									text : "If you make change to this you will no longer to change again. To make sure please type the name of staff to make confirm. '"
											+ first_name
											+ " "
											+ last_name
											+ "'",
									type : "input",
									showCancelButton : true,
									closeOnConfirm : false,
									animation : "slide-from-top",
									inputPlaceholder : "Write something"
								},
								function(inputValue) {
									if (inputValue === false)
										return false;
									if (inputValue !== (first_name + " " + last_name)) {
										swal
												.showInputError("You need to write: "
														+ (first_name + " " + last_name));
										$scope.loadData();
										return false;
									}
									if (inputValue === (first_name + " " + last_name)) {
										var data = {
											'staff_id' : e,
											'status' : 'drop'
										};
										$("#spinner").show();
										$
												.post("updateStaffState.hrd",
														data)
												.success(
														function(data, status,
																headers) {
															if (data == "Success") {
																swal(
																		"Congratulation!",
																		"Staff status has been changed!",
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

					/* save for insert and update */
					$scope.save = function(e) {

						$("#spinner").show();
						var formData = new FormData($("#addForm")[0]);

						if (e == true) { // insert gen
							$.ajax({
								url : 'insertStaff.hrd',
								type : 'POST',
								data : formData,
								async : false,
								cache : false,
								contentType : false,
								processData : false,
								success : function(data) {
									if (data == 'Success') {
										swal("Congratulation!",
												"New staff has been added!",
												"success");
										$('#addForm')[0].reset();
										// clear check from gender field
										$('#M').removeAttr('checked');
										$('#F').removeAttr('checked');
										// set image to default
										$('#img').attr('src',
												'../image/default-profile.png');
										$("#btn-collapse").click();
										$scope.loadData();
										$("#spinner").hide();
									}
								},
								error : function() {
									swal("Error!", "Cannot add new staff!",
											"error");
								}
							});

						} else { // update gen

							$.ajax({
								url : 'updateStaff.hrd',
								type : 'POST',
								data : formData,
								async : false,
								cache : false,
								contentType : false,
								processData : false,
								success : function(data) {
									if (data == 'Success') {
										swal("Congratulation!",
												"Staff has been updated!",
												"success");
										$('#addForm')[0].reset();
										// clear check from gender field
										$('#M').removeAttr('checked');
										$('#F').removeAttr('checked');
										// set image to default
										$('#img').attr('src',
												'../image/default-profile.png');
										$("#btn-collapse").click();
										$scope.loadData();
										$("#spinner").hide();
									}
								},
								error : function() {
									swal("Error!", "Cannot update staff!",
											"error");
								}
							});
						}

					};

				});

// re-style the pagination
function restylePG() {
	$(".pagination").removeClass("pagination-small").addClass(
			'pagination-sm inline');
}
function setSelectedValue(selectObj, valueToSet) {
	for (var i = 0; i < selectObj.options.length; i++) {
		if (selectObj.options[i].text == valueToSet) {
			selectObj.options[i].selected = true;
			return;
		}
	}
}