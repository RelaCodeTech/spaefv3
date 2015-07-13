

var myapp = angular.module('TaxMaster', []);


//Controller
myapp.controller("TaxMasterCtrl",

//['$scope', 'TaxMasterData', "$http",
//function ($scope, TaxMasterData, $http) {

//["$scope", 'TaxMasterData', "$window", "$routeParams", "$location", "TaxMasterDataFactory",
//function CustomerController($scope, TaxMasterData, $window, $routeParams, $location, TaxMasterDataFactory) {

['$scope',
function ($scope) {

    //$scope.TMData = TaxMasterData;

    $scope.isAddFormVisible = true;

    $scope.showAddForm = function () {
        $scope.isAddFormVisible = !$scope.isAddFormVisible;
    }

    $scope.cancelAddForm = function () {
        $scope.isAddFormVisible = !$scope.isAddFormVisible;
    }

    //$scope.addNewTax = function (newTax) {
    //    alert("shortnm=" + newTax.Tax_Short_Name + " desc=" + newTax.Tax_Description + " country=" + newTax.Country_ID);
    //    //return $http.post("http://localhost:51664/TaxMaster/Create", newTax);
    //}


}]);

////DataFactory
//myapp.factory('TaxMasterDataFactory',

//["$http",
//function ($http) {

//    var addNewTax = function (newTax) {
//        return $http.post("http://localhost:51664/TaxMaster/Create", newTax);
//    }


//    var deleteTax = function (taxID) {
//        return $http.post("http://localhost:51664/TaxMaster/Delete", taxID);
//    }

//    return {
//        addNewTax: addNewTax,
//        deleteTax: deleteTax
//    };
//}]);




