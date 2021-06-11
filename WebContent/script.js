$(document).ready(function(){
    $('#usePoint').click(function(){
        if(this.checked){
            $('#inputPoint').attr('disabled', false);
        }
        else{
            $('#inputPoint').attr('disabled', true);
        }
    });
});


document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);

 function moveGoogleform(){
    location.href='intent://docs.google.com/forms#Intent;scheme=http;package=com.android.chrome;end' 
    }

    

