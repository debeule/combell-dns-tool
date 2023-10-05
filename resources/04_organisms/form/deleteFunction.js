$(function () {
    $("#checkbox_form, #deleteUsers_form").submit(function(e){
        e.preventDefault();

        var form = this;
        var formId = form.id;
        var url = (formId == "checkbox_form") ? 'deleteRecord' : 'deleteUser';

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $.ajax({
            type: "POST",
            url: url,
            data: new FormData(form),
            cache:false,
            processData: false, 
            contentType: false   
        })
    });
});