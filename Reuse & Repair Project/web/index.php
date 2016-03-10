<?php
require_once __DIR__ .'/../vendor/autoload.php';

require('../server/CategoryHandler.php');
require('../server/SubcategoryHandler.php');
require('../server/BusinessHandler.php');
require('../server/AdminHandler.php');
require('../server/Authentication.php');
require('../server/password.php');

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Silex\Application;


$app = new Silex\Application();

$app['debug'] = true;

$app->after(function (Request $request, Response $response) {
   $response->headers->set('Access-Control-Allow-Origin', '*');
   // echo $response->headers;
});
// Request::setTrustedProxies(array($ip));

$app->GET('/', function (Application $app, Request $request) {

    return new Response("<p>All good!</p>", 200);
});


// Category Routes
// All categories
$app->GET('/categories', function (Application $app, Request $request) {

    $handler = New CategoryHandler();
    $result = $handler->getAll();
    
    return new Response($result, 200);
});

// Create category
$app->PUT('/categories', function (Application $app, Request $request) {
    
    if(!authenticate('2', null))
      return new Response('Unauthorized', 401);
    
    $handler = New CategoryHandler();
    $result = $handler->add($request->get('category_name'));
    
    return new Response($result['message'], $result['status_code']);
});

// Update category
$app->POST('/categories/{category_id}', function (Application $app, Request $request, $category_id) {

    if(!authenticate('2', null))
      return new Response('Unauthorized', 401);

    $object = array(
      'category_id' => $category_id,
      'new_category' => $request->get('category_name')
    );
    
    $handler = New CategoryHandler();
    $result = $handler->update($object);
    
    return new Response($result['message'], $result['status_code']);
});

// Destroy category
$app->DELETE('/categories/{category_id}', function (Application $app, Request $request, $category_id) {

    if(!authenticate('2', null))
      return new Response('Unauthorized', 401);
    
    $handler = New CategoryHandler();
    $result = $handler->delete($category_id);
    
    return new Response($result['message'], $result['status_code']);
});


// Subcategory routes
// All subcategories
$app->GET('/subcategories', function (Application $app, Request $request) {
    
    $handler = New SubcategoryHandler();
    $result = $handler->getAll();

    return new Response($result, 200);
});

// Get subcategories by categories
$app->GET('/subcategories/category/{category_id}', function (Application $app, Request $request, $category_id) {
    
    $handler = New SubcategoryHandler();
    $result = $handler->getByCategory($category_id);

    return new Response($result, 200);
});

// Get subcategories by business_id
$app->GET('/subcategories/business/{business_id}', function (Application $app, Request $request, $business_id) {
    
    $handler = New SubcategoryHandler();
    $result = $handler->getByBusiness($business_id);

    return new Response($result, 200);
});

// Create subcategory
$app->PUT('/subcategories', function (Application $app, Request $request) {
    
    if(!authenticate('2', null))
      return new Response('Unauthorized', 401);
    
    $handler = New SubcategoryHandler();
    $result = $handler->add($request->get('subcategory_name'));
    
    return new Response($result['message'], $result['status_code']);
});

// Update subcategory
$app->POST('/subcategories/{subcategory_id}', function (Application $app, Request $request, $subcategory_id) {
    
    if(!authenticate('2', null))
      return new Response('Unauthorized', 401);

    $object = array(
      'subcategory_id' => $subcategory_id,
      'new_subcategory' => $request->get('subcategory_name')
    );
    
    $handler = New SubcategoryHandler();
    $result = $handler->update($object);
    
    return new Response($result['message'], $result['status_code']);
});

// Delete subcategory
$app->DELETE('/subcategories/{subcategory_id}', function (Application $app, Request $request, $subcategory_id) {

    if(!authenticate('2', null))
      return new Response('Unauthorized', 401);
    
    $handler = New SubcategoryHandler();
    $result = $handler->delete($subcategory_id);
    
    return new Response($result['message'], $result['status_code']);
});


