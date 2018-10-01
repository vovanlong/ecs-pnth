var HomeApp = angular.module('HomeApp',[]);
var url = "http://localhost:3000/"+"api/v1/"
HomeApp.controller('navbarController', function($scope,$http){
  $http.get(url+"home/categories")
  .then(function(response){
    $scope.categories = response.data.category
    console.log( $scope.categories )
    $scope.myCategory = function(id){
    $http.get(url+"home/categories/"+id)
     .then(function(res){
        $scope.categoriesId = res.data.categoryid
        
      });
    $scope.clickLink = function(id){
      window.location.replace("/category/"+id);
     }
      };
    });
    $scope.redirectHome = function(){
      window.location.replace("/");
    }
    var userId = document.getElementById('user').getAttribute('data-value');
   
    var request = {
      method: 'GET',
      url: url+'carts',
      headers: {
        'Authorization': userId
      }
    }
    $http(request)
    .then(function(res){
      $scope.carts = res.data.cart
    });
    $scope.redirect =function(id){
      window.location.replace("/carts/"+id)
    }
});

HomeApp.controller('popularProductController',function($scope,$http){
  $scope.clickDetail = function(id){
    window.location.replace("/product/"+id);
  }
  $http.get(url+"home/products/popular")
  .then(function(res){
    $scope.popularProducts = res.data.product_popular
    var listPopulars = $scope.popularProducts
    var vm = this;
    vm.listPopular = listPopulars
    $scope.limit = 3;
    $scope.stars =0
    $scope.range = function(min, max, step) {
      step = step || 1;
      var input = [];
      for (var i = 1; i <= min; i += step) {
          input.push(i);
      }
      return input;
  };
  $scope.starnone = function(star){
    var input = []
    for(var i=star;i<5;i++){
      input.push(i);
    }
    return input;
  };
    $scope.loadMore = function(){
     if($scope.limit == 3){
      console.log(vm.listPopular)
      var increamented =  vm.limit + 3;
      $scope.limit = increamented >  vm.listPopular.length ? vm.listPopular.length : increamented;
     }else{
      $scope.limit = 3;
     }
    };
  });
});

HomeApp.controller('detailController',function($scope,$http){
  var full_url = document.URL;
  var url_array = full_url.split('/')
  var id_product = url_array[url_array.length-1];
  $scope.angularjs = function(){
    console.log("long")
  }
  
  $scope.delete = function(count,quantity){
    if (count < 0) {
      swal("Cảnh báo", "Không được chọn số lượng như vậy", "error");
      // swal({
      //   title: "Cảnh báo",
      //   text: "Trong kho không có "+ count +" bạn hãy chọn lại",
      //   icon: "success",
      //   button: "OK!",
      // });
    }
  };
  $scope.add = function(count,quantity){
    if (quantity < count) {
      swal("Cảnh báo", "Trong kho chỉ có "+ quantity +" sản phẩm bạn hãy chọn lại", "error");
    }
  };
  $http.get(url+"home/products/detail/"+id_product)
  .then(function(res){
    $scope.detail = res.data.product_detail
    $scope.picture = res.data.product_detail.photos
    console.log($scope.picture)
    $scope.active = function(v){
      if (v == 0) {
        return 'active'
      } else {
        return ''
      }
    };
  });
  $scope.redirecLogin =  function(){
    window.location.replace("/login");
  }
  $scope.addCart = function(quantity,price,product_id,user_id){
    console.log("long id "+ user_id)
    var data = $.param({
      none: "",
      price: price,
      quantity: quantity,
      product_id: product_id
    });
    var config = {
      headers : {
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;',
          'Authorization': user_id
        }
    }
    $http.post(url+'carts',JSON.stringify(data),config)
    .then(function(data){
        $scope.PostDataResponse = data.data;
        // sweet()
        if ($scope.PostDataResponse.status == "200") {
          swal("Cảm ơn", $scope.PostDataResponse.message, "success");
        }else if ($scope.PostDataResponse.status == "404"){
          swal("Không được", $scope.PostDataResponse.message, "error");
        }
        
        
    })
    
  }
});
function sweet(message){
  console.log(message)
  swal({
    title: "Cảm ơn",
    text: message,
    icon: "success",
    button: "Aww yiss!",
  });
}
HomeApp.controller('newProductController',function($scope,$http){
  $http.get(url+'home/products/new')
  .then(function(res){
   $scope.newProduct = res.data.product
  });
  $scope.clickDetail = function(id){
    window.location.replace("/product/"+id);
  }
});

