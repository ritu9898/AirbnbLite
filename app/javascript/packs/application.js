

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
//= require jquery
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
       // alert(changevalue);
       // if($(this).hasClass('color_red'))
       // {
       // 	console.log("Changed!");
       // 		$(this).removeClass('color_red');
       // 		$(this).addClass('color_white');
       // }
       // else
       // {
       // 		$(this).removeClass('color_white');
       // 		$(this).addClass('color_red');
       // }
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
 //  $("#search").on('keyup',function(){
 //   var data = $('#search').val();
 //   // alert(data);
 //   var url="/properties/search";
 //   $.ajax({
 //    type : "get",
 //    url : url,
 //    data : {"data":data}
 //  });
 // });

 // Star for Review
  var prev = 0;
  var total_rating = 0, total_reviewers = 0;
  $(".star").on("click", function(){

    console.log("Clicked on a star");
    var id = $(this).attr('id');
    alert(id+" "+prev);
    total_rating += id;
    total_reviewers++;
    if(id - 1 > 0)
    {
      for(let i=1;i<=id;i++)
      {
        $("#"+i).removeClass('uncolored_star');
        $("#"+i).addClass('colored_star');
      }
    }

    if(id < prev)
    {
      console.log("Inside the condition")
      for(let i=id+1;i<=prev;i++)
      {
        // console.log("Loooooop111111111");
        
        // $("#"+i).removeClass('colored_star');
        $("#"+i).addClass('uncolored_star');
      }
    }
    prev = id;
    // $(this).addClass("colored_star");

    let avg = total_rating / total_reviewers;

    $.ajax({
      headers: {
           'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
         },
      type: 'GET',
      url: 'rating',
      data: {star : id, avg: avg},
      dataType : 'script',
      success: function(data) {
        // $("#unique").html(data);
      }
    })

  })


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
  $('#example1').DataTable();

});




