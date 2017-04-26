$(document).on('turbolinks:load', function(){
     $('#carriage_type').change('turbolinks:change', function(){

         var top_seats = $('.top_seats');
         var bottom_seats = $('.bottom_seats');
         var side_top_seats = $('.side_top_seats');
         var side_bottom_seats = $('.side_bottom_seats');
         var only_seat = $('.only_seat');

         switch ($(this).val()){
             case 'EconomyCarriage':
                 top_seats.show();
                 bottom_seats.show();
                 side_top_seats.show();
                 side_bottom_seats.show();
                 only_seat.hide();
                 break;
             case 'CoupeCarriage':
                 top_seats.show();
                 side_top_seats.hide();
                 side_bottom_seats.hide();
                 bottom_seats.show();
                 only_seat.hide();
                 break;
             case 'CbCarriage':
                 top_seats.hide();
                 side_top_seats.hide();
                 side_bottom_seats.hide();
                 bottom_seats.show();
                 only_seat.hide();
                 break;
             case 'SeatCarriage':
                 top_seats.hide();
                 side_top_seats.hide();
                 side_bottom_seats.hide();
                 bottom_seats.hide();
                 only_seat.show();
                 break;
             default:
                 break;
         };
     });
 });
