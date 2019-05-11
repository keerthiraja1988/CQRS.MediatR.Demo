(function () {

    var value = {
        useBreeze: false
    };

    angular.module('app').value('config', value);

}());


(function () {

    var injectParams = ['$http', '$q'];

    var customersFactory = function ($http, $q) {
        var serviceBase = '/api/EmployeeManage/',
            factory = {};


        factory.getStates = function () {
            return $http.get(serviceBase).then(
                function (results) {
                    return results.data;
                });
        };
    }

}());


(function () {

    var injectParams = ['config', 'customersService', 'customersBreezeService'];

    var dataService = function (config, customersService, customersBreezeService) {
        return (config.useBreeze) ? customersBreezeService : customersService;
    };

    dataService.$inject = injectParams;

    angular.module('app').factory('dataService', dataService);

}());



(function () {
    'use strict';

    angular
        .module('app')
        .factory('dataFactory', dataFactory);

    dataFactory.$inject = ['$http'];

    function dataFactory($http) {

        var urlBase = 'https://localhost:44308/api/EmployeeManage';
        var dataFactory = {};

        dataFactory.getCustomers = function () {
            return $http.get(urlBase);
        };

        //var service = {
        //    getData: getData
        //};



        //function getData() { }

        return service;
    }
})();