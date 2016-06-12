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

					$http.get('SelectStudentById.hrd').success(function(data) {
						$scope.list = data;
						$scope.edit = true;
						$scope.error = false;
						$scope.incomplete = false;
						$scope.editid = 0;
					});
					
					$http.get('studentCourse.hrd').success(function(data) {
						$scope.student_course = data;
					});

					$scope.loadData = function() {
						$http.get('SelectStudentById.hrd').success(function(data) {
							$scope.list = data;
							$scope.edit = true;
							$scope.error = false;
							$scope.incomplete = false;
							$scope.editid = 0;
						});
					};
					
					$scope.save = function(e) {
						$("#spinner").show();
						var formData = new FormData($("#profileForm")[0]);
						$.ajax({
							url : 'UpdateStudentProfile.hrd',
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
									$scope.loadData();
								}
							},
							error : function() {
								swal("Error!", "Cannot update student!",
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

