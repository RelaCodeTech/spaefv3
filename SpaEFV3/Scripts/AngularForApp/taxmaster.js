﻿

var myapp = angular.module('TaxMaster', []);

var URL_TaxMasterWebApi = 'http://localhost:51664/api/TaxMasterWebApi';

myapp.controller('TaxMasterCtrl', function TaxMasterCtrl($scope, $http) {
    $http.get(URL_TaxMasterWebApi).success(function (data) {
        $scope.taxdata = data;
    });
});

