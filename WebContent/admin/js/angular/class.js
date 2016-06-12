/*declare app*/
var app = angular.module('classApp', [ 'ui.bootstrap' ]);

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
app.controller('classCtrl', function($scope, $http, $timeout) {

	$http.get('listClass.hrd').success(function(data) {

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
	
	// load data when document is ready
	angular.element(document).ready(function () {
		$scope.loadData();
	});

	$scope.loadData = function() {
		$http.get('listClass.hrd').success(function(data) {

			$scope.list = data;
			$scope.currentPage = 1; // current page
			$scope.entryLimit = $('#entryLimit').val(); // max no of items to
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
		
		// load course
		$http.get('listCourse.hrd').success(function(data) {
			$scope.course = data;
		});
		
		// load active generation
		$http.get('listActiveGen.hrd').success(function(data) {
			$scope.activeGen = data;
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
			$scope.class_name = '';
			setSelecteFirst('#listGenClass');

		} else {
			$scope.edit = false;
			for (var i = 0; i < $scope.list.length; i++)
				if ($scope.list[i].class_id == id)
					x = i;
			setSelectedValue(listGenClass, $scope.list[x].gen_name);
			//setSelectedValue(clCourse, $scope.list[x].cou_name);
			$('#class_name').val($scope.list[x].class_name);
			addCourseOnEdit($('#listGenClass').val(), $scope.list[x].cou_name);
		}
	};
	
	$scope.addCourse = function(){
		addCourseOnEdit($('#listGenClass').val(), "");
	}
	
	$scope.$watch('class_name', function() {
		$scope.test();
	});
	$scope.$watch('cou_id', function() {
		$scope.test();
	});

	$scope.test = function() {
		$scope.incomplete = false;
		if ($scope.edit
				&& (!$scope.class_name.length || !$scope.cou_id.length)) {
			$scope.incomplete = true;
		}
	};
	
	/*change status*/
	$scope.changeState = function(e, name, status) {
		
		/* if class is already finished so return */
		if (!status) {
			swal("Warning!", "You cannot make change to this class because it already finished!");
			return;
		}
		
		/* confirm before change */
		swal(
				{
					title : "Warning!",
					text : "If you make change to this you will no longer to change again. To make sure please type the name of generation to make confirm. '"
							+ name + "'",
					type : "input",
					showCancelButton : true,
					closeOnConfirm : false,
					animation : "slide-from-top",
					inputPlaceholder : "Write something"
				},
				function(inputValue) {
					if (inputValue === false)
						return false;
					if (inputValue !== name) {
						swal.showInputError("You need to write: "+name);
						$scope.loadData();
						return false;
					}
					if (inputValue === name) {
						var data = {
								'class_id' : e
							};
							$("#spinner").show();
							$.post("updateRoomState.hrd", data).success(function(data, status, headers) {
								if (data == "Success") {
									swal("Nice!", name+" has been change to finished!");
									$scope.loadData();
									$("#spinner").hide();
								}
							});
					}

				});
		
		
	};
	
	$scope.save = function(e) {
		$("#spinner").show();
		var data = {
			'class_id' : $scope.editid,
			'class_name' : $('#class_name').val(),
			'cou_id' : $('#clCourse').val(),
		};
		if (e == true) { // insert gen
			$.post("insertRoom.hrd", data).success(
					function(data, status, headers) {
						if (data == "Success") {
							swal("Congratulation!", "New class has been added!",
							"success");
							addForm.reset();
							$("#btn-collapse").click();
							$scope.loadData();
						}
					});
		} else { // update gen
			$.post("updateRoom.hrd", data).success(
					function(data, status, headers) {
						if (data == "Success") {
							swal("Congratulation!", "Class has been updated!",
							"success");
							addForm.reset();
							$("#btn-collapse").click();
							$scope.loadData();
						}
					});

		}
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