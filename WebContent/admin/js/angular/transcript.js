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