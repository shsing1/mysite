/*global jQuery, config, CKEDITOR, noty*/
/*jslint browser : true, devel: true, regexp: true */
jQuery(document).ready(function ($) {
    'use strict';

    $('#login').submit(function (event) {
        event.preventDefault();

        var form = $(this),
            op = {};

        op.url = form.attr('action');
        op.data = form.serialize();
        op.success = function (result) {
            if (result.error) {
                $.my_error(result.message);
            } else {
                // $.success(result.message);
                if (result.next_url) {
                    location.href = result.next_url;
                }
            }
        };

        $.my_ajax(op, true);

    });
});