HomeApp.directive('indexCart', function(){
  
  return {
    restrict: 'AECM',
    template: "<div class='row'>"+
    "<div class='col-md-9'>"+
      "<h3>Shopping Cart Table</h3>"+
    "</div>"+
    "<div class='col-md-12'>"+
      "<div class='card card-plain'>"+
        "<div class='card-body'>"+
          "<div class='table-responsive'>"+
            "<table class='table table-shopping'>"+
              "<thead class=''>"+
                "<th class='text-center'>"+
                "Hình ảnh sản phẩm</th>"+
                "<th>Tên sản phẩm</th>"+
                "<th>Số Lượng</th>"+
                "<th class='text-right'>Giá</th>"+
                "<th class='text-right'>Số lượng mua</th>"+
                "<th class='text-right'>Tổng tiền</th>"+
              "</thead>"+
             " <tbody>"+
                "<tr ng-repeat='cart in cartObject'>"+
                  "<td>"+
                    "<div class='img-container'>"+
                     "<img src='{{cart.product.first_photo.image.url}}' alt='...'>"+
                    "</div>"+
                  "</td>"+
                  "<td class='td-name'>"+
                    "<a href='#jacket'>{{cart.product.name}}</a>"+
                    "<br /><small>by {{cart.product.getCategory.name}}</small>"+
                  "</td>"+
                  "<td ng-init='quantityProduct=cart.product.quantity'>"+
                    "{{quantityProduct}}"+
                  "</td>"+
                  "<td class='td-number'>"+
                    "<small>€</small>{{cart.product.price}}"+
                  "</td>"+
                  "<td class='td-number'>"+
                    "{{count}}"+
                    "<div class='btn-group' ng-init='count=cart.quantity'>"+
                      "<button class='btn btn-info btn-sm' ng-click='count = count - 1;reductionFunct({count,cartId: cart.id, totalProduct: cart.product.quantity})'> <i class='now-ui-icons ui-1_simple-delete'></i> </button>"+
                      "<button class='btn btn-info btn-sm' ng-click='count = count + 1;increaseFunct({count,cartId: cart.id,totalProduct: cart.product.quantity})'> <i class='now-ui-icons ui-1_simple-add'></i> </button>"+
                    "</div>"+
                  "</td>"+
                 "<td class='td-number'>"+
                    "<small>€</small><span id='totalPrice' value='2'>{{count * cart.product.price}}</span>"+
                  "</td>"+
                  "<td class='td-actions'>"+
                    "<button type='button' rel='tooltip' data-placement='left' title='Remove item' ng-click='remoteFunct({index: $index, cartId: cart.id,name: cart.product.name})' class='btn btn-neutral'>"+
                      "<i class='now-ui-icons ui-1_simple-remove'></i>"+
                    "</button>"+
                 "</td>"+
                "</tr>"+
                "<tr>"+
                  "<td colspan='3'>"+
                  "</td>"+
                  "<td class='td-total'>"+
                   " Total"+
                  "</td>"+
                  "<td class='td-price'>"+
                    "<small>€</small>2,346"+
                 " </td>"+
                  "<td colspan='3' class='text-right'>"+
                    "<button type='button' rel='tooltip' class='btn btn-info btn-round' data-toggle='modal' data-target='.bd-example-modal-lg'>"+
                      "Complete Purchase"+
                       " <i class='now-ui-icons arrows-1_minimal-right'></i>"+
                    "</button>"+
                  "</td>"+
                "</tr>"+
              "</tbody>"+
            "</table>"+
          "</div>"+
        "</div>"+
      "</div>"+
    "</div>"+
    "</div>",
    replace: true,
    scope: {
      cartObject: '=',
      totalQuantity: '&',
      userId: '@',
      totalPrice: '=',
      remoteFunct: '&',
      increaseFunct: '&',
      reductionFunct: '&'
    },
    // controller: function($scope){
    //   $scope.removeFunct({person: count}) 
    // }
  }
});
HomeApp.controller('cartController', function($scope,$http){
  
  var full_url = document.URL;
  var url_array = full_url.split('/')
  var id_product = url_array[url_array.length-1];
  // $scope.userId = 0;
  // $scope.getUserId = function(id){$scope.userId =  id} 
  // console.log($scope.userId)
  var div1 = document.getElementById("tableCart");
  var userId = div1.getAttribute("value");
  console.log(userId)
  $scope.increase = function(count,cartId,totalProduct){
    console.log("nguyenchimax"+cartId)
    if(totalProduct >= count){
      $http.get(url+'carts/'+cartId+'/add/'+count)
      .then(function(res){
        console.log(totalProduct)
        if(res.data){
          swal("Không được", res.data.message, "error");
        }
      })
    }else{
      swal("Cảnh báo", "Hàng trong kho chỉ có "+totalProduct+" bạn không thể chọn thêm", "error");
    }
   
  }
  $scope.reduction = function(count,cartId,totalProduct){
    console.log("nguyenchimax"+cartId)
    if (totalProduct <= count ) {
      $http.get(url+'carts/'+cartId+'/remove/'+count)
    .then(function(res){
      console.log(res)
    })}else{
      swal("Cảnh báo", "Hàng trong kho chỉ có "+0+" bạn không thể chọn thêm", "error");
    }
    
  }
  var request = {
    method: 'GET',
    url: url+'carts',
    headers: {
      'Authorization': userId
    }
  }
  $http(request)
  .then(function(res){
      $scope.carts = res.data.cart
  });
  $scope.removeItem = function(index,cartId, name) {
    swal({
      title: "Xóa sản phẩm",
      text: "Bản sẽ xóa sản phẩm" + name,
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: '#DD6B55',
      confirmButtonText: 'OK',
      closeOnConfirm: false,
      //closeOnCancel: false
    },
    function(){
      $http.get(url+'carts/'+cartId+'/remove')
      .then(function(res){
      $scope.carts.splice(index, 1);
      swal("Xóa sản phẩm!", "bạn đã xóa "+name+" ra khỏi giỏ hàng", "success");
    });
     
    });
    
    
} 
$scope.submitForm = function(){
  // data-dismiss="modal" aria-hidden="true"
  document.getElementById('order').setAttribute("data-dismiss","modal");
  var data = $.param({
    none: "",
    name: $scope.receiver,
    phone_number: $scope.phone,
    address: $scope.address
  })
  var config = {
    headers:{
      'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;',
      'Authorization': userId
    }
  }
  $http.post(url+'order',JSON.stringify(data), config)
  .then(function(data){
   console.log(data)
  });
}
  $scope.totalQuantity = function(){
    return '1'
  }
});

HomeApp.controller('information', function($scope,$http){
  var userId = document.getElementById('table').getAttribute('data-value');
  console.log(userId)
  var config = {
    headers:{
      'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;',
      'Authorization': userId
    }
  }
  $http.get(url+'order/info',config)
  .then(function(res){
    $scope.orderinfo = res.data.order
    
  });

  
});
