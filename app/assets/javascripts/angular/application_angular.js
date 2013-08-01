var app = angular.module('ENSearch', []);

app.config([
  "$httpProvider", function($httpProvider){
    $httpProvider.defaults.headers.common['X_CSRF_Token'] = $('meta[name=csrf-token').attr('content');
  }
]);