// Business routes
// All businesses
$app->GET('/businesses', function (Application $app, Request $request) {

    $handler = New BusinessHandler();
    $result = $handler->getAll();

    return new Response($result, 200);
});

// Get businesses by category
$app->GET('/businesses/category/{category_id}', function (Application $app, Request $request, $category_id) {

    $handler = New BusinessHandler();
    $result = $handler->getByCategory($category_id);

    return new Response($result, 200);
});

// Get businesses by category and subcategory
$app->GET('/businesses/category/{category_id}/subcategory/{subcategory_id}', function (Application $app, Request $request, $category_id, $subcategory_id) {
    $object = array(
      'category_id' => $category_id,
      'subcategory_id' => $subcategory_id
    );
    
    $handler = New BusinessHandler();
    $result = $handler->getByCategoryAndSubcategory($object);

    return new Response($result, 200);
});

// Create business
$app->PUT('/businesses', function (Application $app, Request $request) {

    if(!authenticate('3', null))
      return new Response('Unauthorized', 401);
    
    $object = array(
      'street_number' => $request->get('street_number'),
      'street_name' => $request->get('street_name'),
      'city' => $request->get('city'),
      'state' => $request->get('state'),
      'zip' => $request->get('zip'),
      'hours_entry' => $request->get('hours_entry'),
      'category_id' => $request->get('category_id'),
      'business_name' => $request->get('business_name'),
      'phone' => $request->get('phone'),
      'description' => $request->get('description'),
      'website' => $request->get('website'),
      'geolocation' => null
    );

    $handler = New BusinessHandler();
    $result = $handler->add($object);

    return new Response($result['message'], $result['status_code']);
});

// Get business by id
$app->GET('/businesses/{business_id}', function (Application $app, Request $request, $business_id) {

    $handler = New BusinessHandler();
    $result = $handler->get($business_id);

    return new Response($result, 200);
});

// Update business
$app->POST('/businesses/{business_id}', function (Application $app, Request $request, $business_id) {

    if(!authenticate('3', null))
      return new Response('Unauthorized', 401);
    
    $object = array(
      'business_id' => $business_id,
      'street_number' => $request->get('street_number'),
      'street_name' => $request->get('street_name'),
      'city' => $request->get('city'),
      'state' => $request->get('state'),
      'zip' => $request->get('zip'),
      'hours_entry' => $request->get('hours_entry'),
      'category_id' => $request->get('category_id'),
      'business_name' => $request->get('business_name'),
      'phone' => $request->get('phone'),
      'description' => $request->get('description'),
      'website' => $request->get('website'),
      'geolocation' => null
    );

    $handler = New BusinessHandler();
    $result = $handler->update($object);

    return new Response($result['message'], $result['status_code']);
});

// Destroy business
$app->DELETE('/businesses/{business_id}', function (Application $app, Request $request, $business_id) {

    if(!authenticate('3', null))
      return new Response('Unauthorized', 401);
    
    $handler = New BusinessHandler();
    $result = $handler->delete($business_id);
  
    return new Response($result['message'], $result['status_code']);
});


// Add subcategory to business
$app->PUT('/businesses/{business_id}/subcategory/{subcategory_id}', function (Application $app, Request $request, $business_id, $subcategory_id) {

    if(!authenticate('3', null))
      return new Response('Unauthorized', 401);
    
    $object = array(
      'business_id' => $business_id,
      'subcategory_id' => $subcategory_id
    );

    $handler = New BusinessHandler();
    $result = $handler->addSubcategory($object);

    return new Response($result['message'], $result['status_code']);
});

// Destroy subcategory from business
$app->DELETE('/businesses/{business_id}/subcategory/{subcategory_id}', function (Application $app, Request $request, $business_id, $subcategory_id) {

    if(!authenticate('3', null))
      return new Response('Unauthorized', 401);

    $object = array(
      'business_id' => $business_id,
      'subcategory_id' => $subcategory_id
    );
    
    $handler = New BusinessHandler();
    $result = $handler->deleteSubcategory($object);
  
    return new Response($result['message'], $result['status_code']);
});

