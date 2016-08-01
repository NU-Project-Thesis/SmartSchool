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

/* app scope */
app
		.controller(
				'scoreCtrl',
				function($scope, $http, $timeout) {

					$http.get('ScoresPermission.hrd').success(function(data) {
						$scope.per = data;
						$scope.showcourse = false;
						$scope.showclass = false;
						$scope.showsub = false;
						$scope.edit = true;
						$scope.studentNoScore = null;
						$scope.studentScore = null;
					});

					/*
					 * $http.get('selectStudentWithScore.hrd').success(function(data) {
					 * $scope.studentScore = data; });
					 */
					
					$scope.inputValid = false;
					
					$http.get('selectStudentNoScore.hrd').success(
							function(data) {
								$scope.studentNoScore = data;
							});

					// show student that has been add score
					$scope.showStudentList = function() {
						var data = {
							'class_id' : $('#classFilter').val(),
							'score_date' : $('#date').val()
						};

						$.post('selectStudentWithScore.hrd', data, function(
								data_) {
							$scope.studentScore = data_;
						});
					}

					$scope.showStudent = function() {
						var data = {
							'class_id' : $('#classFilter_').val()
						};

						$.post('selectStudentNoScore.hrd', data,
								function(data_) {
									$scope.studentNoScore = data_;
								});
					}

					$scope.loadData = function() {
						$scope.showStudentList();
						$scope.showStudent();
					}

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

					$scope.updateScore = function(stu_id, score) {

					}

					$scope.editUser = function(id) {
						if ($("#collapse-status").attr('class') == "fa fa-plus")
							$("#btn-collapse").click();
						$scope.editid = id;
						if (id == 'new') {
						}
					};

					$scope.save = function(e) {

						var score = new Array();
						var id = new Array();

						$.each($("input[name='score[]']"), function() {
							score.push($(this).val());
						});

						$.each($("input[name='id[]']"), function() {
							id.push($(this).val());
						});

						$("#spinner").show();

						if (e == true) { // insert gen
							var data = {
								'score' : score.toString(),
								'score_date' : $('#date_').val(),
								'stu_id' : id.toString(),
								'sub_id' : $('#sub_id').val(),
								'class_id' : $('#classFilter_').val()
							};
							$
									.post("insertScore.hrd", data)
									.success(
											function(data, status, headers) {
												if (data == "Success") {
													// addForm.reset();
													$("#btn-collapse").click();
													swal(
															"Congratulation!",
															"Score has been added!",
															"success");
													$scope.loadData();

												} else {
													swal(
															"Error!",
															"The score in this month is already exist!",
															"error");

												}
											});
						} else { // update gen
							$.post("updateStudentEnroll.hrd", data).success(
									function(data, status, headers) {
										if (data == "Success") {
											// addForm.reset();
											$("#btn-collapse").click();
											swal("Congratulation!",
													"Enroll has been updated!",
													"success")
											$scope.loadData();
										}
									});

						}
						$("#spinner").hide();

					};

					$scope.editScore = function(id) {
						$scope.editid = id;
						for (var i = 0; i < $scope.studentScore.length; i++) {
							if ($scope.studentScore[i].score_id == id) {
								$('#stu_id').val(id);
								$('#stu_name')
										.val(
												$scope.studentScore[i].first_name
														+ ' '
														+ $scope.studentScore[i].last_name);
								$('#stu_score').val(
										$scope.studentScore[i].score);
								openModal.click();
							}
						}
					}

					$scope.saveUpdateScore = function() {
						var data = {
							'score_id' : $scope.editid,
							'score' : $('#stu_score').val()

						};
						$.post('updateScore.hrd', data, function(d) {
							if (d == "Success") {
								editScoreForm.reset();
								btnclose.click();
								swal("Congratulation!",
										"Score has been updated!", "success")
								$scope.loadData();
							}
						})
					}

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
													});
								});

					};

				});

// only allow number
app.directive('onlyDigits', function () {
    return {
        require: 'ngModel',
        restrict: 'A',
        link: function (scope, element, attr, ctrl) {
          function inputValue(val) {
            if (val) {
              var digits = val.replace(/[^0-9]/g, '');
//              if(val<0 || val>100){
//            	  alert("Cannot input score more than 100.");
//            	  $scope.inputValid = false;
//            	  return;
//              }else{
//            	  $scope.inputValid = true;
//            	  return;
//              }
            	  
              if (digits !== val) {
                ctrl.$setViewValue(digits);
                ctrl.$render();
              }
              return parseInt(digits,10);
            }
            return undefined;
          }            
          ctrl.$parsers.push(inputValue);
        }
      };
  });

// min value
//module.directive("min", function () {
//    return {
//        restrict: "A",
//        require: "ngModel",
//        link: function (scope, element, attributes, ngModel) {
//            ngModel.$validators.min = function (modelValue) {
//                if (!isNaN(modelValue) && modelValue !== "" && attributes.min !== "")
//                    return parseFloat(modelValue) >= attributes.min;
//                else
//                    return true;
//            }
//        }
//    };
//});
//
//// max value
//module.directive("max", function () {
//    return {
//        restrict: "A",
//        require: "ngModel",
//        link: function (scope, element, attributes, ngModel) {
//            ngModel.$validators.max = function (modelValue) {
//                if (!isNaN(modelValue) && modelValue !== "" && attributes.max !== "")
//                    return parseFloat(modelValue) <= attributes.max;
//                else
//                    return true;
//            }
//        }
//    };
//});



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
