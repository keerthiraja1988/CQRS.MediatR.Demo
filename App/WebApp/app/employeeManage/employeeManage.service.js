(function () {
    'use strict';

    angular
        .module('app')
        .factory('employeeManage', employeeManage);

    employeeManage.$inject = ['$http'];

    function employeeManage($http) {
        var service = {
            getData: getData
        };

        return service;

        function getData() { }
    }
})();


