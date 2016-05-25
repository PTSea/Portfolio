// Ionic template App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'SimpleRESTIonic' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
angular.module('SimpleRESTIonic', ['ionic', 'backand', 'SimpleRESTIonic.controllers', 'SimpleRESTIonic.services', 'map.controller', 'starter.directives'])

.run(function($ionicPlatform) {
    $ionicPlatform.ready(function() {
      // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
      // for form inputs)
      if (window.cordova && window.cordova.plugins && window.cordova.plugins.Keyboard) {
        cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
        cordova.plugins.Keyboard.disableScroll(true);

      }
      if (window.StatusBar) {
        // org.apache.cordova.statusbar required
        StatusBar.styleLightContent();
      }
    });
  })
  .config(function(BackandProvider, $stateProvider, $urlRouterProvider, $httpProvider) {

    BackandProvider.setAppName('parkrisk'); // change here to your app name
    //BackandProvider.setSignUpToken('4ce88904-75c5-412c-8365-df97d9e18a8f'); //token that enable sign up. see http://docs.backand.com/en/latest/apidocs/security/index.html#sign-up
    BackandProvider.setAnonymousToken('2697fbb8-ebd2-4ae8-82d6-1fee9b20800a'); // token is for anonymous login. see http://docs.backand.com/en/latest/apidocs/security/index.html#anonymous-access

    $stateProvider
    // setup an abstract state for the tabs directive
      .state('tab', {
      url: '/tabs',
      abstract: true,
      templateUrl: 'templates/tabs.html'
    })

    .state('map', {
        url: '/',
        abstract: true,
        templateUrl: 'templates/home.html'
      })
      .state('tab.parks', {
        url: '/parks',
        views: {
          'tab-parks': {
            templateUrl: 'templates/tab-parks.html',
            controller: 'ParksCtrl as vm'
          }
        }
      })
      .state('tab.hazards', {
        url: '/hazards',
        views: {
          'tab-hazards': {
            templateUrl: 'templates/tab-hazards.html',
            controller: 'HazardCtrl as vm'
          }
        }
      })
      .state('tab.hazentry', {
        url: '/hazentry',
        views: {
          'tab-hazentry': {
            templateUrl: 'templates/tab-hazentry.html',
            controller: 'HazEntryCtrl as vm'
          }
        }
      })


    .state('tab.home', {
      url: '/home',
      views: {
        'tab-home': {
          templateUrl: 'templates/home.html',
          controller: 'MapCtrl'
        }
      }
    });

    $urlRouterProvider.otherwise('/tabs/home');

    $httpProvider.interceptors.push('APIInterceptor');
  });

/*.run(function ($rootScope, $state, LoginService, Backand) {

    function unauthorized() {
        console.log("user is unauthorized, sending to login");
        $state.go('tab.login');
    }

    function signout() {
        LoginService.signout();
    }

    $rootScope.$on('unauthorized', function () {
        unauthorized();
    });

    $rootScope.$on('$stateChangeSuccess', function (event, toState) {
        if (toState.name == 'tab.login') {
            signout();
        }
        else if (toState.name != 'tab.login' && Backand.getToken() === undefined) {
            unauthorized();
        }
    });*/

/*})*/
