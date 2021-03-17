$(document).on('turbolinks:load', function() {
    if(!document.URL.match("/answer/")){
        clearInterval(time);
    }
});   
   var count = 600;
        var countdown = function(){
            (count--);
            document.getElementById('timer').textContent = count;    
        }
    var time = setInterval(function(){
        countdown();
        if(count == 0){
            clearInterval(time);
            document.getElementById('end').click();
        }
        
    },1000);
