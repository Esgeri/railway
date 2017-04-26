$(document).ready(function() {
  $('.search_form').submit(function() {
    var start_station;
    var end_station;

    start_station = $(this).find("#search_start_station_id");
    end_station = $(this).find("#search_end_station_id");

    console.log(start_station);
    console.log(end_station);

    if(start_station.val() == end_station.val()) {
        alert('Выберите конечную станцию');
        return false;
    }
  });
});
