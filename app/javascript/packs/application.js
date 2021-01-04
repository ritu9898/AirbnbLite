

import "bootstrap"
import "../stylesheets/application"
import flatpickr from "flatpickr";


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('datatables.net-bs4')
require("chartkick")
require("chart.js")

import $ from 'jquery';
global.$ = jQuery;
//= require jquery3
//= require popper
//= require turbolinks
//= rquire bootstrap

//= require bootstrap-sprockets

//= require jquery_ujs
//= require_tree .
//= require parsley


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


$(document).ready(function(){



	 // Wishlist function
	 $(document).on("click","#fav", function(){
	 	
       var changevalue = parseInt($(this).attr('value'));
       // debugger
       alert(changevalue);
       if($(this).hasClass('color_red'))
       {
       	console.log("Changed!");
       		$(this).removeClass('color_red');
       		$(this).addClass('color_white');
       }
       else
       {
       		$(this).removeClass('color_white');
       		$(this).addClass('color_red');
       }
       var url = "/favourites/add";
       $.ajax({
         headers: {
           'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
         },
         type: "get",
         url: url,
         data: {
           property_id: changevalue
         }
         // url: "/favourites/add",
         // type: "get"
       });
  
	 })


})


  $(document).ready(function() {
    $("#reset-password").on('click', function(event) {
      if ($(this).closest('form').parsley().isValid()) {
        if (confirm('Are you sure you want to reset password?')) {
          return true;
        } else {
          return false;
        }
      }
    });
    $(document).on('click', '.toggle-password', function() {
      $(this).toggleClass("fa-eye fa-eye-slash");
      var input = $($(this).attr("toggle"));
      if (input.attr("type") == "password") {
        input.attr("type", "text");
      } else {
        input.attr("type", "password");
      }
    });



  });


  $(document).ready(function () {
  $("#search").on('keyup',function(){
   var data = $('#search').val();
   // alert(data);
   var url="/properties/search";
   $.ajax({
    type : "get",
    url : url,
    data : {"data":data}
  });
 });

  $("#searchButton").on('click',function(){
   var data = $('#searchData').val();
   // alert(data);
   var url="/properties/search";
   $.ajax({
    type : "get",
    url : url,
    data : {"data":data}
  });
 });


  $("#book").on("click",function(){

    var data = $("#date").val();
    alert(data);

  });


  // DataTable
  $('#example').DataTable();

});



// Dashboard script

// $(document).ready(function() {
//       $().ready(function() {
//         $sidebar = $('.sidebar');
//         $navbar = $('.navbar');
//         $main_panel = $('.main-panel');

//         $full_page = $('.full-page');

//         $sidebar_responsive = $('body > .navbar-collapse');
//         sidebar_mini_active = true;
//         white_color = false;

//         window_width = $(window).width();

//         fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();



//         $('.fixed-plugin a').click(function(event) {
//           if ($(this).hasClass('switch-trigger')) {
//             if (event.stopPropagation) {
//               event.stopPropagation();
//             } else if (window.event) {
//               window.event.cancelBubble = true;
//             }
//           }
//         });

//         $('.fixed-plugin .background-color span').click(function() {
//           $(this).siblings().removeClass('active');
//           $(this).addClass('active');

//           var new_color = $(this).data('color');

//           if ($sidebar.length != 0) {
//             $sidebar.attr('data', new_color);
//           }

//           if ($main_panel.length != 0) {
//             $main_panel.attr('data', new_color);
//           }

//           if ($full_page.length != 0) {
//             $full_page.attr('filter-color', new_color);
//           }

//           if ($sidebar_responsive.length != 0) {
//             $sidebar_responsive.attr('data', new_color);
//           }
//         });

//         $('.switch-sidebar-mini input').on("switchChange.bootstrapSwitch", function() {
//           var $btn = $(this);

//           if (sidebar_mini_active == true) {
//             $('body').removeClass('sidebar-mini');
//             sidebar_mini_active = false;
//             blackDashboard.showSidebarMessage('Sidebar mini deactivated...');
//           } else {
//             $('body').addClass('sidebar-mini');
//             sidebar_mini_active = true;
//             blackDashboard.showSidebarMessage('Sidebar mini activated...');
//           }

//           // we simulate the window Resize so the charts will get updated in realtime.
//           var simulateWindowResize = setInterval(function() {
//             window.dispatchEvent(new Event('resize'));
//           }, 180);

//           // we stop the simulation of Window Resize after the animations are completed
//           setTimeout(function() {
//             clearInterval(simulateWindowResize);
//           }, 1000);
//         });

//         $('.switch-change-color input').on("switchChange.bootstrapSwitch", function() {
//           var $btn = $(this);

//           if (white_color == true) {

//             $('body').addClass('change-background');
//             setTimeout(function() {
//               $('body').removeClass('change-background');
//               $('body').removeClass('white-content');
//             }, 900);
//             white_color = false;
//           } else {

//             $('body').addClass('change-background');
//             setTimeout(function() {
//               $('body').removeClass('change-background');
//               $('body').addClass('white-content');
//             }, 900);

//             white_color = true;
//           }


//         });

//         $('.light-badge').click(function() {
//           $('body').addClass('white-content');
//         });

//         $('.dark-badge').click(function() {
//           $('body').removeClass('white-content');
//         });
//       });
//     });



// $(document).on('turbolinks:load', function(){
   
// })

