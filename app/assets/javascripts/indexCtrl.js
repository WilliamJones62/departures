var app = angular.module("departuresApp", []);
app.controller("indexCtrl", function($scope, $http, $interval, $timeout) {
  var url = "http://localhost:3000/api/v1/departures.json";
  $http.get(url).then(function(response) {
    $scope.departures = response.data;
  });
  $timeout(function() {
    $interval(function() {
      $http.get(url).then(function(response) {
        $scope.departures = response.data;
      });
    }, 30000);
  }, 30000);
});
