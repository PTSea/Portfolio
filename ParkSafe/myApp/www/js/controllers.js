angular.module('SimpleRESTIonic.controllers', [])

    .controller('HazEntryCtrl', function (HazardEntriesModel, $rootScope) {
        var vm = this;

        function goToBackand() {
            window.location = 'http://docs.backand.com';
        }

        function getAll() {
            HazardEntriesModel.all()
                .then(function (result) {
                    vm.data = result.data.data;
                });
        }

        function clearData(){
            vm.data = null;
        }

        function create(object) {
            HazardEntriesModel.create(object)
                .then(function (result) {
                    cancelCreate();
                    getAll();
                });
        }

        function update(object) {
          HazardEntriesModel.update(object.id, object)
                .then(function (result) {
                    cancelEditing();
                    getAll();
                });
        }

        function deleteObject(id) {
          HazardEntriesModel.delete(id)
                .then(function (result) {
                    cancelEditing();
                    getAll();
                });
        }

        function initCreateForm() {
            vm.newObject = {hazardname: '', lat: '', lng: ''};
        }

        function setEdited(object) {
            vm.edited = angular.copy(object);
            vm.isEditing = true;
        }

        function isCurrent(id) {
            return vm.edited !== null && vm.edited.id === id;
        }

        function cancelEditing() {
            vm.edited = null;
            vm.isEditing = false;
        }

        function cancelCreate() {
            initCreateForm();
            vm.isCreating = false;
        }

        vm.objects = [];
        vm.edited = null;
        vm.isEditing = false;
        vm.isCreating = false;
        vm.getAll = getAll;
        vm.create = create;
        vm.update = update;
        vm.delete = deleteObject;
        vm.setEdited = setEdited;
        vm.isCurrent = isCurrent;
        vm.cancelEditing = cancelEditing;
        vm.cancelCreate = cancelCreate;
        vm.goToBackand = goToBackand;
        vm.isAuthorized = false;

        $rootScope.$on('authorized', function () {
            vm.isAuthorized = true;
            getAll();
        });

        $rootScope.$on('logout', function () {
            clearData();
        });

        if(!vm.isAuthorized){
            $rootScope.$broadcast('logout');
        }

        initCreateForm();
        getAll();

    })
    .controller('HazardCtrl', function (HazardsModel, $rootScope) {
      var vm = this;

      function goToBackand() {
        window.location = 'http://docs.backand.com';
      }

      function getAll() {
        HazardsModel.all()
          .then(function (result) {
            vm.data = result.data.data;
          });
      }

      function clearData(){
        vm.data = null;
      }

      function create(object) {
        HazardsModel.create(object)
          .then(function (result) {
            cancelCreate();
            getAll();
          });
      }

      function update(object) {
        HazardsModel.update(object.id, object)
          .then(function (result) {
            cancelEditing();
            getAll();
          });
      }

      function deleteObject(id) {
        HazardsModel.delete(id)
          .then(function (result) {
            cancelEditing();
            getAll();
          });
      }

      function initCreateForm() {
        vm.newObject = {hazardname: '', color: ''};
      }

      function setEdited(object) {
        vm.edited = angular.copy(object);
        vm.isEditing = true;
      }

      function isCurrent(id) {
        return vm.edited !== null && vm.edited.id === id;
      }

      function cancelEditing() {
        vm.edited = null;
        vm.isEditing = false;
      }

      function cancelCreate() {
        initCreateForm();
        vm.isCreating = false;
      }

      vm.objects = [];
      vm.edited = null;
      vm.isEditing = false;
      vm.isCreating = false;
      vm.getAll = getAll;
      vm.create = create;
      vm.update = update;
      vm.delete = deleteObject;
      vm.setEdited = setEdited;
      vm.isCurrent = isCurrent;
      vm.cancelEditing = cancelEditing;
      vm.cancelCreate = cancelCreate;
      vm.goToBackand = goToBackand;
      vm.isAuthorized = false;

      $rootScope.$on('authorized', function () {
        vm.isAuthorized = true;
        getAll();
      });

      $rootScope.$on('logout', function () {
        clearData();
      });

      if(!vm.isAuthorized){
        $rootScope.$broadcast('logout');
      }

      initCreateForm();
      getAll();

    })

    .controller('ParksCtrl', function (ParksModel, $rootScope) {
      var vm = this;

      function goToBackand() {
        window.location = 'http://docs.backand.com';
      }

      function getAll() {
        ParksModel.all()
          .then(function (result) {
            vm.data = result.data.data;
          });
      }

      function clearData(){
        vm.data = null;
      }

      function create(object) {
        ParksModel.create(object)
          .then(function (result) {
            cancelCreate();
            getAll();
          });
      }

      function update(object) {
        ParksModel.update(object.id, object)
          .then(function (result) {
            cancelEditing();
            getAll();
          });
      }

      function deleteObject(id) {
        ParksModel.delete(id)
          .then(function (result) {
            cancelEditing();
            getAll();
          });
      }

      function initCreateForm() {
        vm.newObject = {parkname: '', lat: '', lng: ''};
      }

      function setEdited(object) {
        vm.edited = angular.copy(object);
        vm.isEditing = true;
      }

      function isCurrent(id) {
        return vm.edited !== null && vm.edited.id === id;
      }

      function cancelEditing() {
        vm.edited = null;
        vm.isEditing = false;
      }

      function cancelCreate() {
        initCreateForm();
        vm.isCreating = false;
      }

      vm.objects = [];
      vm.edited = null;
      vm.isEditing = false;
      vm.isCreating = false;
      vm.getAll = getAll;
      vm.create = create;
      vm.update = update;
      vm.delete = deleteObject;
      vm.setEdited = setEdited;
      vm.isCurrent = isCurrent;
      vm.cancelEditing = cancelEditing;
      vm.cancelCreate = cancelCreate;
      vm.goToBackand = goToBackand;
      vm.isAuthorized = false;

      $rootScope.$on('authorized', function () {
        vm.isAuthorized = true;
        getAll();
      });

      $rootScope.$on('logout', function () {
        clearData();
      });

      if(!vm.isAuthorized){
        $rootScope.$broadcast('logout');
      }

      initCreateForm();
      getAll();

    });
