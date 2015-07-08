

angular.module('MyApp', [])
.controller("CustomerCtrl", [ '$scope', function($scope) {
    $scope.customers = [
                        {  'fname':'sandy',
                            'lname': 'patil',
                            'age': 34},
                        {  'fname':'raj',
                            'lname': 'kr',
                            'age': 32},
                        {  'fname':'banke',
                            'lname': 'lal',
                            'age': 24},
                        {  'fname':'bheja',
                            'lname': 'fry',
                            'age': 39},
                        {  'fname':'lotto',
                            'lname': 'nike',
                            'age': 84}
    ];

    $scope.addRow = function(){		
        $scope.customers.push({ 'fname':$scope.fname, 'lname': $scope.lname, 'age':$scope.age });
        $scope.fname='';
        $scope.lname='';
        $scope.age='';
    }
}]);

