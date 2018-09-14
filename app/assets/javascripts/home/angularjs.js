var navbarApp = angular.module('navbarApp',[]);
navbarApp.controller('navbarController', function($scope,$http){
  $http.get("http://localhost:3000/api/v1/home/categories")
  .then(function(response){
        $scope.categories = response.data.category
        $scope.myCategory = function(id){
          $http.get("http://localhost:3000/api/v1/home/categories/"+id)
          .then(function(res){
              $scope.categoriesId = res.data.categoryid
          });
        };
      
    });
});