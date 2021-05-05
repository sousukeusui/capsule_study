$(document).on('turbolinks:load', function() {
    if(!document.URL.match("/answer/")){
        clearInterval(time);
    }
});
   var count = 600;
   var timer = [];
        var countdown = function(){
            (count--);
             //残り分数はintを60で割って切り捨てる
            timer[0]=Math.floor(count/60);
            //残り秒数はintを60で割った余り
            timer[1]=count % 60;
            document.getElementById('min').textContent = timer[0];
            document.getElementById('second').textContent = timer[1]; 
        }
    var time = setInterval(function(){
        countdown();
        if(count == 0){
            clearInterval(time);
            document.getElementById('end').click();
        }
        
    },1000);
