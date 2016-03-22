
// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
var app = angular.module('rrapp', ['ionic']);

app.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    if(window.cordova && window.cordova.plugins.Keyboard) {
      // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
      // for form inputs)
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);

      // Don't remove this line unless you know what you are doing. It stops the viewport
      // from snapping when text inputs are focused. Ionic handles this internally for
      // a much nicer keyboard experience.
      cordova.plugins.Keyboard.disableScroll(true);
    }
    if(window.StatusBar) {
      StatusBar.styleDefault();
    }
  });
});

//
app.config(function($stateProvider, $urlRouterProvider){

    $stateProvider.state('categories', {
        url: '/categories',
        templateUrl: 'templates/categories.html',
        controller: 'categoryController',
        factory: 'cat'
      })
      .state('subcategories',{
        url:'/categories/:id',
        templateUrl: 'templates/subcategories.html',
        controller: 'subcategoryController'
      })
      .state('businesses',{
        url:'/businesses/category/:category_id/subcategory/:subcategory_id',
        templateUrl: 'templates/businesses.html',
        controller: 'businessController'
      })
      .state('business_detail',{
      url:'/businesses/:business_id',
      templateUrl: 'templates/business_detail.html',
      controller: 'businessDetailController'
    });
    $urlRouterProvider.otherwise('/categories');

  });

// factory service calls out to api on server
// run this mobile project *locally*

// calculate distance between two points
function distance(lat1, lon1, lat2, lon2) {
  var radlat1 = Math.PI * lat1/180;
  var radlat2 = Math.PI * lat2/180;
  var theta = lon1-lon2;
  var radtheta = Math.PI * theta/180;
  var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
  dist = Math.acos(dist);
  dist = dist * 180/Math.PI;
  dist = dist * 60 * 1.1515;
  return (Math.round(dist * 100) / 100);
}

