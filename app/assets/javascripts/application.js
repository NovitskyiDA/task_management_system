// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require jquery.datetimepicker
//= require rails.validations
//= require rails.validations.simple_form
//= require_tree .

var ready;
ready = function() {
    $(".title-task").hover(
        function () {
            $(this).find('.hover-over').toggle();
        }
    );

    $('#selectAll').click(function() {
        if(this.checked) {
            $(':checkbox').each(function() {
                this.checked = true;
            });
        } else {
            $(':checkbox').each(function() {
                this.checked = false;
            });
        }
    });

    $('#batch-button').click(
        function() {
            $('.batch-delete').show();
            return false;
        }
    );

    $('#datetimepicker').datetimepicker();
};
$(document).ready(ready);
$(document).on('page:load', ready);