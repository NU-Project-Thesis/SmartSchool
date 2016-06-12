/*declare app*/
var app = angular.module('docApp', [ 'ui.bootstrap' ]);

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
app.controller('docCtrl', function($scope, $http, $timeout) {

	// load generation
	$http.get('listGen.hrd').success(function(data) {
		$scope.gen = data;
	});

	// load active generation
	$http.get('listStudentEnroll.hrd').success(function(data) {
		$scope.student = data;
	});

	// load course
	$http.get('listCourse.hrd').success(function(data) {
		$scope.course = data;
	});

	// load active course
	$http.get('listActiveCourse.hrd').success(function(data) {
		$scope.activeCourse = data;
	});

	// class
	$http.get('listClass.hrd').success(function(data) {
		$scope.class_ = data;
	});

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

});