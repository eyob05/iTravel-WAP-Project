

$(function(){
    $("#emailError").hide();
    $("#tries").css('color', '#dc4734' );

    $('#emailCreate').blur(function(event){
        event.preventDefault();
        $.ajax( "emailChecker", {
            "type" : "GET",
            "data" : {"email" : $("input[name='email']").val(),}
        }).done(function(response){
                if (response == 'true' ){
                    $("#emailError").show();
                    $("#createBtn").prop('disabled' , true);
                    $("#emailCreate").css("border-bottom", "2px solid red");
                }
                else{
                    $("#emailError").hide();
                    $("#emailCreate").css("border", "");
                    $("#createBtn").prop('disabled', false);
                }
            }).fail(function (){
                alert("Failed!");
            }
        )}); //Ajax to check if email exists in DB






    $('#loginForm').submit(function(event){
        event.preventDefault();
        $.ajax( "passwordChecker", {
            type : "POST",
            data : {"email" : $("input[name='username']").val(),
                      "password": $("input[name ='password']").val()}
        }).done(function(resp){
            console.log(resp);
            let value = parseInt(resp);
            if((value % 10) > 3){
                $("#tries").css('color', '#dc4734' );
                $("#tries").html("Account Active!") ;
            }
            else if ((value % 10) === 3 ){
                $("#tries").css('color', 'white' );
                $("#tries").html("Account Deactivated! Contact Admin!") ;
                alert("Account Deactivated! Contact Admin!");
            }
            else{
                $("#tries").css('color', 'white' );
                $("#tries").html("you have " + (3 - (value % 10)) + " tries left!");
            }

            if(resp == 'PASS'){
                $("#tries").css('color', 'white' );
                $("#tries").html('Login Verified, Logging in.....').fadeTo(900,1,function(){document.location='/login'});
            }
        }).fail(function (){
                alert("Failed!");
            }
        )}); //Ajax to check if email exists in DB


    $('#email').focus(function(){
        $('#emailExists').hide();
    });
});

