// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets
//= require admin/grasp_mobile_progress_circle.min
//= require admin/jquery.cookie
//= require Chart.min
//= require toastr
//= require admin/categories
//= require dropzone
//= require jquery.mCustomScrollbar.concat.min
//= require admin/front 
//= require admin/validetta.min
//= require angular
//= require sweetalert
//= require turbolinks
//= require_tree .
var url = "http://localhost:3000/api/v1/"
function deleteSwal(id, name){
  swal({
    title: "Thông báo",
    text: "Bạn có muốn xóa " + name,
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: '#DD6B55',
    confirmButtonText: 'OK!',
    cancelButtonText: "Không",
    closeOnConfirm: false,
    closeOnCancel: true
  },
  function(isConfirm){
    if(isConfirm){
        $('.button-'+id).click();
    }
  })
};
$(document).ready(function(){
  $("form").validetta({
    errorClass : 'validetta-error',
    bubblePosition: 'bottom',
    bubbleGapTop: 10,
    bubbleGapLeft: -5,
    realTime : true,
  },
  {
    required  : 'Please fill out this field as it is required.',
    email : 'Please enter a valid email address.'
  });
});
var full_url = document.URL;
var url_array = full_url.split('/')
var id_product = url_array[url_array.length-2];

var app = angular.module("myLong",[]);
app.controller("myCtrl", function($scope,$http){
  console.log("URL "+ id_product)
  var name_product = angular.element($('#product_name')).val();
  var description_product = angular.element($('#message_area')).val();
  var quantity_product = angular.element($('#product_quantity')).val();
  var categoryid_product = angular.element($('#product_quantity')).val();
  $scope.name = "" || name_product;
  $scope.description = "" || description_product;
  $scope.quantity = "" || quantity_product;
  
  
  $http.get(url+"categories")
  .then(function(response){
    $scope.longs = response.data.category
    console.log($scope.longs)
    
  })

  $scope.value = '0';
  $scope.switchLanguage = function(){
    console.log("vovanlong"+$scope.value)
    $http.get(url+"categories/"+$scope.value)
    .then(function(res){
      $scope.wills = res.data.category_id
      $scope.max = res.data.category_selected
    console.log($scope.max)
    })
  }
});
var orderApp = angular.module("orderApp",[]);
orderApp.controller("orders",function($scope,$http){
  $http.get("http://localhost:3000/api/v1/orders")
  .then(function(res){
    $scope.orders = res.data.orders
    // $scope.totalprice = [];
    //   angular.forEach($scope.orders, function(value, key) {
       
    //     var order = [];
    //     angular.forEach(value.order_details,function(v, k){
    //       order.push(v.total_price)
        
    //     });
    //     nguyenchimax=value.id
    //     var total = 0;
    //     for(var i = 0; i <order.length;i++){
    //       total += order[i]
    //     }
    //     $scope.totalprice.push(total)
    //     $scope.totalLong = total
    //     console.log($scope.totalLong)
    //   });
    //   console.log($scope.totalprice)
    //   $scope.long = function(id){
    //    console.log(id)
    //     // for(var i=1;i<=id;i++){
    //     //   return i-1
    //     // }
    //   }
  });
  
  $scope.product = function(id,user){
    console.log(id,user)
    $http.get('http://localhost:3000/api/v1/product/'+id+'/user/'+user)
    .then(function(res){
      $scope.products = res.data.products
    })
   
  }
});