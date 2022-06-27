var display = true;
$(function(){
    window.addEventListener("message", function(event){   
        if(event.data.action == 'setStreetName'){
            $('.streetname').text(event.data.streetname);
        }else if(event.data.action == 'togglecompass'){
            if (display) {
                $('.streetname').fadeOut();
            } else {
                $('.streetname').fadeIn();
            }
            display = !display;
        }
        if(display == true){
            $('.streetname').fadeIn(1000);
        }else if(event.data.incar == false || display == false){
            $('.streetname').fadeOut();
        }
    });
});
        
$(function() {
    $("#all").draggable();
});