// Update all subcategories to business
$app->POST('/businesses/{business_id}/subcategory', function (Application $app, Request $request, $business_id) {

    if(!authenticate('3', null))
      return new Response('Unauthorized', 401);
 
    $object = array(
      'business_id' => $business_id,
      'subcategories' => $request->get('subcategories')
    );

    $handler = New BusinessHandler();
    $result = $handler->addAllSubcategories($object);
    
    return new Response($result['message'], $result['status_code']);
});


// Admin routes
// All admin users
$app->GET('/admin', function (Application $app, Request $request) {
      
    $handler = New AdminHandler();
    $result = $handler->getAll();

    return new Response($result, 200);
});

// Get admin by auth
$app->GET('/adminlogin', function (Application $app, Request $request) {

    $admin_id = getAdminIdByLogin();
    
    if($admin_id == -1)
      return new Response('Unauthorized', 401);
       
    $handler = New AdminHandler();
    $result = $handler->get($admin_id);

    return new Response($result, 200);
});

// Get admin by id
$app->GET('/admin/{admin_id}', function (Application $app, Request $request, $admin_id) {
       
    $handler = New AdminHandler();
    $result = $handler->get($admin_id);

    return new Response($result, 200);
});

// Create admin
$app->PUT('/admin', function (Application $app, Request $request) {
    
    if(!authenticate('1', null))
      return new Response('Unauthorized', 401);

    $object = array(
      'username' => $request->get('username'),
      'password' => $request->get('password'),
      'first_name' => $request->get('first_name'),
      'last_name' => $request->get('last_name'),
      'email' => $request->get('email'),
      'role_id' => $request->get('role_id')
    );
    
    $handler = New AdminHandler();
    $result = $handler->add($object);
    
    return new Response($result['message'], $result['status_code']);
});

// Update admin
$app->POST('/admin/{admin_id}', function (Application $app, Request $request, $admin_id) {
    
    if(!authenticate('user', $admin_id))
      return new Response('Unauthorized', 401);

    $object = array(
      'admin_id' => $admin_id,
      'username' => $request->get('username'),
      'first_name' => $request->get('first_name'),
      'last_name' => $request->get('last_name'),
      'email' => $request->get('email')
    );
    
    $handler = New AdminHandler();
    $result = $handler->update($object);
    
    return new Response($result['message'], $result['status_code']);
});

// Update role
$app->POST('/admin/{admin_id}/role', function (Application $app, Request $request, $admin_id) {
    
    if(!authenticate('1', null))
      return new Response('Unauthorized', 401);

    $object = array(
      'admin_id' => $admin_id,
      'role_id' => $request->get('role_id')
    );
    
    $handler = New AdminHandler();
    $result = $handler->updateRole($object);
    
    return new Response($result['message'], $result['status_code']);
});

// Update password
$app->POST('/admin/{admin_id}/password', function (Application $app, Request $request, $admin_id) {
    
    if(!authenticate('user', $admin_id))
      return new Response('Unauthorized', 401);

    $object = array(
      'admin_id' => $admin_id,
      'password' => $request->get('password')
    );
    
    $handler = New AdminHandler();
    $result = $handler->updatePassword($object);
    
    return new Response($result['message'], $result['status_code']);
});

// Delete admin
$app->DELETE('/admin/{admin_id}', function (Application $app, Request $request, $admin_id) {

    if(!authenticate('1', null))
      return new Response('Unauthorized', 401);
    
    $handler = New AdminHandler();
    $result = $handler->delete($admin_id);
    
    return new Response($result['message'], $result['status_code']);
});



// optional geolocation in body
$app->GET('/businesses/{category}/{subcategory}', function (Application $app, Request $request, $subcategory) {


    return new Response('How about implementing businessRepairSubcategoryGet as a GET method ?');
});


$app->run();
