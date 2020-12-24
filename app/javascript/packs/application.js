

import "bootstrap"
import "../stylesheets/application"


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

//= require jquery3
//= require popper
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

	 // $(document).on("click","#cat",function(){
  //     console.log("HEyya");
  //       var n = document.getElementById("category").value;
  //       console.log($("#category").val());
  //       console.log(n);
  //     });


	 // $(document).on("click","#subcat",function(){
	 // 	console.log("Clicked!");
	 // 	console.log($("#maincat").val());
	 // })


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
