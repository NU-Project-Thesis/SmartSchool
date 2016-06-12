/*declare app*/
var app = angular.module('subjectApp', [ 'ui.bootstrap' ]);

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
app.controller('subjectCtrl', function($scope, $http, $timeout) {

	$http.get('listSubject.hrd').success(function(data) {

		$scope.list = data;
		$scope.currentPage = 1; // current page
		$scope.entryLimit = 5; // max no of items to display in a page
		$scope.filteredItems = $scope.list.length; // Initially for no filter
		$scope.totalItems = $scope.list.length;
		$scope.edit = true;
		$scope.error = false;
		$scope.incomplete = false;
		$scope.editid = 0;
		// re-style the pagination
		restylePG();
	});

	/*
	 * $http.post('listActiveGen.hrd').success(function(data) {
	 * 
	 * $scope.gen=data;
	 * 
	 * });
	 */

	$scope.loadData = function() {
		$http.get('listSubject.hrd').success(function(data) {

			$scope.list = data;
			$scope.currentPage = 1; // current page
			$scope.entryLimit = $('#entryLimit').val(); // max no of items to display in a page
			$scope.filteredItems = $scope.list.length; // Initially for no
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
			$('#sub_name').val('');
			$('#sub_description').val('');

		} else {
			$scope.edit = false;
			for (var i = 0; i < $scope.list.length; i++)
				if ($scope.list[i].sub_id == id)
					x = i;
			$('#sub_name').val($scope.list[x].sub_name);
			$('#sub_description').val($scope.list[x].description);
		}
	};

	/* validate if null button is disable */
	$scope.$watch('sub_name', function() {
		$scope.test();
	});

	$scope.$watch('description', function() {
		$scope.test();
	});

	$scope.test = function() {
		$scope.incomplete = false;
		if ($scope.edit
				&& (!$scope.sub_name.length || !$scope.description.length)) {
			$scope.incomplete = true;
		}
	};

	/* end validate */

	/* change status */
	$scope.changeState = function(e, name, status) {
		
		/* if subject is already finished so return */
		if (!status) {
			swal("Warning!",
					"You cannot make change to this subject because it already finished!");
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
						/*$scope.loadData();*/
						return false;
					if (inputValue !== name) {
						swal.showInputError("You need to write: "+name);
						$scope.loadData();
						return false;
					}
					if (inputValue === name) {
						var data = {
								'sub_id' : e
							};
							$("#spinner").show();
							$.post("updateSubjectState.hrd", data).success(
									function(data, status, headers) {
										if (data == "Success") {
											swal("Nice!", name+" has been change to finished!");
											$scope.loadData();
											$("#spinner").hide();
										}
									});
					}

				});
		
		

	};
	
	/*save to database*/
	$scope.save = function(e) {

		$("#spinner").show();
		var data = {
			'sub_id' : $scope.editid,
			'sub_name' : $('#sub_name').val(),
			'description' : $('#sub_description').val()
		};
		if (e == true) { // insert gen
			$.post("insertSubject.hrd", data).success(
					function(data, status, headers) {
						if (data == "Success") {
							swal("Congratulation!", "New subject has been added!",
							"success");
							addForm.reset();
							$("#btn-collapse").click();
							$scope.loadData();
						}
					});
		} else { // update gen
			$.post("updateSubject.hrd", data).success(
					function(data, status, headers) {
						if (data == "Success") {
							swal("Congratulation!", "Subject has been updated!",
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
//re-style the pagination
function restylePG(){
	$(".pagination").removeClass("pagination-small").addClass('pagination-sm inline');
}
