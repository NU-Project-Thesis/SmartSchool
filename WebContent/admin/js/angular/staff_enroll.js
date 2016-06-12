/*declare app*/
var app = angular.module('staffEnrollApp', [ 'ui.bootstrap' ]);

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
				'staffEnrollCtrl',
				function($scope, $http, $timeout) {

					$http.get('listStaffEnroll.hrd').success(function(data) {

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

					/*call function when ducument ready*/
					angular.element(document).ready(function () {
					    $scope.loadData();
					});
					
					$scope.loadData = function() {
						$http.get('listStaffEnroll.hrd').success(
								function(data) {

									$scope.list = data;
									$scope.currentPage = 1; // current page
									$scope.entryLimit = $('#entryLimit').val(); // max
									// no
									// of
									// items to
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
						
						// load generation
						$http.get('listGen.hrd').success(function(data) {
							$scope.gen = data;
						});

						// load active generation
						$http.get('listActiveGen.hrd').success(function(data) {
							$scope.activeGen = data;
						});

						// load course
						$http.get('listCourse.hrd').success(function(data) {
							$scope.course = data;
						});

						// load active course
						$http.get('listActiveCourse.hrd').success(
								function(data) {
									$scope.activeCourse = data;
								});

						// class
						$http.get('listClass.hrd').success(function(data) {
							$scope.class_ = data;
						});

						// subject
						$http.get('listSubject.hrd').success(function(data) {
							$scope.subject = data;
						});

						// available staff
						$http.get('listAvailableInstructor.hrd').success(
								function(data) {
									$scope.staff = data;
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
							setSelecteFirst('#listGenClass');
							setSelecteFirst('#clCourse');
							setSelecteFirst('#class_id');
							setSelecteFirst('#sSub_id');
							// hide the staff combobox
							$scope.staff_show = true;
							// set value to the temp_staff
							$('#temp_staff').val("");
							// show the temp staff
							$scope.temp_staff_show = false;

						} else {
							$scope.edit = false;
							for (var i = 0; i < $scope.list.length; i++)
								if ($scope.list[i].class_enroll == id)
									x = i;

							setSelectedValue(listGenClass,
									$scope.list[x].gen_name);
							setSelectedValue(clCourse, $scope.list[x].cou_name);
							setSelectedValue(class_id,
									$scope.list[x].class_name);
							setSelectedValue(sSub_id, $scope.list[x].sub_name);
							/*
							 * setSelectedValue(sStaff_id,
							 * $scope.list[x].first_name + ' ' +
							 * $scope.list[x].last_name);
							 */
							// hide the staff combobox
							$scope.staff_show = false;
							// set value to the temp_staff
							$('#temp_staff').val(
									$scope.list[x].first_name + ' '
											+ $scope.list[x].last_name);
							// show the temp staff
							$scope.temp_staff_show = true;
						}
					};

					// validation
					/*
					 * $scope.$watch('gen_id', function() { $scope.test(); });
					 * $scope.$watch('cou_id', function() { $scope.test(); });
					 * 
					 * $scope.$watch('class_id', function() { $scope.test(); });
					 * 
					 * $scope.$watch('sub_id', function() { $scope.test(); });
					 * 
					 * $scope.$watch('staff_id', function() { $scope.test(); });
					 * 
					 * $scope.test = function() { $scope.incomplete = false; if
					 * ($scope.edit && (!$scope.gen_id.length ||
					 * !$scope.cou_id.length || !$scope.class_id.length ||
					 * !$scope.sub_id.length || !$scope.staff_id.length)) {
					 * $scope.incomplete = true; } };
					 */

					$scope.save = function(e) {
						$("#spinner").show();
						var data = {
							'class_enroll' : $scope.editid,
							'class_id' : $('#class_id').val(),
							'sub_id' : $('#sSub_id').val(),
							'staff_id' : $('#sStaff_id').val()
						};
						if (e == true) { // insert gen
							$
									.post("insertStaffEnroll.hrd", data)
									.success(
											function(data, status, headers) {
												if (data == "Success") {
													addForm.reset();
													$("#btn-collapse").click();
													swal(
															"Congratulation!",
															"New enroll has been added!",
															"success");
													$scope.loadData();
												}
											}).error(function(){
												swal("Error", "Cannot add enroll!", "error");
											});
						} else { // update gen
							$.post("updateStaffEnroll.hrd", data).success(
									function(data, status, headers) {
										if (data == "Success") {
											addForm.reset();
											$("#btn-collapse").click();
											swal("Congratulation!",
													"Enroll has been updated!",
													"success");
											$scope.loadData();
										}
									}).error(function(){
										swal("Error", "Cannot update enroll!", "error");
									});

						}
						$("#spinner").hide();

					};

					// delete
					$scope.del = function(id, status) {
						// cannot delete if course of enroll is already finished
						if (status) {
							swal("Warning!",
									"This enroll cannot delete because the course that it belong to is finished!");
							return;
						}

						// make sure before delete
						swal(
								{
									title : "Are you sure?",
									text : "You will not be able to recover this enroll after delete!",
									type : "warning",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "Yes",
									closeOnConfirm : false
								},
								function() {
									$
											.post("deleteStaffEnroll.hrd", {
												'class_enroll' : id
											})
											.success(
													function(data, status,
															headers) {
														if (data == "Success") {
															addForm.reset();
															swal(
																	"Congratulation!",
																	"Enroll has been deleted!",
																	"success")
															$scope.loadData();
														}
													}).error(function(){
														swal("Error", "Cannot delete enroll!", "error");
													});;
								});

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

// set combobox selected
function setSelecteFirst(selector) {
	// remove "selected" from any options that might already be selected
	$(selector + ' option[selected="selected"]').each(function() {
		$(this).removeAttr('selected');
	});

	// mark the first option as selected
	$(selector + ' option:first').attr('selected', 'selected');
}

// add course on edit
function addCourseOnEdit(id, value) {
	var g = "";
	$.post('listCourseGen.hrd', {
		gen_id : id
	}, function(data) {
		for (var i = 0; i < data.length; i++) {
			g += "<option value='" + data[i].cou_id + "'>" + data[i].cou_name
					+ "</option>";
		}

		$('#clCourse').html(g);
		setSelectedValue(clCourse, value);
	});
}

// re-style the pagination
function restylePG() {
	$(".pagination").removeClass("pagination-small").addClass(
			'pagination-sm inline');
}