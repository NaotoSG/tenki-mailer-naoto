$(function() {
  // var OPEN_WEATHER_API_KEY
  var city = 'Fukuoka';
  var url = 'http://api.openweathermap.org/data/2.5/forecast?q=' + city + ',jp&units=metric&APPID=' + OPEN_WEATHER_API_KEY;
  $.ajax({
    url: url,
    dataType: "json",
    type: 'GET',
  })
  .done(function(weather_data) {
  })
  .fail(function(weather_data) {
  });
});
