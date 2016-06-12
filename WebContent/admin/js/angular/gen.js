/*declare app*/
var app = angular.module('genApp', [ 'ui.bootstrap' ]);

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
				'genCtrl',
				function($scope, $http, $timeout) {

					$http.get('listGen.hrd').success(function(data) {

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
						$http.get('listGen.hrd').success(function(data) {

							$scope.list = data;
							$scope.currentPage = 1; // current page
							$scope.entryLimit = $('#limitEntry').val(); // max
							// no of
							// items
							// to
							// display
							// in a
							// page
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
							$("#genform-collapse").click();
						$scope.editid = id;
						if (id == 'new') {
							$scope.edit = true;
							$scope.incomplete = true;
							/*
							 * $scope.generation = ''; $scope.startdate = '';
							 * $scope.enddate = '';
							 */
							$('#gen_name').val('');
							$('#start_date').val('');
							$('#end_date').val('');
						} else {
							$scope.edit = false;

							for (var i = 0; i < $scope.list.length; i++)
								if ($scope.list[i].gen_id == id)
									x = i;
							/*
							 * $scope.generation = $scope.list[x].gen_name;
							 * 
							 * //$scope.startdate = $scope.list[x].start_date; ;
							 * //$scope.enddate = $scope.list[x].end_date;
							 * $scope.is_finish = $scope.list[x].is_finish;
							 */
							$('#gen_name').val($scope.list[x].gen_name)
							$("#start_date").datepicker("setDate",
									new Date($scope.list[x].start_date));
							$("#end_date").datepicker("setDate",
									new Date($scope.list[x].end_date));

						}
					};

					/* validation */
					$scope.$watch('generation', function() {
						$scope.test();
					});
					$scope.$watch('startdate', function() {
						$scope.test();
					});

					$scope.$watch('enddate', function() {
						$scope.test();
					});

					$scope.$watch('finish', function() {
						$scope.test();
					});

					$scope.test = function() {
						$scope.incomplete = false;
						if ($scope.edit
								&& (!$scope.generation.length
										|| !$scope.startdate.length || !$scope.enddate.length)) {
							$scope.incomplete = true;
						}
					};

					/* change status */
					$scope.changeState = function(e, name, status) {

						/* if generation is already finished so return */
						if (status) {
							swal("Warning!",
									"You cannot make change to this generation because it already finished!");
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
											'gen_id' : e
										};
										$("#spinner").show();
										$.post("updateGenState.hrd", data).success(
											function(data, status,
													headers) {
												if (data == "Success") {
													$scope.loadData();
													swal("Nice!", name+" has been change to finished!");
													$("#spinner").hide();
												}
											});
									}

								});

					};

					/* save for insert and update */
					$scope.save = function(e) {

						$("#spinner").show();
						var data = {
							'gen_id' : $scope.editid,
							'gen_name' : $('#gen_name').val(),
							'start_date' : $('#start_date').val(),
							'end_date' : $('#end_date').val(),
							'is_finish' : $scope.is_finish
						};
						if (e == true) { // insert gen

							$
									.post("insertGen.hrd", data)
									.success(
											function(data, status, headers) {
												if (data == "Success") {
													swal(
															"Congratulation!",
															"New generation has been added!",
															"success");
													genform.reset();
													$("#genform-collapse")
															.click();
													$scope.loadData();
													$("#spinner").hide();
												}
											});
						} else { // update gen

							$
									.post("updateGen.hrd", data)
									.success(
											function(data, status, headers) {
												if (data == "Success") {
													swal(
															"Congratulation!",
															"Generation has been updated!",
															"success");
													$("#genform-collapse")
															.click();
													$scope.loadData();
													$("#spinner").hide();
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
