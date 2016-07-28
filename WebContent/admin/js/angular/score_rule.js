/*declare app*/
var app = angular.module('scoreApp', [ 'ui.bootstrap' ]);
app.filter('unique', function() {
	return function(collection, keyname) {
		var output = [], keys = [];

		angular.forEach(collection, function(item) {
			var key = item[keyname];
			if (keys.indexOf(key) === -1) {
				keys.push(key);
				output.push(item);
			}
		});
		return output;
	};
});

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

app
		.filter(
				'filterByDate',
				function() {
					return function(availabilities, month) {
						// Here do the filtering, for instance, using underscore
						// _.filter
						return availabilities
								.filter(function(item) {
									var parts = item.date
											.match(/^(\d{4})\-(\d{2})\-(\d{2})\s(\d{2})\:(\d{2})\:(\d{2})$/);
									return month[1] === parseInt(parts[2])
											&& month[0] === parseInt(parts[1]);
								});

					}
				});

/* app scope */
app
		.controller(
				'scoreCtrl',
				function($scope, $http, $timeout) {
$scope.regex="^$|^[A-z]+$";
					// load active generation
					$http.get('listScoreRule.hrd').success(function(data) {
						$scope.list = data;
						$scope.error = false;
						$scope.incomplete = false;
						$scope.edit = true;
						$scope.editid = 0;
					});

					// load generation
					$http.get('listGen.hrd').success(function(data) {
						$scope.gen = data;
					});

					// load course
					$http.get('listCourse.hrd').success(function(data) {
						$scope.course = data;
					});

					// load active generation
					$http.get('listActiveGen.hrd').success(function(data) {
						$scope.activeGen = data;
					});

					$scope.loadData = function() {
						$http.get('listScoreRule.hrd').success(function(data) {
							$scope.list = data;
							$scope.error = false;
							$scope.incomplete = false;
							$scope.edit = true;
							$scope.editid = 0;
						});
					}

					/* validation */
					$scope.$watch('gen_Filter', function() {
						$scope.test();
					});

					$scope.$watch('cou_id', function() {
						$scope.test();
					});

					$scope.$watch('grade', function() {
						$scope.test();
					});

					$scope.$watch('rank_lower', function() {
						$scope.test();
					});

					$scope.$watch('rank_top', function() {
						$scope.test();
					});

					$scope.$watch('detail_grade', function() {
						$scope.test();
					});

					$scope.test = function() {
						$scope.incomplete = false;
						if ($scope.edit
								&& (!$scope.gen_Filter.length
										|| !$scope.cou_id.length
										|| !$scope.grade.length
										|| !$scope.rank_lower.length
										|| !$scope.rank_top.length || !$scope.detail_grade.length)) {
							$scope.incomplete = true;
						}
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
							$('#listGenClass').val('');
							$('#clCourse').val('');
							$('#grade').val('');
							$('#rank_lower').val('');
							$('#rank_top').val('');
							$('#detail_grade').val('');

						} else {
							$scope.edit = false;
							for (var i = 0; i < $scope.list.length; i++) {
								if ($scope.list[i].rule_id == id) {
									x = i;
									setSelectedValue(listGenClass,
											$scope.list[i].gen_name);
									setSelectedValue(clCourse,
											$scope.list[i].cou_name);
									$('#grade').val($scope.list[i].grade);
									$('#rank_lower').val(
											$scope.list[i].rank_lower);
									$('#rank_top').val($scope.list[i].rank_top);
									$('#detail_grade').val(
											$scope.list[i].detail_grade);
								}
							}
						}
					};

					$scope.save = function(e) {
						
						$("#spinner").show();
						var data = {
								'rule_id': $scope.editid,
								'grade' : $('#grade').val(),
								'rank_lower' : $('#rank_lower').val(),
								'rank_top' : $('#rank_top').val(),
								'cou_id' : $('#clCourse').val(),
								'detail_grade' : $('#detail_grade').val()
							};
						if (e == true) { // insert gen
							$.post("insertScoreRule.hrd", data).success(function(data, status, headers) {
									if (data == "Success") {
										addForm.reset();
										$("#btn-collapse").click();
										swal(
												"Congratulation!",
												"Score rule has been added!",
												"success");
										$scope.loadData();
										$("#spinner").hide();

									} else {
										swal(
												"Error!",
												"Cannot add score rule!",
												"error");

									}
								});
						} else { // update gen
							$.post("updateScoreRule.hrd", data).success(
								function(data, status, headers) {
									if (data == "Success") {
										addForm.reset();
										$("#btn-collapse").click();
										swal(
												"Congratulation!",
												"Score rule has been update!",
												"success")
										$scope.loadData();
										$("#spinner").hide();
									}
								});

						}
					};

					// delete
					$scope.del = function(id) {
						// make sure before delete
						swal(
								{
									title : "Are you sure?",
									text : "You will not be able to recover this rule after delete!",
									type : "warning",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "Yes",
									closeOnConfirm : false
								},
								function() {
									$
											.post("deleteScoreRule.hrd", {
												'rule_id' : id
											})
											.success(
													function(data, status,
															headers) {
														if (data == "Success") {
															addForm.reset();
															swal(
																	"Congratulation!",
																	"Rule has been deleted!",
																	"success")
															$scope.loadData();
														}
													});
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