$(document).ready(function () {

    function make_base_auth(user, password) {
        var tok = user + ':' + password;
        var hash = btoa(tok);
        return "Basic " + hash;
    }

    $('#login-form-submit').click(function () {
        var username = $("#login-form-username").val();
        var password = $("#login-form-password").val();
        $.ajax({
            type: "POST",
            url: "/ajax",
            dataType: 'json',
            data: $('#login-form').serialize(),
            beforeSend: function (xhr) {
                xhr.setRequestHeader('Authorization', make_base_auth(username, password));
            }
        });
    });

});