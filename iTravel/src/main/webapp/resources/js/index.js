

$(function(){

    $('#emailCreate').blur(function(event){
        event.preventDefault();
        $.ajax( "emailChecker", {
            "type" : "GET",
            "data" : {"email" : $("input[name='email']").val()}
        }).done(function(response){
                if (response == 'true' ){
                    $("#createBtn").disable();
                    $("#emailCreate").css("color", "red");
                }
                else{
                    $("#emailCreate").css("border", "");
                    $("#createBtn").enable();
                }
            }).fail(function (){
                alert("Failed!");
            }
        )}); //Ajax to check if email exists in DB




    $('#email').focus(function(){
        $('#emailExists').hide();
    });
});