// controllers, first copy the json object from the response in the browser, ( just make a simple api call
// in the url bar ) then create a mock object similar to those below. After the app behavior is correct,
// create a service and use the json retreived from that
app.controller('categoryController',function($scope,$http){

    $http.get("http://ec2-54-200-134-246.us-west-2.compute.amazonaws.com/Reuse-and-Repair/web/index.php/categories")
      .then(function(response){
        $scope.categories = response.data;
        $scope.$apply();

        document.getElementById("splash").style.display = "none";

      }, function(err){
        console.error('Error ',err);
      });
      //open websites in system browser
      $scope.openLink = function(link) {
        window.open(link, '_system');
      }

}).controller('subcategoryController',function($scope,$http,$stateParams){
  // console.log($stateParams); <-- $stateParams is how you access the id for the selected list item
  $http.get("http://ec2-54-200-134-246.us-west-2.compute.amazonaws.com/Reuse-and-Repair/web/index.php/subcategories/category/"+$stateParams.id)
    .then(function(response){
      $scope.category_id = $stateParams.id;
      $scope.subcategories = response.data;
      $scope.$apply();

      document.getElementById("subcategories-spinner").style.visibility = "hidden";

    }, function(err){
      console.error('Error ',err);
    });

}).controller('businessController',function($scope,$http,$stateParams){
  // console.log($stateParams); <-- $stateParams is how you access the id for the selected list item
  $http.get("http://ec2-54-200-134-246.us-west-2.compute.amazonaws.com/Reuse-and-Repair/web/index.php/businesses/category/"+$stateParams.category_id+"/subcategory/"+$stateParams.subcategory_id)
    .then(function(response){

      var businesses = response.data;

      navigator.geolocation.getCurrentPosition(function(position) {

        //geolocation sorting
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;

        //calculate distance from current location
        for(var i = 0; i < businesses.length; i++)
        {
          if(businesses[i].address.geolocation == null)
            businesses[i]['dist'] = -1;
          else
          {
            var geo = businesses[i].address.geolocation.split(":");
            businesses[i]['dist'] = distance(latitude,longitude,geo[0],geo[1]);
          }
        }

        //sort businesses by distance
        businesses.sort(function(a, b) {
            return parseFloat(a.dist) - parseFloat(b.dist);
        });

        document.getElementById("businesses-spinner").style.visibility = "hidden";
        $scope.businesses = businesses;
        $scope.$apply();

      }, function(error) {

        document.getElementById("businesses-spinner").style.visibility = "hidden";
        $scope.businesses = businesses;
        $scope.$apply();

      },{timeout:2000});

    }, function(err){
      console.error('Error ',err);
    });
}).controller('businessDetailController',function($scope,$http,$stateParams){
  // console.log($stateParams); <-- $stateParams is how you access the id for the selected list item
  $http.get("http://ec2-54-200-134-246.us-west-2.compute.amazonaws.com/Reuse-and-Repair/web/index.php/businesses/"+$stateParams.business_id)
    .then(function(response){

      var business_info = response.data[0];
      $scope.business = business_info;

      if (business_info.address.street_number == null && business_info.address.street_name == null && business_info.address.city == null)
        $scope.address = false;
      else
        $scope.address = true;

      //open websites in system browser
      $scope.openLink = function(link) {
        window.open(link, '_system');
      }

      //Parse hours info
      if(business_info.hours.hours_entry != null)
        $scope.hours = business_info.hours.hours_entry.split(", ");

      //Parse phone number for link
      if(business_info.phone != null && business_info.phone != "")
      {
        var phonelink = business_info.phone.replace(/[^0-9]/g, "");
        if(phonelink.length == 10)
          phonelink = "1" + phonelink;

        $scope.phonelink = phonelink;
        $scope.dialNumber = function(number) {
          window.open('tel:' + number, '_system');
        }
      }

      var showMap = false;
      if(business_info.address.geolocation != null)
        showMap = true;

      $scope.showMap = showMap;

      document.getElementById("map").style.display = "none";

      //Display map
      if(showMap)
      {
        document.getElementById("map").style.display = "block";

        var geo = business_info.address.geolocation.split(":");
        $scope.geolink = geo[0] + "," + geo[1];

        var latlng = new google.maps.LatLng(geo[0], geo[1]);

        var mapOptions = {
            center: latlng,
            zoom: 16,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById("map"), mapOptions);

        new google.maps.Marker({
            position: new google.maps.LatLng(geo[0], geo[1]),
            map: map,
            title: business_info.name
        });

        $scope.map = map;
        $scope.$apply();
        $scope.openMap = function(url) {
          window.open(url, '_system', 'location=yes');
        }
      }

      //Get list of subcategories
      var subcategories = "";
      if(response.data[0].category.name == "Reuse")
        subcategories = "Accepts: ";
      else if(response.data[0].category.name == "Repair")
        subcategories = "Repairs: ";
      else
        subcategories = "Subcategories: ";

      $http.get("http://ec2-54-200-134-246.us-west-2.compute.amazonaws.com/Reuse-and-Repair/web/index.php/subcategories/business/"+$stateParams.business_id)
        .then(function(response){

          for(var i = 0; i < response.data.length; i++)
          {
            subcategories += response.data[i].name + ", ";
          }

          subcategories = subcategories.substring(0, subcategories.length - 2);

          $scope.subcategories = subcategories;
      }, function(err){
        console.error('Error ',err);
      });

    }, function(err){
      console.error('Error ',err);
    });
});

 /********DO NOT ERASE **********************MOCK CONTROLLERS********

app.controller('CategoryController',function($scope){
  $scope.categories=[{"id":"0","name":"Repair"},{"id":"1","name":"Reuse"}];

});

  app.controller('subcategoryController',function($scope){
    //  #/Reuse-and-Repair/web/index.php/subcategories/category/1
  //  console.log($scope);
    //if($scope.id == 1) {
      $scope.subcategories = [{"id": "44", "name": "Appli"}, {"id": "1", "name": "Appliances, Large"}, {
        "id": "2",
        "name": "Appliances, Small"
      }, {"id": "3", "name": "Art Supplies"}, {"id": "4", "name": "Bedding\/Bath"}, {
        "id": "5",
        "name": "Bikes\/Exercise\/Sporting\/Camping"
      }, {"id": "6", "name": "Books"}, {"id": "7", "name": "Brown Paper\/Large Shopping Bags"}, {
        "id": "8",
        "name": "Building Materials\/Home Improvement"
      }, {"id": "9", "name": "CDs, DVDs, LPs, Video Games, etc"}, {"id": "10", "name": "Cell Phones"}, {
        "id": "11",
        "name": "Children\u00e2\u20ac\u2122s Goods\/Clothing"
      }, {"id": "12", "name": "Clothing\/Accessories"}, {"id": "13", "name": "Computer Paper"}, {
        "id": "14",
        "name": "Computers\/Monitors"
      }, {"id": "15", "name": "Egg Cartons"}, {"id": "16", "name": "Eyeglasses"}, {
        "id": "17",
        "name": "Fabric"
      }, {"id": "18", "name": "Firewood"}, {"id": "20", "name": "Food (surplus garden produce)"}, {
        "id": "19",
        "name": "Food (unopened, pre-expired)"
      }, {"id": "21", "name": "Food Containers (clean glass\/plastic w\/lids)"}, {
        "id": "22",
        "name": "Furniture"
      }, {"id": "24", "name": "Garden Pots"}, {"id": "23", "name": "Garden\/Farm\/Landscaping"}, {
        "id": "25",
        "name": "Home Electronics"
      }, {"id": "26", "name": "Household Goods"}, {"id": "36", "name": "Lawn Equipment"}, {
        "id": "27",
        "name": "Medical Equipment\/Supplies"
      }, {"id": "28", "name": "Office Equipment"}, {"id": "29", "name": "Office Supplies"}, {
        "id": "30",
        "name": "Packing Materials"
      }, {"id": "31", "name": "Pet Supplies\/Food"}, {"id": "32", "name": "Printer Cartridge Refilling"}, {
        "id": "37",
        "name": "Reel Mowers"
      }, {"id": "38", "name": "Sandals"}, {"id": "33", "name": "School Supplies"}, {
        "id": "39",
        "name": "Screen Repair"
      }, {"id": "40", "name": "Shoes, Boots"}, {"id": "34", "name": "Toiletries"}, {
        "id": "41",
        "name": "Upholstery, Furniture"
      }, {"id": "35", "name": "Vehicles\/Parts"}];
   // }
});
  */
