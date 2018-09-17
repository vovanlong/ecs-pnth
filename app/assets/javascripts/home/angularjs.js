var HomeApp = angular.module('HomeApp',[]);
HomeApp.controller('navbarController', function($scope,$http){
  $http.get("http://localhost:3000/api/v1/home/categories")
  .then(function(response){
    $scope.categories = response.data.category
    $scope.myCategory = function(id){
    $http.get("http://localhost:3000/api/v1/home/categories/"+id)
     .then(function(res){
        $scope.categoriesId = res.data.categoryid
        
      });
    $scope.clickLink = function(id){
      window.location.replace("/category/"+id);
     }
      };
    });
});
HomeApp.controller('popularProductController',function($scope,$http,){
  $http.get("http://localhost:3000/api/v1/home/products/popular")
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
