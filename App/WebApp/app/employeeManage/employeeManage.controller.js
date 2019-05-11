(function () {
    'use strict';

    angular.module('app').controller('EmployeeManageController', EmployeeManageController);

    function EmployeeManageController($scope, $http) {
        var vm = this;
        var dataService = $http;

        vm.employee = {
            EmployeeId: 0,
            FullName: '',
            FirstName: '',
            LastName: '',
            Initial: '',
            Email: '',
            DateOfBirth: ''
        };

        vm.updateEmployeeModal = {
            EmployeeId: 0,
            FullName: '',
            FirstName: '',
            LastName: '',
            Initial: '',
            Email: '',
            DateOfBirth: ''
        };

        vm.employeeListViewModel = [];

        vm.category = {
            CategoryId: 0,
            CategoryName: ''
        };

        getEmployees();
              

        function getEmployees() {
            var response = $http({
                headers: {
                    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiVGVzdCIsImV4cCI6MTU1Mjc1MTI0MCwiaXNzIjoieW91cmRvbWFpbi5jb20iLCJhdWQiOiJ5b3VyZG9tYWluLmNvbSJ9.JMo_imamPGwtZ2brFRxncLK1761ODtGklzFEcoaOtLI'

                },
                method: 'get',
                // headers: { "Content-Type": "application/json;charset=UTF-8" },
                url: 'https://localhost:44308/api/EmployeeManage/',
                dataType: 'json'

            }).then(
                function successCallback(response) {
                vm.employeeListViewModel = response.data;
                },
                function errorCallback(response) {
                alert("Error. while created user Try Again!");
            });
        };

        vm.addEmployee = function () {
            var response = $http({
                method: 'post',
                headers: { "Content-Type": "application/json;charset=UTF-8" },
                url: 'https://localhost:44308/api/EmployeeManage/',
                data: JSON.stringify(vm.employee),
                dataType: 'json'

            }).then(function successCallback(response) {
                getEmployees();
                alert("Employee has created Successfully")

            }, function errorCallback(response) {
                alert("Error. while created user Try Again!");
            });
        };

        vm.showUpdateEmployeeModal = function (employee) {
            vm.updateEmployeeModal = employee;
            $('#updateEmployeeModal').modal('show');

        };

        vm.updateEmployee = function () {
            var response = $http({
                method: 'put',
                headers: { "Content-Type": "application/json;charset=UTF-8" },
                url: 'https://localhost:44308/api/EmployeeManage/' + vm.updateEmployeeModal.EmployeeId,
                data: JSON.stringify(vm.updateEmployeeModal),
                dataType: 'json'

            }).then(function successCallback(response) {
                getEmployees();
                alert("Employee details updated Successfully")

            }, function errorCallback(response) {
                alert("Error. while created user Try Again!");
            });
        };

        vm.deleteEmployee = function (employee) {
            var response = $http({
                method: 'delete',
                url: 'https://localhost:44308/api/EmployeeManage/' + employee.EmployeeId,
                dataType: 'json'
            }).then(function successCallback(response) {

                getEmployees();
                alert("User has deleted Successfully")

            }, function errorCallback(response) {

                alert("Error. while created user Try Again!");
            });
        };
    }
})();