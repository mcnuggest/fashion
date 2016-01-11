// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//require_tree .
//= require jQuery-2.1.4.min.js
//= require plugins/bootstrap/js/bootstrap
//= require plugins/slimScroll/jquery.slimscroll
//= require plugins/fastclick/fastclick
//= require bootbox-4.4.0.min.js
//= require js/app

//= require_self

if (typeof jQuery !== 'undefined') {
    (function($) {
        $('#spinner').ajaxStart(function() {
            $(this).fadeIn();
        }).ajaxStop(function() {
            $(this).fadeOut();
        });
    })(jQuery);
}

function enabledBtn(btn, isEnable) {
    if (isEnable) {
        $(btn).removeClass("hide");
    } else {
        $(btn).addClass("hide");
    }
}