angular.module('SimpleRESTIonic.services', [])

    .service('APIInterceptor', function ($rootScope, $q) {
        var service = this;

        service.responseError = function (response) {
            if (response.status === 401) {
                $rootScope.$broadcast('unauthorized');
            }
            return $q.reject(response);
        };
    })

    .service('HazardsModel', function ($http, Backand) {
      var service = this,
        baseUrl = '/1/objects/',
        objectName = 'hazards/';

      function getUrl() {
        return Backand.getApiUrl() + baseUrl + objectName;
      }

      function getUrlForId(id) {
        return getUrl() + id;
      }

      service.all = function () {
        return $http.get(getUrl());
      };

      service.fetch = function (id) {
        return $http.get(getUrlForId(id));
      };

      service.create = function (object) {
        return $http.post(getUrl(), object);
      };

      service.update = function (id, object) {
        return $http.put(getUrlForId(id), object);
      };

      service.delete = function (id) {
        return $http.delete(getUrlForId(id));
      };
    })
    .service('ParksModel', function ($http, Backand) {
      var service = this,
        baseUrl = '/1/objects/',
        objectName = 'parks/';

      function getUrl() {
        return Backand.getApiUrl() + baseUrl + objectName;
      }

      function getUrlForId(id) {
        return getUrl() + id;
      }

      service.all = function () {
        return $http.get(getUrl());
      };

      service.fetch = function (id) {
        return $http.get(getUrlForId(id));
      };

      service.create = function (object) {
        return $http.post(getUrl(), object);
      };

      service.update = function (id, object) {
        return $http.put(getUrlForId(id), object);
      };

      service.delete = function (id) {
        return $http.delete(getUrlForId(id));
      };
    })

    .service('HazardEntriesModel', function ($http, Backand) {
        var service = this,
            baseUrl = '/1/objects/',
            objectName = 'hazardentries/';

        function getUrl() {
            return Backand.getApiUrl() + baseUrl + objectName;
        }

        function getUrlForId(id) {
            return getUrl() + id;
        }

        service.all = function () {
            return $http.get(getUrl());
        };

        service.fetch = function (id) {
            return $http.get(getUrlForId(id));
        };

        service.create = function (object) {
            return $http.post(getUrl(), object);
        };

        service.update = function (id, object) {
            return $http.put(getUrlForId(id), object);
        };

        service.delete = function (id) {
            return $http.delete(getUrlForId(id));
        };
    });
