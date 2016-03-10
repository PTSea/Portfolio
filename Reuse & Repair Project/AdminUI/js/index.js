//JS FOR ELEMENT INITIALIZATION
$(document).ready(function(){
  //Current user info variables  
  var username = "";
  var password = "";
  var first_name = "";
  var last_name = "";
  var email = "";
  var admin_id = "";
  var role_id = "";
  var role_name = "";
  //var urlpath = "http://ec2-52-25-255-57.us-west-2.compute.amazonaws.com/Reuse-and-Repair/web/index.php"; //philip's url path
  //var urlpath = "http://ec2-54-200-134-246.us-west-2.compute.amazonaws.com/Reuse-and-Repair/web/index.php"; //brian's url path
  var urlpath ="/Reuse-and-Repair/web/index.php";
  $('select').material_select();
  
  //Login function - determines what user has access to based on user role
  function login() {
 
    $('#login-button').hide();
    $('#display-tabs').show();
    $('#admin-menu-title').html(username + "<i class='material-icons right'>arrow_drop_down</i>");
    $('#admin-menu').show();
    $('.card-admin-info').show();
     
    switch(role_id) {
      case "1": //Master admin
        $('.business-buttons').show();
        $('.subcategory-buttons').show();

        $('#fab-add').show();
        $('#add-subcategory-button').show();
        $('#add-business-button').show();
        $('#add-admin-button').show();
               
        $('#admin-content .card').addClass('medium');
        $('#admin-content .card').removeClass('small');  
        $('.card-admin-action').show();
        $('.deleteadminbutton').show();
        $('.changerolebutton').show();
        break;
      case "2": //Content admin
        $('.business-buttons').show();
        $('.subcategory-buttons').show();

        $('#fab-add').show();
        $('#add-subcategory-button').show();
        $('#add-business-button').show();
        $('#add-admin-button').hide();
               
        $('#admin-content .card').addClass('small');
        $('#admin-content .card').removeClass('medium');  
        $('.card-admin-action').hide();
        $('.deleteadminbutton').hide();
        $('.changerolebutton').hide();
        break;
      case "3": //Business admin
        $('.business-buttons').show();
        $('.subcategory-buttons').hide();

        $('#fab-add').show();
        $('#add-subcategory-button').hide();
        $('#add-business-button').show();
        $('#add-admin-button').hide();
               
        $('#admin-content .card').addClass('small');
        $('#admin-content .card').removeClass('medium');  
        $('.card-admin-action').hide();
        $('.deleteadminbutton').hide();
        $('.changerolebutton').hide();
        break;
      default: //Read-only admin
        $('.business-buttons').hide();
        $('.subcategory-buttons').hide();

        $('#fab-add').hide();
        $('#add-subcategory-button').hide();
        $('#add-business-button').hide();
        $('#add-admin-button').hide();
               
        $('#admin-content .card').addClass('small');
        $('#admin-content .card').removeClass('medium');  
        $('.card-admin-action').hide();
        $('.deleteadminbutton').hide();
        $('.changerolebutton').hide();
        break;
    }
  }
  
  //Logout function
  function logout() {
    $('#login-button').show();
    $('#admin-menu').hide();
    $('#fab-add').hide();
    $('#display-tabs').hide();  
    $('#subcategories').hide();
    $('#businesses').show();
    $('.business-buttons').hide();
    $('.subcategory-buttons').hide();   
    
    $('#admin-content .card').addClass('small');
    $('#admin-content .card').removeClass('medium');
    $('.card-admin-info').hide();
    $('.card-admin-action').hide();
    $('.deleteadminbutton').hide();
    $('.changerolebutton').hide();
    
    //Clear user variables
    var username = "";
    var password = "";
    var first_name = "";
    var last_name = "";
    var email = "";
    var admin_id = "";
    var role_id = "";
    var role_name = "";
    
    popup("Logged out");
  }

  //Popup function
  function popup(message){
  //Materialize.toast(message, 5000);
    $('#popup-message').html(message);
    $('#modal-popup').openModal();  
    $('#modal-popup').delay(5000).fadeOut(1000).closeModal();   
  }

	//--------------CODE FOR ADMINS PAGE--------------//
  //Generate admin card and add to adminpage
  function addAdminCard(card_admin_id, card_username, card_rolename, card_firstname, card_lastname, card_email) {

    if(card_firstname == null)
      card_firstname = "";
    if(card_lastname == null)
      card_lastname = "";
    if(card_email == null)
      card_email = ""; 
  
    var cardhtml = "<div id='card_admin_id_" + card_admin_id + "' class='col s12 m6 l4'><div class='card small'><div class='card-image waves-effect waves-block waves-light'><img class='activator' src='../AdminUI/background4.jpg'><span id='card_title_" + card_admin_id + "' class='card-title'>" + card_firstname + " " + card_lastname + "</span></div><div class='card-content'><div style='padding-left:10px;'><span class='hidden card-admin-info'>Username: " + card_username + "<br>Role: <span id='card_admin_role_" + card_admin_id + "'>" + card_rolename + "</span><br></span>";
  
    if(card_email != "")
      cardhtml += "Email: <span id='card_email_" + card_admin_id + "'>" + card_email + "</span>";
    
    cardhtml += "</div></div><div class='card-action center-align card-admin-action hidden'><button value='" + card_admin_id + "' class='hidden changerolebutton waves-effect waves-teal btn-flat teal-text text-darken-2'>Change Role</button><button value='" + card_admin_id + "' class='hidden deleteadminbutton waves-effect waves-teal btn-flat teal-text text-darken-2'>Delete</button></div></div></div>"
  
    $("#admin-content").append(cardhtml);
  }
  
  //Add all admins to page
  function populateAdmins(){
    
    //Get list of admin users and add admin cards
    $.ajax
    ({    
      type: "GET",
      url: urlpath + "/admin",
      dataType: 'json',
      async: true,
      success: function (data){
        for (var i = 0; i < data.length; i++) {
          addAdminCard(data[i].admin_id, data[i].username, data[i].role.role_name, data[i].first_name, data[i].last_name, data[i].email);
        }
      }
    });
  }
  
  populateAdmins();
  
  //Populate all select subcategories
  function populateSelectSubcategories(){
    $.ajax
    ({    
      type: "GET",
      url: urlpath + "/subcategories",
      dataType: 'json',
      async: true,
      success: function (data){
        $('#addbusiness-subcategories').empty();
        $('#editbusiness-subcategories').empty();
        $('#displaybusiness-subcategories').empty();
      
        $('#addbusiness-subcategories').append('<option value="" disabled selected>Subcategories</option>');
        $('#editbusiness-subcategories').append('<option value="" disabled selected>Subcategories</option>');
        $('#displaybusiness-subcategories').append('<option value="0" selected>All Subcategories</option>');
    
        var selecthtml = '';
        
        for(var i = 0; i < data.length; i++)
        {
          selecthtml += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
        }
        $('#addbusiness-subcategories').append(selecthtml);
        $('#editbusiness-subcategories').append(selecthtml);
        $('#displaybusiness-subcategories').append(selecthtml);
        $('select').material_select();
      }
    });
  }
  
  populateSelectSubcategories();
  
	//--------------CODE FOR VIEW BUSINESSES PAGE--------------//
  //Business table
  function displayBusinesses() {
    //Clear list
    $("#displaybusinesslist").empty();
    
    //Get filters
    var db_businesstype = $("#displaybusiness-businesstype").val();
    var db_subcategories = $("#displaybusiness-subcategories").val();
    var geturl = "";
    
    //Generate url
    if(db_businesstype == "0")
      geturl = "/businesses";
    else if (db_businesstype != "0" && db_subcategories == "0")
      geturl = "/businesses/category/" + db_businesstype;
    else if (db_businesstype != "0" && db_subcategories != "0")
      geturl = "/businesses/category/" + db_businesstype + "/subcategory/" + db_subcategories;

 		var firstletterct = 0;
		var firstletter;
		var prevletter;
		var letterholder;
    //Get businesses
  	$.getJSON(urlpath + geturl, function(obj) {
  		$.each(obj, function(key, value) {
  			prevletter = firstletter;
  			console.log(prevletter);
  			firstletter = value.name.substring(0,1).toUpperCase();
  			//console.log(firstletter):
  			if (firstletter == prevletter) {
  				firstletterct++;
  			}
  			else {
  				firstletterct = 0;
  			}
  			if (firstletterct == 0) {
  				letterholder = firstletter;
  			}
  			else if (firstletterct > 0) {
  				letterholder = "    ";
  			}
        var businesshtml = "<tr id='list_business_id_" + value.id + "'><td class='alphaheader'>" + letterholder + "</td><td id='bus_id_" + value.id + "' class='viewbusinessbutton' style='width:100%;'>" + value.name + "<br>";
        
        if(value.address.street_number != null && value.address.street_name != null)
        {
          businesshtml += value.address.street_number + " " + value.address.street_name;
          if(value.phone != null)
            businesshtml += " - ";
        }
        
        if (value.phone != null)
            businesshtml += value.phone;
        
        businesshtml += "</td><td class='hidden business-buttons'><button value='" + value.id + "' class='editbusinessbutton waves-effect waves-teal btn-flat teal-text text-darken-2'>EDIT</button></td><td class='hidden business-buttons'><button value='" + value.id + "' class='deletebusinessbutton waves-effect waves-teal btn-flat teal-text text-darken-2'>DELETE</button></td></tr>";
                
        $("#displaybusinesslist").append(businesshtml);
  		});
     
      //Show buttons if user has access
      if(role_id == "1" || role_id == "2" || role_id == "3")
        $('.business-buttons').show();
  	})
  }
  
  displayBusinesses();
  
  //Filter business list on select change for business type
  $('#displaybusiness-businesstype').change(function() {

    if($("#displaybusiness-businesstype").val() != "0")
      $('#displaybusiness-subcategories').removeAttr("disabled");
    else
      $('#displaybusiness-subcategories').attr("disabled", "disabled");
    
    $('select').material_select();
    
    displayBusinesses();
  });
  
  //Filter business list on select change for subcategories
  $('#displaybusiness-subcategories').change(function() {
    
    displayBusinesses();
  });

  //Subcategories table
  function displaySubcategories() {
  
    $("#displaysubcategorylist").empty();
    
    var ds_businesstype = $("#displaysubcategories-businesstype").val();
    var geturl = "";
    
    //Generate url
    if(ds_businesstype == "0")
      geturl = "/subcategories";
    else if (ds_businesstype != "0")
      geturl = "/subcategories/category/" + ds_businesstype;
      
    var firstletterct = 0;
		var firstletter;
		var prevletter;
		var letterholder;
    //Get subcategories
    $.getJSON(urlpath + geturl, function(obj) {
    	$.each(obj, function(key, value) {
    		prevletter = firstletter;
    		console.log(prevletter);
    		firstletter = value.name.substring(0,1).toUpperCase();
    		//console.log(firstletter):
    		if (firstletter == prevletter) {
    			firstletterct++;
    		}
    		else {
    			firstletterct = 0;
    		}
    		if (firstletterct == 0) {
    			letterholder = firstletter;
    		}
    		else if (firstletterct > 0) {
    			letterholder = " ";
    		}
    		$("#displaysubcategorylist").append("<tr id='list_subcategory_id_" + value.id + "'><td class='alphaheader'>" + letterholder + "</td><td id='list_subcategory_td_id_" + value.id + "' style='width:100%;'>" + value.name + "</td><td class='hidden subcategory-buttons'><button value='" + value.id + "' class='editsubcategorybutton waves-effect waves-teal btn-flat teal-text text-darken-2'>EDIT</button></td><td class='hidden subcategory-buttons'><button value='" + value.id + "' class='deletesubcategorybutton waves-effect waves-teal btn-flat teal-text text-darken-2'>DELETE</button></td></tr>");
    	});
      if(role_id == "1" || role_id == "2")
        $('.subcategory-buttons').show();
    })
  }

  displaySubcategories();

  //Filter subcategory list on select change for business type
  $('#displaysubcategories-businesstype').change(function() {
    
    displaySubcategories();
  });
  
	//------------------------MODAL INITIALIZATIONS------------------------//
	//--------------MODAL CODE FOR BUSINESS TABLE--------------//
  var selected_business_id;
  //--------------MODAL CODE FOR VIEW BUSINESS--------------//  
  $("#displaybusinesslist").on("click", ".viewbusinessbutton", function(){
    selected_business_id = this.id;
    selected_business_id = selected_business_id.substring(7);

    $.ajax
    ({    
      type: "GET",
      url: urlpath + "/businesses/" + selected_business_id,
      dataType: 'json',
      async: false,
      success: function (data){
        //Generate html code for business info
        var viewbusinesshtml = "<div class='row'><div class='col s12 m12 l12'><h5>" + data[0].name + "</h5><br>Category: ";
        
        if(data[0].category.name == null) 
          viewbusinesshtml += "None";
        else
          viewbusinesshtml += data[0].category.name;
     
        viewbusinesshtml += "</div></div>";

        if(data[0].address.address_id != null || data[0].phone != null)
        {
          viewbusinesshtml += "<div class='row'>";
          
          if(data[0].address.address_id != null)
          {
            viewbusinesshtml += "<div class='col s6 m6 l6'>";
            if(data[0].address.street_number != null)
              viewbusinesshtml += data[0].address.street_number + " ";
            if(data[0].address.street_name != null)
              viewbusinesshtml += data[0].address.street_name + " ";
            viewbusinesshtml += "<br>";
            if(data[0].address.city != null)
              viewbusinesshtml += data[0].address.city + ", ";
            if(data[0].address.state != null)
              viewbusinesshtml += data[0].address.state + " ";
            if(data[0].address.zip != null)
              viewbusinesshtml += data[0].address.zip;
            viewbusinesshtml += "</div>";
          }
          if(data[0].phone != null)
          {
            viewbusinesshtml += "<div class='col s6 m6 l6'>" + data[0].phone + "</div>";
          }
          viewbusinesshtml += "</div>";
        }

        if(data[0].website != null)
          viewbusinesshtml += "<div class='row'><div class='col s12 m12 l12'><a href='" + data[0].website + "'>" + data[0].website + "</a></div></div>";

        if(data[0].hours.hours_entry != null)
          viewbusinesshtml += "<div class='row'><div class='col s12 m12 l12'>" + data[0].hours.hours_entry + "</div></div>";
          
        if(data[0].description != null)
          viewbusinesshtml += "<div class='row'><div class='col s12 m12 l12'>Description: " + data[0].description + "</div></div>";
        
        //Add subcategories
        $.ajax
        ({    
          type: "GET",
          url: urlpath + "/subcategories/business/" + selected_business_id,
          dataType: 'json',
          async: false,
          success: function (data){
            if(data.length > 0)
            {
              viewbusinesshtml += "<div class='row'><div class='col s12 m12 l12'>Subcategories: ";
              
              for(var i = 0; i < data.length; i++)
              {
                viewbusinesshtml += data[i].name + ", ";
              }
              viewbusinesshtml = viewbusinesshtml.substring(0, viewbusinesshtml.length - 2);
              viewbusinesshtml += "</div>";
            }
          }
        }); 
        
        $('#business-info').append(viewbusinesshtml);
        
        //Add google map
        if(data[0].address.geolocation != null)
        {
          $('#modal-view-business').addClass("viewbusinessmodal");
          $('#business-info').removeClass("s12");
          $('#business-info').addClass("s6");
          //Parse geolocation info
          var geo = data[0].address.geolocation.split(":");
          $('#map').append("<iframe width='100%' height='330px' frameborder='0' style='border:0' src='http://maps.google.com/maps?q=" + geo[0] + "," + geo[1] + "&z=15&output=embed'></iframe>");
        }
        else
        {
          $('#modal-view-business').removeClass("viewbusinessmodal");
          $('#business-info').removeClass("s6");
          $('#business-info').addClass("s12");
        }
      }
    });          
     
     //Open view business modal     
     $('#modal-view-business').openModal({         
        complete: function() {
          $('#business-info').empty();
          $('#map').empty();
        }   
    });
  });
 
  //Close view business modal form with click of X icon
	$('#modal-view-business .modalclosex').click(function() {
		$('#modal-view-business').closeModal({
	      out_duration: 200,
		});
    $('#business-info').empty();
    $('#map').empty();
	});
 
  //--------------MODAL CODE FOR EDIT BUSINESS--------------//
  $("#displaybusinesslist").on("click", ".editbusinessbutton", function(){
    selected_business_id = $(this).val();
    
    //Get business info
    $.ajax
    ({
      type: "GET",
      url: urlpath + "/businesses/" + selected_business_id,
      dataType: 'json',
      async: false,
      success: function (data){
        $('#modal-edit-business').openModal({
          ready: function() {
            //Populate modal with business info
            $("#editbusiness-name").val(data[0].name);
            $("#editbusiness-phone").val(data[0].phone);
            $("#editbusiness-streetnumber").val(data[0].address.street_number);
            $("#editbusiness-streetname").val(data[0].address.street_name);
            $("#editbusiness-website").val(data[0].website);
            $("#editbusiness-city").val(data[0].address.city);
            $("#editbusiness-state").val(data[0].address.state);
            $("#editbusiness-zip").val(data[0].address.zip);
            $("#editbusiness-hours").val(data[0].hours.hours_entry);
            $("#editbusiness-businesstype").val(data[0].category.id);
            $("#editbusiness-desc").val(data[0].description);
            //Populate subcategories
            $.ajax
            ({    
              type: "GET",
              url: urlpath + "/subcategories/business/" + selected_business_id,
              dataType: 'json',
              async: false,
              success: function (data){
                var subcategories = "";
                
                for(var i = 0; i < data.length; i++)
                {
                  $("#editbusiness-subcategories [value='" + data[i].id + "']").prop("selected", true);
                }
              }
            }); 
            Materialize.updateTextFields();
            $('select').material_select();
          },
          complete: function() {
            document.getElementById('edit-business-form').reset();
            $("#edit-business-error").html("");
          }   
        });
      }
    });
  });

  //Submit action
  $('#edit-business-submit').click(function() {
    //Get info from modal
    var eb_name = $("#editbusiness-name").val();
    var eb_phone = $("#editbusiness-phone").val();
    var eb_streetnumber = $("#editbusiness-streetnumber").val();
    var eb_streetname = $("#editbusiness-streetname").val();
    var eb_website = $("#editbusiness-website").val();
    var eb_city = $("editbusiness-city").val();
    var eb_state = $("#editbusiness-state").val();
    var eb_zip = $("#editbusiness-zip").val();
    var eb_hours = $("#editbusiness-hours").val();
    var eb_businesstype = $("#editbusiness-businesstype").val();
    var eb_subcategories = $("#editbusiness-subcategories").val();
    var eb_desc = $("#editbusiness-desc").val();

    //Create data object for request
    var eb_data = {
      'category_id' : eb_businesstype,
      'business_name' : eb_name,
      'phone' : eb_phone,
      'street_number' : eb_streetnumber,
      'street_name' : eb_streetname,
      'website' : eb_website,
      'city' : eb_city,
      'state' : eb_state,
      'zip' : eb_zip,
      'hours_entry' : eb_hours,
      'description' : eb_desc
    };

    $.ajax
    ({
      type: "POST",
      url: urlpath + "/businesses/" + selected_business_id,
      data: eb_data,
      async: false,
      beforeSend: function (xhr) {
          xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));
      },
      success: function (){
        //Successful business update
        displayBusinesses();
        
        //Parse subcategory object to string for API
        var eb_subcategories_str = JSON.stringify(eb_subcategories);
        eb_subcategories_str = eb_subcategories_str.replace(/[\[\]\"]+/g,'');
        
        //Add subcategories
        $.ajax
        ({    
          type: "POST",
          url: urlpath + "/businesses/" + selected_business_id + "/subcategory",
          data: {
            'subcategories' : eb_subcategories_str
          },
          async: true,
          beforeSend: function (xhr) {
              xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));
          },
          success: function (){
              //Successful add subcategories
          }
        });

        //Clear input      
        document.getElementById('edit-business-form').reset();
        $("#edit-business-error").html("");
        $("#modal-edit-business").closeModal();

        popup("Business updated");
      },
      error: function () {
        $("#edit-business-error").html("Error: Business not updated");
      }
    });   
  });
  
  //Close edit business modal form with click of X icon
	$('#modal-edit-business .modalclosex').click(function() {
		$('#modal-edit-business').closeModal({
	      out_duration: 200,
		});
    document.getElementById('edit-business-form').reset();
    $("#edit-business-error").html("");
	});
 
	//--------------MODAL CODE FOR DELETING BUSINESS--------------//
  $("#displaybusinesslist").on("click", ".deletebusinessbutton", function(){
    selected_business_id = $(this).val();
    
    $('#modal-delete-business').openModal();
  });

  //Submit action
  $('#delete-business-submit').click(function() {

    $.ajax
    ({    
      type: "DELETE",
      url: urlpath + "/businesses/" + selected_business_id,
      async: false,
      beforeSend: function (xhr) {
          xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));
      },
      success: function (){
        //Successful delete
        displayBusinesses();
        
        $("#modal-delete-business").closeModal();
        
        popup("Business deleted");
      }
    });
  });

  //Cancel action
  $('#delete-business-cancel').click(function() {
  	$('#modal-delete-business').closeModal({
        out_duration: 200,
  	});
  });
  
	//--------------MODAL CODE FOR SUBCATEGORY TABLE--------------//
  var selected_subcategory_id;

  //--------------MODAL CODE FOR EDIT SUBCATEGORY--------------//
  $("#displaysubcategorylist").on("click", ".editsubcategorybutton", function(){
    selected_subcategory_id = $(this).val();

    $('#modal-edit-subcategory').openModal({
      ready: function() {
        //Populate modal with subcategory info
        $("#editsub-subcategory").val(document.getElementById("list_subcategory_td_id_" + selected_subcategory_id).innerText);
        Materialize.updateTextFields();
      },
      complete: function() {
        document.getElementById('edit-subcategory-form').reset();
        $("#edit-subcategory-error").html("");
      }   
    });
  });

  //Submit action
  $('#edit-subcategory-submit').click(function() {
    //Get subcategory info from modal
    var es_name = $("#editsub-subcategory").val();

    if(es_name == '')
      $("#edit-subcategory-error").html("Please enter a subcategory name");
    else
    {
      $.ajax
      ({
        type: "POST",
        url: urlpath + "/subcategories/" + selected_subcategory_id,
        data: {
          'subcategory_name' : es_name
        },
        async: false,
        beforeSend: function (xhr) {
            xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));
        },
        success: function (){
          //Successful business update
          
          displaySubcategories();
          populateSelectSubcategories();
          
          //Clear input      
          document.getElementById('edit-subcategory-form').reset();
          $("#edit-subcategory-error").html("");
          $("#modal-edit-subcategory").closeModal();
  
          popup("Subcategory updated");
        },
        statusCode: {
          409: function () {
            $("#edit-subcategory-error").html("Subcategory already exists")
          }        
        },
        error: function () {
          $("#edit-subcategory-error").html("Error: Subcategory not updated");
        }
      });
    }
  });
  
  //Close edit business modal form with click of X icon
	$('#modal-edit-subcategory .modalclosex').click(function() {
		$('#modal-edit-subcategory').closeModal({
	      out_duration: 200,
		});
    document.getElementById('edit-subcategory-form').reset();
    $("#edit-subcategory-error").html("");
	});
 
	//--------------MODAL CODE FOR DELETING SUBCATEGORY--------------//
  $("#displaysubcategorylist").on("click", ".deletesubcategorybutton", function(){
    selected_subcategory_id = $(this).val();
    
    $('#modal-delete-subcategory').openModal();
  });

  //Submit action
  $('#delete-subcategory-submit').click(function() {

    $.ajax
    ({    
      type: "DELETE",
      url: urlpath + "/subcategories/" + selected_subcategory_id,
      async: false,
      beforeSend: function (xhr) {
          xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));
      },
      success: function (){
        //Successful delete
        displaySubcategories();
        populateSelectSubcategories();
        
        $("#modal-delete-subcategory").closeModal();
        
        popup("Subcategory deleted");
      }
    });
  });

  //Cancel action
  $('#delete-subcategory-cancel').click(function() {
  	$('#modal-delete-subcategory').closeModal({
        out_duration: 200,
  	});
  });
 
	//--------------MODAL CODE FOR ADMIN LOGIN--------------//
	//Initialize login button at top right corner
  $('#login-button').click(function() { 
    $('#modal-login').openModal({
      complete: function() {
        //Clear input
        document.getElementById('admin-login-form').reset();
        $("#login-error").html("");
      }
    });
  });

  //Login submit
	$('#login-submit').click(function() {
    username = $("#login-username").val();
    password = $("#login-password").val();
    
    //Check for password/username entry
    if(username == "" || password == "")
      $("#login-error").html("Please enter username and password");
    else
    {
      $.ajax
      ({    
        type: "GET",
        url: urlpath + "/adminlogin",
        dataType: 'json',
        async: false,
        beforeSend: function (xhr) {
            xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));
        },
        success: function (data){
          //Store user info
          first_name = data[0].first_name;
          last_name = data[0].last_name;
          email = data[0].email;
          admin_id = data[0].admin_id;
          role_id = data[0].role.role_id;
          role_name = data[0].role.role_name;
      
          //Generate welcome message
          var welcome_message;
          
          if(first_name == null)
            welcome_message = "Welcome Admin";
          else
            welcome_message = "Welcome " + first_name;
      
          //Clear input
          document.getElementById('admin-login-form').reset();
          $("#login-error").html("");
          
          $("#modal-login").closeModal();
          
          popup(welcome_message);
          
          //Login user
          login();
        },
        error: function (){
          $("#login-error").html("Unauthorized");
        }
      });
    }
	});
 
	//Close modal if dismiss is clicked
	$('#modal-popup .dismissit').click(function() {			
		$('#modal-popup').closeModal({
	      out_duration: 800,
		});
    document.getElementById('admin-login-form').reset();
	});

  //Logout button action
  $('#logout-button').click(function() {
    logout();
  });

  //--------------MODAL CODE FOR ACCOUNT--------------//
	$('#account-button').click(function() {
    $("#modal-account").openModal({
      ready: function() {
        //Populate modal with account info
        $("#account-username").val(username);
        $("#account-adminrole").val(role_name);
        $("#account-firstname").val(first_name);
        $("#account-lastname").val(last_name);
        $("#account-email").val(email);
        Materialize.updateTextFields();
      },
      complete: function() {
        document.getElementById('admin-account-form').reset();
      }
    });
  });

  //Submit action
  $('#update-account-submit').click(function() {
    var new_firstname = $("#account-firstname").val();
    var new_lastname = $("#account-lastname").val();
    var new_email = $("#account-email").val();
    
    $.ajax
    ({    
      type: "POST",
      url: urlpath + "/admin/" + admin_id,
      data: {
        'first_name' : new_firstname,
        'last_name' : new_lastname,
        'email' : new_email
      },
      async: false,
      beforeSend: function (xhr) {
          xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));
      },
      success: function (){
        //Successful account update
        //Edit user's card info
        document.getElementById('card_title_' + admin_id).innerHTML = new_firstname + " " + new_lastname;
        document.getElementById('card_email_' + admin_id).innerHTML = new_email;

        //Clear input
        document.getElementById('admin-account-form').reset();
        
        //Change user info
        first_name = new_firstname;
        last_name = new_lastname;
        email = new_email;
        
        $("#modal-account").closeModal();

        popup("Account updated");
      }
    });   
  });

  //Close account modal form with click of X icon
	$('#modal-account .modalclosex').click(function() {
		$('#modal-account').closeModal({
	      out_duration: 200,
		});
    document.getElementById('admin-account-form').reset();
	});
 
  //--------------MODAL CODE FOR CHANGE PASSWORD--------------//
 	$('#change-password-button').click(function() {
    $("#modal-change-password").openModal({
      complete: function() {
        document.getElementById('change-password-form').reset();
        $("#change-password-error").html("");
      }
    });
  });
  
  $('#change-password-submit').click(function() {
    var old_password = $("#pwchange-password").val();
    var new_password1 = $("#pwchange-newpassword1").val();
    var new_password2 = $("#pwchange-newpassword2").val();
    
    //Validate input
    if(old_password == "" || new_password1 == "" || new_password2 == "")
      $("#change-password-error").html("Please enter fields");
    else if(password != old_password)
      $("#change-password-error").html("Invalid password");
    else if(new_password1 != new_password2)
      $("#change-password-error").html("Passwords do not match");
    else
    { 
      $.ajax
      ({    
        type: "POST",
        url: urlpath + "/admin/" + admin_id + "/password",
        data: {'password' : new_password1},
        async: false,
        beforeSend: function (xhr) {
            xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));
        },
        success: function (){
          //Successful password update
          //Store new password
          password = new_password1;
          
          //Clear input
          document.getElementById('change-password-form').reset();
          $("#change-password-error").html("");
                    
          $("#modal-change-password").closeModal();

          popup("Password updated");
        },
        error: function (){
          $("#change-password-error").html("Error: Password not updated");
        }
      });
    }
  });

  //Close account modal form with click of X icon
	$('#modal-change-password .modalclosex').click(function() {
		$('#modal-change-password').closeModal({
	      out_duration: 200,
		});
    document.getElementById('change-password-form').reset();
    $("#change-password-error").html("");
	});

	//--------------MODAL CODE FOR CHANGING USER ROLE--------------//
  var selected_admin_id;
  
  $("#admin-content").on("click", ".changerolebutton", function(){
    selected_admin_id = $(this).val();
    
    $('#modal-change-role').openModal({
      complete: function() {
        document.getElementById('change-role-form').reset();
      }
    });
  });
 
  //Submit action
  $('#change-role-submit').click(function() {
    var selected_role_id = $('input[name = "role-group"]:checked').val();
    
    $.ajax
    ({    
      type: "POST",
      url: urlpath + "/admin/" + selected_admin_id +  "/role",
      data: {'role_id' : selected_role_id},
      async: false,
      beforeSend: function (xhr) {
          xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));
      },
      success: function (){
        //Successful role update
        var card_admin_role = "card_admin_role_" + selected_admin_id;
        var card_role_name;
        
        //Edit user card info
        switch(selected_role_id) {
          case "1":
            card_role_name = "Master admin";
            break;
          case "2":
            card_role_name = "Content management admin";
            break;
          case "3":
            card_role_name = "Business admin";
            break;
          case "4":
            card_role_name = "Read-only admin";
            break;
        }
        
        document.getElementById(card_admin_role).innerHTML = card_role_name;
        
        //If user edited own info, re-login
        if(selected_admin_id == admin_id)
        {
          role_id = selected_role_id;
          login();
        }
        
        //Clear input
        document.getElementById('change-role-form').reset();
        
        $("#modal-change-role").closeModal();
        
        popup("Role updated");
      }
    });
  });
 
  //Close add change role modal form with click of X icon
  $('#modal-change-role .modalclosex').click(function() {
  	$('#modal-change-role').closeModal({
        out_duration: 200,
  	});
    document.getElementById('change-role-form').reset();
  });
 
 	//--------------MODAL CODE FOR DELETING USER--------------//
  $("#admin-content").on("click", ".deleteadminbutton", function(){
    selected_admin_id = $(this).val();
      
    $('#modal-delete-user').openModal();
  });

  //Submit action
  $('#delete-user-submit').click(function() {
  
    $.ajax
    ({    
      type: "DELETE",
      url: urlpath + "/admin/" + selected_admin_id,
      async: false,
      beforeSend: function (xhr) {
          xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));
      },
      success: function (){
        //Successful delete
        var card_admin_id = "card_admin_id_" + selected_admin_id;
       
        //Remove card from admin page
        document.getElementById(card_admin_id).style.display = "none";
        
        //If user deleted self, logout
        if(selected_admin_id == admin_id)
          logout();
            
        $("#modal-delete-user").closeModal();
        
        popup("Admin deleted");
      }
    });
  });

  //Cancel action
  $('#delete-user-cancel').click(function() {
  	$('#modal-delete-user').closeModal({
        out_duration: 200,
  	});
  });

	//--------------MODAL CODE FOR ADDING USER--------------//
  $("#add-admin-button").click(function() {
    
    $('#modal-add-admin').openModal({
      complete: function() {
        document.getElementById('add-admin-form').reset();
        $("#add-admin-error").html("");
      }
    });
  }); 
  
  //Submit action
  $("#add-admin-submit").click(function() {
    //Get admin info from modal
    var aa_username = $("#addadmin-username").val();
    var aa_adminrole = $("#addadmin-adminrole").val();
    var aa_password1 = $("#addadmin-password1").val();
    var aa_password2 = $("#addadmin-password2").val();
    var aa_firstname = $("#addadmin-firstname").val();
    var aa_lastname = $("#addadmin-lastname").val();
    var aa_email = $("#addadmin-email").val();

    //Validate input
    if(aa_username == "" || aa_password1 == "" || aa_password2 == "" || aa_firstname == "" || aa_lastname == "")
      $("#add-admin-error").html("Please enter fields");
    else if(aa_password1 != aa_password2)
      $("#add-admin-error").html("Passwords do not match");
    else
    {
      //Create data object for request
      var aa_data = {
        'username' : aa_username,
        'password' : aa_password1,
        'first_name' : aa_firstname,
        'last_name' : aa_lastname,
        'role_id' : aa_adminrole   
      }

      if(aa_email != "")
        aa_data['email'] = aa_email;
        
      $.ajax
      ({
        type: "PUT",
        url: urlpath + "/admin",
        data: aa_data,
        async: false,
        beforeSend: function (xhr) {
            xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));
        },
        success: function (){
          //Successful add admin
          //Add admin card to page
          $.getJSON(urlpath + "/admin", function(data) {
            for (var i = 0; i < data.length; i++) {
              if(aa_username == data[i].username)
              {
                addAdminCard(data[i].admin_id, data[i].username, data[i].role.role_name, data[i].first_name, data[i].last_name, data[i].email);
                login();
                break;
              }
            }
          });
          
          //Clear input
          document.getElementById('add-admin-form').reset();
          $("#add-admin-error").html("");
          
          $("#modal-add-admin").closeModal();
  
          popup("Admin added");
        },
        statusCode: {
          409: function () {
             $("#add-admin-error").html("Username already exists");
          }
        },
        error: function (){
          $("#add-admin-error").html("Error: Admin not added");
        }
      });
    }
  });
  
  //Close add admin modal form with click of X icon
  $('#modal-add-admin .modalclosex').click(function() {
  	$('#modal-add-admin').closeModal({
        out_duration: 200,
  	});
    document.getElementById('add-admin-form').reset();
    $("#add-admin-error").html("");
  });
  
	//--------------MODAL CODE FOR ADDING SUBCATEGORY--------------//
  $("#add-subcategory-button").click(function() {
    $('#modal-add-subcategory').openModal({
      complete: function() {
        document.getElementById('add-subcategory-form').reset();
        $("#add-subcategory-error").html("");
      }
    });
  });
  
  //Submit action
  $('#add-subcategory-submit').click(function() {
    var new_subcategory = $("#addsub-subcategory").val();
    
    //Validate input
    if(new_subcategory == "")
      $("#add-subcategory-error").html("Please enter subcategory");
    else
    {
      $.ajax
      ({    
        type: "PUT",
        url: urlpath + "/subcategories",
        data: {'subcategory_name' : new_subcategory},
        async: false,
        beforeSend: function (xhr) {
            xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));
        },
        success: function (){
          //Successful add subcategory
          displaySubcategories();
          populateSelectSubcategories();
        
          //Clear input
          document.getElementById('add-subcategory-form').reset();
          $("#add-subcategory-error").html("");
          
          $("#modal-add-subcategory").closeModal();
          
          popup("Subcategory added");
        },
        statusCode: {
          409: function () {
             $("#add-subcategory-error").html("Subcategory already exists");
          }
        },
        error: function (){
          $("#add-subcategory-error").html("Error: Subcategory not added");
        }
      });
    }
  });
 
  //Close add change role modal form with click of X icon
  $('#modal-add-subcategory .modalclosex').click(function() {
  	$('#modal-add-subcategory').closeModal({
        out_duration: 200,
  	});
    document.getElementById('add-subcategory-form').reset();
    $("#add-subcategory-error").html("");
  });

	//--------------MODAL CODE FOR ADDING BUSINESS--------------//
  $("#add-business-button").click(function() {
      
      $('#modal-add-business').openModal({
        complete: function() {
          document.getElementById('add-business-form').reset();
          $("#add-business-error").html("");
        }
      });
    }); 
    
    $("#add-business-submit").click(function() {
      //Get business info from modal
      var ab_name = $("#addbusiness-name").val();
      var ab_phone = $("#addbusiness-phone").val();
      var ab_streetnumber = $("#addbusiness-streetnumber").val();
      var ab_streetname = $("#addbusiness-streetname").val();
      var ab_website = $("#addbusiness-website").val();
      var ab_city = $("addbusiness-city").val();
      var ab_state = $("#addbusiness-state").val();
      var ab_zip = $("#addbusiness-zip").val();
      var ab_hours = $("#addbusiness-hours").val();
      var ab_businesstype = $("#addbusiness-businesstype").val();
      var ab_subcategories = $("#addbusiness-subcategories").val();
      var ab_desc = $("#addbusiness-desc").val();

      //Generate data object for request
      var ab_data = {
        'category_id' : ab_businesstype,
        'business_name' : ab_name
      }

      if(ab_phone != "")
        ab_data['phone'] = ab_phone;
      if(ab_streetnumber != "")
        ab_data['street_number'] = ab_streetnumber;
      if(ab_streetname != "")
        ab_data['street_name'] = ab_streetname;
      if(ab_website != "")
        ab_data['website'] = ab_website;
      if(ab_city != "")
        ab_data['city'] = ab_city;
      if(ab_state != "")
        ab_data['state'] = ab_state;
      if(ab_zip != "")
        ab_data['zip'] = ab_zip;
      if(ab_hours != "")
        ab_data['hours_entry'] = ab_hours;
      if(ab_desc != "")
        ab_data['description'] = ab_desc;

      //validate input
      if(ab_name == "" || ab_businesstype == null)
        $("#add-business-error").html("Please enter business name and type");
      else
      {
        $.ajax
        ({    
          type: "PUT",
          url: urlpath + "/businesses",
          data: ab_data,
          async: false,
          beforeSend: function (xhr) {
              xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));
          },
          success: function (){
            //Successful add business
            displayBusinesses();
            
            var businessid = 0;
            //Get business id and add subcategories
            $.getJSON(urlpath + "/businesses", function(data) {
              for (var i = 0; i < data.length; i++) {
                if(businessid < parseInt(data[i].id))
                  businessid = data[i].id;
              }

              //Parse subcategory object to string for API
              var ab_subcategories_str = JSON.stringify(ab_subcategories);
              ab_subcategories_str = ab_subcategories_str.replace(/[\[\]\"]+/g,'');
              
              //Add subcategories
              if(ab_subcategories != "")
              {
                $.ajax
                ({    
                  type: "POST",
                  url: urlpath + "/businesses/" + businessid + "/subcategory",
                  data: {
                    'subcategories' : ab_subcategories_str
                  },
                  async: true,
                  beforeSend: function (xhr) {
                      xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));
                  },
                  success: function (){
                      //Successful add subcategories
                  }
                });
              }           
            });
            
            //Clear input
            document.getElementById('add-business-form').reset();
            $("#add-business-error").html("");
            
            $("#modal-add-business").closeModal();
    
            popup("Business added");
          },
          error: function (){
            $("#add-admin-error").html("Error: Business not added");
          }
        });
      }
    });
    
    //Close add admin modal form with click of X icon
    $('#modal-add-business .modalclosex').click(function() {
    	$('#modal-add-business').closeModal({
          out_duration: 200,
    	});
      document.getElementById('add-business-form').reset();
      $("#add-business-error").html("");
    });

});
