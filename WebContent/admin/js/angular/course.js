/*declare app*/

var app = angular.module('courseApp', [ 'ui.bootstrap' ]);

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
app.controller('courseCtrl', function($scope, $http, $timeout) {

	// load data on start up
	$http.get('listCourse.hrd').success(function(data) {

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
	
	// load data when document is ready
	angular.element(document).ready(function () {
		$scope.loadData();
	});
	
	$scope.loadData = function() {
		$http.get('listCourse.hrd').success(function(data) {

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
		
		// load Generation
		$http.get('listGen.hrd').success(function(data) {
			$scope.gen = data;
		});
		
		// load Generation
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
			$scope.cou_name = '';
			$scope.star_tdate = '';
			$scope.end_date = '';

		} else {
			$scope.edit = false;
			for (var i = 0; i < $scope.list.length; i++)
				if ($scope.list[i].cou_id == id)
					x = i;
			/*$scope.cou_name = $scope.list[x].cou_name;*/
			$('#cou_name').val($scope.list[x].cou_name);
			$("#start_date").datepicker("setDate",
					new Date($scope.list[x].start_date));
			$("#end_date").datepicker("setDate",
					new Date($scope.list[x].start_date));
			setSelectedValue(cGen, $scope.list[x].gen_name);
		}
	};

	$scope.$watch('gen_id', function() {
		$scope.test();
	});

	$scope.$watch('cou_name', function() {
		$scope.test();
	});
	$scope.$watch('start_date', function() {
		$scope.test();
	});
	$scope.$watch('end_date', function() {
		$scope.test();
	});
	$scope.test = function() {
		$scope.incomplete = false;
		if ($scope.edit
				&& (!$scope.cou_name.length || !$scope.start_date.length
						|| !$scope.end_date.length || !$scope.gen_id.length)) {
			$scope.incomplete = true;
		}
	};

	/* change status */
	$scope.changeState = function(e, name, status) {
		
		/* if course is already finished so return */
		if (status) {
			swal("Warning!",
					"You cannot make change to this course because it already finished!");
			return;
		}
		
		/* confirm before change */
		swal(
				{
					title : "Warning!",
					text : "If you make change to this you will no longer to change again. To make sure please type the name of course to make confirm. '"
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
								'cou_id' : e
							};
							$("#spinner").show();
							$.post("updateCouseState.hrd", data).success(
									function(data, status, headers) {
										if (data == "Success") {
											$scope.loadData();
											swal("Nice!", name+" has been change to finished!");
											$("#spinner").hide();
										}
									});
					}

				});
		
		

	};

	$scope.save = function(e) {
		//get value from start date and end dat in milli seconds for calculation
		var start_date=	$('#start_date').datepicker('getDate')*86400 * 1000;
		var end_date = $('#end_date').datepicker('getDate')*86400 * 1000;
	     
		$("#spinner").show();
		console.log("abc");
		var data = {
			'cou_id' : $scope.editid,
			'cou_name' : $scope.cou_name,
			'start_date' : $scope.start_date,
			'end_date' : $scope.end_date,
			'gen_id' : $('#cGen').val()
		};
//		 alert(start_date);
//	      
//	      alert('fuq!');
		//if start date is bigger than end , can not insert new course
		if(start_date > end_date){
			
			swal(
					"Try again!",
					"Start date must be before enddate! ",
					"error");
			return false;
			
		}
		if (e == true) { // insert gen
			$.post("courseInsert.hrd", data).success(
					function(data, status, headers) {
						if (data == "Success") {
							swal("Congratulation!", "New course has been added!",
							"success");
							addForm.reset();
							$("#btn-collapse").click();
							$scope.loadData();
						}else {
							swal("Error!", "Can Only Course available",
							"error");
						}
					});
		} else { // update gen
			$.post("updateCourse.hrd", data).success(
					function(data, status, headers) {
						if (data == "Success") {
							swal("Congratulation!", "Course has been updated!",
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

// re-style the pagination
function restylePG() {
	$(".pagination").removeClass("pagination-small").addClass(
			'pagination-sm inline');
}
