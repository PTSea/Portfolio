angular.module('map.controller', [])


.controller('MapCtrl', function($scope, $ionicLoading, $ionicPopup, $timeout, $rootScope, HazardEntriesModel) {
  //console.log("hello");
  var vm = this;

  // begin popup
  $scope.showPopup = function() {
    $scope.data = {};

    // An elaborate, custom popup
    var myPopup = $ionicPopup.show({
      template: '<input type="password" ng-model="data.wifi">',
      title: 'Enter Wi-Fi Password',
      subTitle: 'Please use normal things',
      scope: $scope,
      buttons: [
        { text: 'Cancel' },
        {
          text: '<b>Save</b>',
          type: 'button-positive',
          onTap: function(e) {
            if (!$scope.data.wifi) {
              //don't allow the user to close unless he enters wifi password
              e.preventDefault();
            } else {
              return $scope.data.wifi;
            }
          }
        }
      ]
    });

    myPopup.then(function(res) {
      console.log('Tapped!', res);
    });

    $timeout(function() {
       myPopup.close(); //close the popup after 10 seconds for some reason
    }, 10000);
   };




  //map
  $scope.mapCreated = function(map) {
    $scope.map = map;
  }; //end map

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

  // Triggered on a button click, or some other target

  // A confirm dialog



});
